/* 
  Proyecto HIRI usando BLE - Versión 0.02
  Descripción:
  Este proyecto utiliza un ESP32 C3 para recolectar datos del sensor plantower 5003st y transmitirlos vía BLE.
  También incluye una pantalla OLED para mostrar información y un NeoPixel para indicadores visuales.

  Historial de Cambios (15/10/2025):
  - Se implementó un RTC (DS3231) como fuente de tiempo de respaldo cuando no hay conexión BLE.
  - Se ajustó el primer mensaje BLE enviado al conectar.
  - Se mejoró la gestión de datos guardados en la microSD.
  - Se implementó la recepción de latitud, longitud y timestamp desde la app.
  - Se añadió un indicador visual en OLED y NeoPixel para el estado de la conexión BLE.
  - Se implementó el modo de sueño profundo (deep sleep) cuando la batería está baja.

  Tareas Pendientes / Mejoras:
  1. **Gestión de Archivos en SD:**
     - Modificar la lógica para crear un nuevo archivo CSV para cada sesión de medición, en lugar de añadir todo a un único archivo. 
       El nombre del archivo podría basarse en el `sesionID` o el `timestamp` inicial.
     - Escribir una fila de encabezado (ej: "timestamp,lat,lon,pm25,...") al crear un nuevo archivo para que sea un CSV estándar.

  2. **Registro de Datos:**
     - Añadir una columna en el archivo CSV para registrar explícitamente el estado de la conexión BLE ("Conectado" o "Desconectado") en cada medición.

  Fecha Original: 11/09/2024
  Autor: Alejandro Rebolledo D.
*/
/*
tabla del primer dato para hacer guardado con la app
HIRI-01	 7	25:3,25:6,25:8,28:4,29:11,29:12
HIRI-02	 8	26:3,26:6,26:8,30:4,31:11,31:12
HIRI-03  9	27:3,27:6,27:8,32:4,33:11,33:12
HIRI-04	10	35:3,35:6,35:8,34:4,36:11,36:12
HIRI-05	11	38:3,38:6,38:8,37:4,39:11,39:12
HIRI-06	12	41:3,41:6,41:8,40:4,42:11,42:12
HIRI-07	13	44:3,44:6,44:8,43:4,45:11,45:12
HIRI-08	14	47:3,47:6,47:8,46:4,48:11,48:12
HIRI-09	15	50:3,50:6,50:8,49:4,51:11,51:12
HIRI-10	16	53:3,53:6,53:8,52:4,54:11,54:12
HIRI-11	17	56:3,56:6,56:8,55:4,57:11,57:12
HIRI-12	18	59:3,59:6,59:8,58:4,60:11,60:12
HIRI-13	19	62:3,62:6,62:8,61:4,63:11,63:12
HIRI-14	20	65:3,65:6,65:8,64:4,66:11,66:12
HIRI-15	21	68:3,68:6,68:8,67:4,69:11,69:12
*/

// Incluye las librerías necesarias
#include <Adafruit_NeoPixel.h>
#include "esp_adc_cal.h"
#include <SoftwareSerial.h>
#include <Wire.h>
#include <SPI.h>
#include <SD.h>
#include <TimeLib.h>
#include <U8g2lib.h>
#include <time.h>
#include <RTClib.h>
RTC_DS3231 rtc;
bool rtcOK = false;                  // no re-init en loop; solo se usa si quedó OK en setup
// Definición de variables globales
String fecha;
String horas;

// Función para actualizar las variables globales con la fecha
void actualizarFecha() {
  char bufferFecha[11];
  sprintf(bufferFecha, "%02d/%02d/%04d", day(), month(), year());
  fecha = String(bufferFecha);
}

// Función para actualizar las variables globales con la hora
void actualizarHora() {
  char bufferHora[9];
  sprintf(bufferHora, "%02d:%02d:%02d", hour(), minute(), second());
  horas = String(bufferHora);
}
// Librerías BLE
#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEServer.h>

// Variable para indicar el estado de conexión BLE
bool deviceConnected = false;

// Clase de callbacks para manejar la conexión y desconexión BLE
class MyServerCallbacks : public BLEServerCallbacks {
  void onConnect(BLEServer *pServer) {
    deviceConnected = true;
    Serial.println("Dispositivo BLE conectado");
  }

  void onDisconnect(BLEServer *pServer) {
    deviceConnected = false;
    Serial.println("Dispositivo BLE desconectado");
    // Reiniciar la publicidad para permitir nuevas conexiones
    pServer->getAdvertising()->start();
  }
};

// Definición de pines
#define BAT_ADC 2  // Pin ADC para medir voltaje de batería

// Configuración de SoftwareSerial para el sensor PMS5003
#define RX 4
#define TX 5
SoftwareSerial pms5(RX, TX);  // RX, TX

// Configuración de UART para GPS
#define GPS_RX 20  // Conectar al TX del GPS
#define GPS_TX 21  // Conectar al RX del GPS
#define GPS_BAUD 9600
HardwareSerial gpsSerial(1);

// Configuración de NeoPixel
#define NEOPIXEL_PIN 10
#define NUMPIXELS 3
#define ACTIVE_NEOPIXELS 2
Adafruit_NeoPixel pixels(NUMPIXELS, NEOPIXEL_PIN, NEO_GRB + NEO_KHZ800);

// Pines I2C depreciado no es necesario declararlos usando la placa lligo T0I Plus
//#define SDA 18
//#define SCL 19

// Pines para la tarjeta SD
#define SD_MISO 7
#define SD_MOSI 6
#define SD_SCLK 8
#define SD_CS_PIN 9


// Inicializar la pantalla
U8G2_SH1106_128X32_VISIONOX_F_HW_I2C u8g2(U8G2_R0, /* reset=*/U8X8_PIN_NONE);

// Variables para medición de voltaje de batería
float Voltage = 0.0;
float batteryVoltage = 0.0;
esp_adc_cal_characteristics_t adc_chars;
float lowBat = 3.15;  // Umbral de voltaje bajo de batería

// Variables para datos del sensor
unsigned int PMS2_5 = 0, PMS1 = 0, PMS10 = 0, TPS = 0, HDS = 0;
unsigned char bufferRTT[32] = {};  // Datos recibidos por Serial

// Variables de tiempo
unsigned long checkpms = 0;                // Última lectura de datos del sensor
const unsigned long intercheckpms = 3000;  // Intervalo entre lecturas (milisegundos)

// Disponibilidad de la tarjeta SD
bool sd_available = false;
SPIClass spiSD(SPI);
String dataString = "";// Variable para construir la línea de datos a guardar
// Variables BLE
#define VERSION "V0.02.2"
#define DEVICE_NAME "HIRI-02" /////////////////////////// cambiar segun el numero de dispositivo ya esta cargada la configuracion del primer mensaje segun la tabla
String dataLOG = "/" + String(DEVICE_NAME) + ".csv";
String id = DEVICE_NAME;

bool firstConect = true;
bool callbackRecivido = false;
// UUIDs para el servicio BLE y características
#define SERVICE_UUID "4fafc201-1fb5-459e-8fcc-c5c9c331914b"
#define CHAR_UUID_TX "beb5483e-36e1-4688-b7f5-ea07361b26a8"  // Para enviar datos 
#define CHAR_UUID_RX "6e400003-b5a3-f393-e0a9-e50e24dcca9e"  // Para recibir datos

BLECharacteristic *pTxCharacteristic;
BLECharacteristic *pRxCharacteristic;

// Buffer para mensajes recibidos por BLE
String receivedMessage = "";
// Variables para el manejo de recepcion de datos
String latitud;     // Position 1 -- code
String longitud;    // Position 2 -- code
String timestamp;   // timestamp
String sesionID;    // sensionID
String notaEVento;  // eventos especiales

// Variables para lectura GPS NMEA
static char gpsLineBuffer[160];
static int gpsLineIndex = 0;
bool gpsAnySentenceReceived = false;
bool gpsRmcSeen = false;
bool gpsGgaSeen = false;
bool gpsFixValid = false;
bool gpsAntennaOpen = false;
unsigned long gpsLastByteMs = 0;
unsigned long gpsLastReportMs = 0;
unsigned long gpsTotalBytes = 0;
unsigned long gpsTotalLines = 0;
unsigned long gpsTotalOverflow = 0;
String gpsLastSentenceType = "";
String gpsLastUtcTime = "";
String gpsLastUtcDate = "";
String gpsLastFixStatus = "";
String gpsLastSatellites = "";
String gpsLastHdop = "";
String gpsLatitude = "";
String gpsLongitude = "";
// Callback BLE para recibir datos


// Function to split the string by a delimiter and get the value at a specified index
String getValor(String data, char separator, int index) {
  int found = 0;                     // Tracks how many substrings we have found
  int strIndex[] = { 0, -1 };        // Array to store the start and end indices of the substring
  int maxIndex = data.length() - 1;  // Last index of the string
  // Loop through the string to find substrings separated by the delimiter
  for (int i = 0; i <= maxIndex && found <= index; i++) {
    if (data.charAt(i) == separator || i == maxIndex) {
      found++;
      strIndex[0] = strIndex[1] + 1;
      strIndex[1] = (i == maxIndex) ? i + 1 : i;
    }
  }
  // If the required index was found, return the substring, otherwise return an empty string
  return found > index ? data.substring(strIndex[0], strIndex[1]) : "";
}

class MyCallbacks : public BLECharacteristicCallbacks {
  void onWrite(BLECharacteristic *pCharacteristic) {
    std::string rxValue = pCharacteristic->getValue();
    if (rxValue.length() > 0) {
      receivedMessage = String(rxValue.c_str());       // dato recibido
      latitud = getValor(receivedMessage, ',', 0);     // dato sacado con la funcion para separar por comas
      longitud = getValor(receivedMessage, ',', 1);    // dato sacado
      timestamp = getValor(receivedMessage, ',', 2);   // dato sacado
      sesionID = getValor(receivedMessage, ',', 3);    // dato sacado
      notaEVento = getValor(receivedMessage, ',', 4);  // dato sacado
      Serial.println("Recibido por BLE: " + receivedMessage);
      if (receivedMessage == "OK") {
        Serial.println("RECIBI OK DESDE LA APP");
        callbackRecivido = true;
      }
      Serial.println("Latitud: " + latitud);
      Serial.println("Longitud: " + longitud);
      Serial.println("Timestamp: " + timestamp);
      Serial.println("SesionID: " + sesionID);
      Serial.println("Evento: " + notaEVento);
      // Convierte el timestamp a un entero largo (long)
      unsigned long unixTimestamp = timestamp.toInt();
      // Usa la función setTime para establecer la hora basada en el timestamp UNIX
      setTime(unixTimestamp);
      // Actualiza las variables globales con la fecha y hora actuales
      actualizarFecha();
      actualizarHora();
      // Imprime las variables globales
      Serial.print("Fecha: ");
      Serial.println(fecha);
      Serial.print("Hora: ");
      Serial.println(horas);
    }
  }
};

uint32_t readADC_Cal(int ADC_Raw) {
  return esp_adc_cal_raw_to_voltage(ADC_Raw, &adc_chars);
}

bool splitCsvFields(const String &line, String fields[], int maxFields, int &fieldCount) {
  fieldCount = 0;
  int start = 0;

  for (int i = 0; i <= line.length(); i++) {
    if (i == line.length() || line[i] == ',') {
      if (fieldCount < maxFields) {
        fields[fieldCount] = line.substring(start, i);
        int checksumIndex = fields[fieldCount].indexOf('*');
        if (checksumIndex >= 0) {
          fields[fieldCount] = fields[fieldCount].substring(0, checksumIndex);
        }
        fieldCount++;
      }
      start = i + 1;
    }
  }

  return fieldCount > 0;
}

String nmeaCoordToDecimal(const String &rawCoord, const String &hemisphere) {
  if (rawCoord.length() < 4 || hemisphere.length() == 0) {
    return "";
  }

  int degreeDigits = (hemisphere == "N" || hemisphere == "S") ? 2 : 3;
  if (rawCoord.length() <= degreeDigits) {
    return "";
  }

  double degrees = rawCoord.substring(0, degreeDigits).toDouble();
  double minutes = rawCoord.substring(degreeDigits).toDouble();
  double decimal = degrees + (minutes / 60.0);

  if (hemisphere == "S" || hemisphere == "W") {
    decimal *= -1.0;
  }

  return String(decimal, 6);
}

void updateGpsDateTime(const String &utcTime, const String &utcDate) {
  if (utcTime.length() >= 6) {
    gpsLastUtcTime =
      utcTime.substring(0, 2) + ":" +
      utcTime.substring(2, 4) + ":" +
      utcTime.substring(4, 6);
  }

  if (utcDate.length() == 6) {
    gpsLastUtcDate =
      utcDate.substring(0, 2) + "/" +
      utcDate.substring(2, 4) + "/20" +
      utcDate.substring(4, 6);
  }
}

void parseGpsRmc(const String &sentence) {
  String fields[20];
  int count = 0;

  gpsRmcSeen = true;
  if (!splitCsvFields(sentence, fields, 20, count) || count < 10) {
    return;
  }

  gpsLastFixStatus = fields[2];
  gpsFixValid = (fields[2] == "A");
  updateGpsDateTime(fields[1], fields[9]);

  if (gpsFixValid) {
    gpsLatitude = nmeaCoordToDecimal(fields[3], fields[4]);
    gpsLongitude = nmeaCoordToDecimal(fields[5], fields[6]);

    if (gpsLatitude.length() > 0 && gpsLongitude.length() > 0) {
      latitud = gpsLatitude;
      longitud = gpsLongitude;
    }
  }
}

void parseGpsGga(const String &sentence) {
  String fields[20];
  int count = 0;

  gpsGgaSeen = true;
  if (!splitCsvFields(sentence, fields, 20, count) || count < 9) {
    return;
  }

  gpsLastSatellites = fields[7];
  gpsLastHdop = fields[8];

  if (fields[6].length() > 0 && fields[6] != "0") {
    gpsFixValid = true;
    gpsLatitude = nmeaCoordToDecimal(fields[2], fields[3]);
    gpsLongitude = nmeaCoordToDecimal(fields[4], fields[5]);

    if (gpsLatitude.length() > 0 && gpsLongitude.length() > 0) {
      latitud = gpsLatitude;
      longitud = gpsLongitude;
    }
  }
}

void parseGpsTxt(const String &sentence) {
  if (sentence.indexOf("ANTENNA OPEN") >= 0) {
    gpsAntennaOpen = true;
  }
}

void parseGpsZda(const String &sentence) {
  String fields[10];
  int count = 0;

  if (!splitCsvFields(sentence, fields, 10, count) || count < 5) {
    return;
  }

  if (fields[1].length() >= 6) {
    gpsLastUtcTime =
      fields[1].substring(0, 2) + ":" +
      fields[1].substring(2, 4) + ":" +
      fields[1].substring(4, 6);
  }

  if (fields[2].length() > 0 && fields[3].length() > 0 && fields[4].length() > 0) {
    gpsLastUtcDate = fields[2] + "/" + fields[3] + "/" + fields[4];
  }
}

void processGpsLine(const char *rawLine) {
  String sentence = String(rawLine);
  sentence.trim();

  if (sentence.length() == 0 || !sentence.startsWith("$")) {
    return;
  }

  gpsAnySentenceReceived = true;
  gpsTotalLines++;
  gpsLastSentenceType = sentence.length() >= 6 ? sentence.substring(0, 6) : sentence;

  if (sentence.startsWith("$GNRMC") || sentence.startsWith("$GPRMC")) {
    parseGpsRmc(sentence);
  } else if (sentence.startsWith("$GNGGA") || sentence.startsWith("$GPGGA")) {
    parseGpsGga(sentence);
  } else if (sentence.startsWith("$GNTXT") || sentence.startsWith("$GPTXT")) {
    parseGpsTxt(sentence);
  } else if (sentence.startsWith("$GNZDA") || sentence.startsWith("$GPZDA")) {
    parseGpsZda(sentence);
  }
}

void readGpsSerial() {
  while (gpsSerial.available()) {
    char c = gpsSerial.read();
    gpsTotalBytes++;
    gpsLastByteMs = millis();

    if (c == '\n') {
      gpsLineBuffer[gpsLineIndex] = '\0';
      processGpsLine(gpsLineBuffer);
      gpsLineIndex = 0;
    } else if (c != '\r') {
      if (gpsLineIndex < (int)sizeof(gpsLineBuffer) - 1) {
        gpsLineBuffer[gpsLineIndex++] = c;
      } else {
        gpsTotalOverflow++;
        gpsLineIndex = 0;
      }
    }
  }
}

void reportGpsDebug() {
  if (millis() - gpsLastReportMs < 5000) {
    return;
  }

  gpsLastReportMs = millis();
  Serial.println("----- GPS DEBUG STATUS -----");
  Serial.println(String("GPS UART: RX=") + GPS_RX + " TX=" + GPS_TX + " baud=" + GPS_BAUD);
  Serial.println(String("Bytes: ") + gpsTotalBytes + " Lines: " + gpsTotalLines + " Overflow: " + gpsTotalOverflow);
  Serial.println(String("NMEA: ") + (gpsAnySentenceReceived ? "YES" : "NO") + " Last: " + gpsLastSentenceType);

  if (millis() - gpsLastByteMs > 3000) {
    Serial.println("GPS warning: no se reciben bytes hace mas de 3 segundos.");
  }

  Serial.println(String("RMC: ") + (gpsRmcSeen ? "YES" : "NO") + " GGA: " + (gpsGgaSeen ? "YES" : "NO"));
  Serial.println(String("Fix: ") + (gpsFixValid ? "YES" : "NO") + " Status: " + gpsLastFixStatus);
  Serial.println(String("Sat: ") + gpsLastSatellites + " HDOP: " + gpsLastHdop);
  Serial.println(String("UTC: ") + gpsLastUtcDate + " " + gpsLastUtcTime);
  Serial.println(String("Lat: ") + gpsLatitude + " Lon: " + gpsLongitude);
  Serial.println(String("Antenna open: ") + (gpsAntennaOpen ? "YES" : "NO"));
}

// Variables para el consumo de batería
const float AVERAGE_CURRENT_MA = 148.0;  // Corriente promedio en mA
unsigned long startMillis;               // Tiempo de inicio en milisegundos
float consumed_mAh = 0.0;                // Energía consumida en mAh

// Tiempo de funcionamiento
unsigned long currentMillis;
unsigned long elapsedMillis;
int seg = 0;
int minu = 0;
int hora = 0;

// Variables para el parpadeo del LED
bool ledState = false;
unsigned long previousMillis = 0;
const long interval = 500;  // Intervalo de parpadeo en milisegundos

// Variables para el parpadeo cuando no está conectado
unsigned long lastBlinkTime = 0;
unsigned long blinkInterval = 200;  // Duración del estado encendido/apagado del LED durante el parpadeo (en ms)
int blinkCount = 0;
int totalBlinks = 3;  // Número total de parpadeos
bool isBlinking = false;
unsigned long lastBlinkSequenceTime = 0;
unsigned long blinkSequenceInterval = 20000;  // Intervalo entre secuencias de parpadeo (en ms)

// Variables para manejo de la pantalla
bool displayDataSaved = false;
unsigned long dataSavedTime = 0;
const unsigned long dataSavedDisplayTime = 2000;  // Mostrar "Data saved" por 2 segundos

void setNeoPixelStatus(uint32_t color) {
  for (int i = 0; i < NUMPIXELS; i++) {
    pixels.setPixelColor(i, i < ACTIVE_NEOPIXELS ? color : 0);
  }
  pixels.show();
}

void fadeEffect(uint32_t originalColor) {
  for (int i = 255; i >= 0; i -= 15) {
    uint8_t r = (originalColor >> 16) & 0xFF;
    uint8_t g = (originalColor >> 8) & 0xFF;
    uint8_t b = originalColor & 0xFF;
    setNeoPixelStatus(pixels.Color((r * i) / 255, (g * i) / 255, (b * i) / 255));
    delay(20);
  }

  // Restaurar el color original
  setNeoPixelStatus(originalColor);
}

void setup() {
  // Inicializar Serial
  Serial.begin(115200);
  // Inicializar NeoPixel
  pixels.begin();
  // Inicializar los dos primeros NeoPixel a color azul durante el inicio.
  // El tercer NeoPixel queda apagado/pendiente.
  setNeoPixelStatus(pixels.Color(0, 0, 255));  // Azul

  // Inicializar I2C
  //Wire.begin(SDA, SCL); //depreciado no es necesario usarlo con la placa lligo T0I Plus

  // Inicializar pantalla
  u8g2.begin();
// RTC (una sola vez)
  Serial.println("[RTC] test");
  if (!rtc.begin()) {
    Serial.println("[RTC] Not found");
    rtcOK = false;
  } else {
    rtcOK = true;
    //rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));// [para actualizar la hora con el upload del codigo]
    DateTime now = rtc.now();

    Serial.print(now.year(), DEC);
    Serial.print('/');
    Serial.print(now.month(), DEC);
    Serial.print('/');
    Serial.print(now.day(), DEC);
    Serial.print(" HORA ");
    Serial.print(now.hour(), DEC);
    Serial.print(':');
    Serial.print(now.minute(), DEC);
    Serial.print(':');
    Serial.print(now.second(), DEC);
    Serial.println();
  }
  // Inicializar medición de voltaje de batería
  esp_adc_cal_characterize(ADC_UNIT_1, ADC_ATTEN_DB_11, ADC_WIDTH_BIT_12, 1100, &adc_chars);

  // Inicializar SPI para tarjeta SD
  spiSD.begin(SD_SCLK, SD_MISO, SD_MOSI, SD_CS_PIN);

  if (!SD.begin(SD_CS_PIN, spiSD)) {
    // Error al inicializar la tarjeta SD
    sd_available = false;
    Serial.println("¡Error al inicializar la tarjeta SD!");
    // Mostrar mensaje en OLED
    u8g2.clearBuffer();
    u8g2.setFont(u8g2_font_5x7_tr);
    u8g2.drawStr(0, 8, "SD no encontrada");
    u8g2.sendBuffer();
    // Cambiar color del LED a morado para indicar error en SD
    setNeoPixelStatus(pixels.Color(128, 0, 128));  // Morado
  } else {
    sd_available = true;
    Serial.println("Tarjeta SD inicializada.");
    // Mostrar mensaje en OLED
    u8g2.clearBuffer();
    u8g2.setFont(u8g2_font_5x7_tr);
    u8g2.drawStr(0, 8, "SD encontrada");
    u8g2.sendBuffer();
    // Cambiar color del LED a verde para indicar SD correcta
    setNeoPixelStatus(pixels.Color(0, 255, 0));  // Verde
  }

  // Inicializar SoftwareSerial para el sensor PMS
  pms5.begin(9600);

  // Inicializar UART del GPS en GPIO20/GPIO21
  gpsSerial.begin(GPS_BAUD, SERIAL_8N1, GPS_RX, GPS_TX);

  // Inicializar BLE
  Serial.println("Iniciando BLE...");
  BLEDevice::init(DEVICE_NAME);
  BLEServer *pServer = BLEDevice::createServer();

  // Asignar los callbacks para el estado de conexión
  pServer->setCallbacks(new MyServerCallbacks());

  // Crear servicio BLE
  BLEService *pService = pServer->createService(SERVICE_UUID);

  // Crear características BLE
  pTxCharacteristic = pService->createCharacteristic(
    CHAR_UUID_TX,
    BLECharacteristic::PROPERTY_NOTIFY | BLECharacteristic::PROPERTY_READ  // Conservado según lo solicitado
  );

  pRxCharacteristic = pService->createCharacteristic(
    CHAR_UUID_RX,
    BLECharacteristic::PROPERTY_WRITE);

  pRxCharacteristic->setCallbacks(new MyCallbacks());

  // Iniciar el servicio
  pService->start();

  // Iniciar publicidad
  BLEAdvertising *pAdvertising = BLEDevice::getAdvertising();
  pAdvertising->addServiceUUID(SERVICE_UUID);
  pAdvertising->setScanResponse(true);
  pAdvertising->setMinPreferred(0x06);  // Ayuda con problemas de conexión en iPhone
  pAdvertising->setMinPreferred(0x12);
  BLEDevice::startAdvertising();
  Serial.println("¡Característica definida! Ahora puedes leerla en tu teléfono.");
  String data = getDataById(id);
  if (data != "") {
    Serial.println("Datos encontrados para " + id + ": " + data);
    // Aquí puede agregar el código para enviar 'data' por BLE
  } else {
    Serial.println("ID no encontrado.");
  }
  // Inicializar el tiempo de inicio
  startMillis = millis();
}

void loop() {
  readGpsSerial();
  reportGpsDebug();

  // Actualizar el tiempo de funcionamiento
  currentMillis = millis();
  elapsedMillis = currentMillis - startMillis;

  // Calcular horas, minutos y segundos
  seg = (elapsedMillis / 1000) % 60;
  minu = (elapsedMillis / (1000 * 60)) % 60;
  hora = (elapsedMillis / (1000 * 60 * 60));
  
  // Control del LED según el estado de conexión BLE
  if (deviceConnected) {
    // BLE conectado: LED encendido con color sólido según PM2.5
    uint8_t redValue, greenValue;
    if (PMS2_5 <= 50) {
      redValue = map(PMS2_5, 0, 50, 0, 255);
      greenValue = map(PMS2_5, 0, 50, 255, 0);
    } else {
      redValue = 255;
      greenValue = 0;
    }
    setNeoPixelStatus(pixels.Color(redValue, greenValue, 0));

    // Reiniciar variables de parpadeo
    isBlinking = false;
    blinkCount = 0;
  } else {
    // BLE no conectado: parpadeo 5 veces cada 10 segundos y luego volver al estado de indicar MP
    handleDisconnectionBlinking();
  }

  // Mostrar datos en la pantalla
  displayData();

  // Lectura de sensores cada 3 segundos
  if (millis() - checkpms >= intercheckpms) {
    checkpms = millis();

    // Leer datos del sensor PMS
    if (pms5.available() > 0) {
      readPMSSensor();
    }

    // Leer voltaje de batería
    Voltage = (readADC_Cal(analogRead(BAT_ADC))) * 2;  // Ajustar si se usa un divisor de voltaje
    batteryVoltage = Voltage / 1000.0;

    // Si el voltaje es menor que el umbral, entrar en deep sleep
    if (batteryVoltage < lowBat) {
      // Parpadear NeoPixel en rojo 3 veces antes de entrar en deep sleep
      for (int i = 0; i < 3; i++) {
        setNeoPixelStatus(pixels.Color(255, 0, 0));  // Rojo
        delay(500);
        setNeoPixelStatus(pixels.Color(0, 0, 0));  // Apagar
        delay(500);
      }
      u8g2.setPowerSave(1);
      // Entrar en modo Deep Sleep
      Serial.println("Voltaje demasiado bajo, entrando en deep sleep...");
      esp_deep_sleep_start();
    }
 if(rtcOK == true) {
      DateTime now = rtc.now();
   Serial.print(now.year(), DEC);
    Serial.print('/');
    Serial.print(now.month(), DEC);
    Serial.print('/');
    Serial.print(now.day(), DEC);
    Serial.print(" ");
    Serial.print(now.hour(), DEC);
    Serial.print(':');
    Serial.print(now.minute(), DEC);
    Serial.print(':');
    Serial.print(now.second(), DEC);
    Serial.println();
    }else{
      Serial.println("RTC no disponible");
    }
    // Guardar los datos en la tarjeta SD
  if (sd_available) {
   if(rtcOK == true && deviceConnected == false) {
    DateTime now = rtc.now();
  // Crear un string para la fecha
String fecha = String(now.year()) + "/" + String(now.month()) + "/" + String(now.day());
// Crear un string para la hora
String horas = String(now.hour()) + ":" + String(now.minute()) + ":" + String(now.second());

          // Crear un string con toda la información que deseas guardar
     dataString = "Tiempo: " + String(millis()) 
      + ", Latitud: " + latitud + ", Longitud: " + longitud + ", Timestamp: " + String(now.unixtime()) 
      + ", SesionID: " + sesionID + ", Evento: " + notaEVento + ", Fecha: " + fecha + ", Hora: " + horas 
      + ", Bat: " + String(batteryVoltage, 2) + "V"+ ", PM2.5: " + String(PMS2_5)  + ", PM10: " + String(PMS10) + " ug/m3" 
      + ", Temp: " + String(TPS / 10) + "." + String(TPS % 10) + "C" + ", Hum: " + String(HDS / 10) + "." + String(HDS % 10) + "%";
    }else{
      Serial.println("usando hora del celular");
       // Crear un string con toda la información que deseas guardar
     dataString = "Tiempo: " + String(millis()) 
      + ", Latitud: " + latitud + ", Longitud: " + longitud + ", Timestamp: " + timestamp 
      + ", SesionID: " + sesionID + ", Evento: " + notaEVento + ", Fecha: " + fecha + ", Hora: " + horas 
      + ", Bat: " + String(batteryVoltage, 2) + "V"+ ", PM2.5: " + String(PMS2_5)  + ", PM10: " + String(PMS10) + " ug/m3" 
      + ", Temp: " + String(TPS / 10) + "." + String(TPS % 10) + "C" + ", Hum: " + String(HDS / 10) + "." + String(HDS % 10) + "%";
    }
     
      File dataFile = SD.open(dataLOG, FILE_APPEND);
      // Realizar el efecto de "bajada de luz" tras guardar datos
      if (dataFile) {
        dataFile.println(dataString);  // Escribe la cadena en el archivo
        dataFile.close();
        Serial.println("Guardado en SD: " + dataString);  // Imprime la cadena en la consola

        uint32_t currentColor = pixels.getPixelColor(0);  // Obtener el color actual del LED
        fadeEffect(currentColor);                         // Llamada a la función para el efecto de atenuación
        // Resetea todas las variables a strings vacíos para esperar nuevos datos
        latitud = "";
        longitud = "";
        timestamp = "";
        sesionID = "";
        notaEVento = "";
        fecha = "";
        horas = "";
        // Mostrar mensaje de datos guardados en pantalla
        displayDataSaved = true;
        dataSavedTime = millis();
      } else {
        // Error al abrir el archivo
        Serial.println("Error al abrir: " + dataLOG);
        // Cambiar color del LED a rojo para indicar error al guardar en SD
        setNeoPixelStatus(pixels.Color(255, 0, 0));  // Rojo
      }
    }

    // Enviar datos por BLE si está conectado
    if (deviceConnected) {
      Serial.println("Conectado: " + String(deviceConnected));
      if (firstConect == true) {
        String data = getDataById(id);
        if (data != "") {
          Serial.println("Datos encontrados para " + id + ": " + data);
          // Aquí puede agregar el código para enviar 'data' por BLE
        } else {
          Serial.println("ID no encontrado.");
        }
        pTxCharacteristic->setValue(data.c_str());
        pTxCharacteristic->notify();
        Serial.println("Enviado por BLE: " + data);
        if (callbackRecivido == true) {
          Serial.println("Recibido OK");
          firstConect = false;
        }
      } else {
        String data = String(PMS2_5) + "," + id + "," + String(HDS) + "," + String(TPS) + "," + String(batteryVoltage);
        pTxCharacteristic->setValue(data.c_str());
        pTxCharacteristic->notify();
        Serial.println("Enviado por BLE: " + data);
      }
    } else {
      Serial.println("no Conectado: " + String(deviceConnected));
      firstConect = true;
      callbackRecivido = false;
    }

    // Calcular el consumo de batería hasta este punto
    unsigned long currentMillisCC = millis();
    float elapsedHours = (currentMillisCC - startMillis) / 3600000.0;
    consumed_mAh = AVERAGE_CURRENT_MA * elapsedHours;

    // Salidas seriales con los datos del sensor y los datos guardados
    Serial.println("-----------------------Datos--------------------------");
    Serial.printf("Voltaje de Batería: %.2fV\n", batteryVoltage);
    Serial.printf("Temp: %d.%d C\n", TPS / 10, TPS % 10);
    Serial.printf("Humedad: %d.%d %%\n", HDS / 10, HDS % 10);
    Serial.printf("PM1.0: %u ug/m3\n", PMS1);
    Serial.printf("PM2.5: %u ug/m3\n", PMS2_5);
    Serial.printf("PM10: %u ug/m3\n", PMS10);
    Serial.printf("Energía Consumida: %.2f mAh\n", consumed_mAh);
    Serial.printf("Tiempo de Funcionamiento: %d:%02d:%02d\n", hora, minu, seg);
  }

  // Si se recibió un mensaje BLE, se mostrará en displayData()
}

void readPMSSensor() {
  while (pms5.available() > 0) {
    for (int i = 0; i < 32; i++) {
      bufferRTT[i] = (char)pms5.read();
      delay(2);
    }

    pms5.flush();

    unsigned int CR1 = (bufferRTT[30] << 8) + bufferRTT[31];
    unsigned int CR2 = 0;
    for (int i = 0; i < 30; i++)
      CR2 += bufferRTT[i];

    if (CR1 == CR2) {
      PMS1 = (bufferRTT[10] << 8) + bufferRTT[11];    // PM1.0
      PMS2_5 = (bufferRTT[12] << 8) + bufferRTT[13];  // PM2.5
      PMS10 = (bufferRTT[14] << 8) + bufferRTT[15];   // PM10
      TPS = (bufferRTT[24] << 8) + bufferRTT[25];     // Temperatura
      HDS = (bufferRTT[26] << 8) + bufferRTT[27];     // Humedad
    }
  }
}

void displayData() {
  u8g2.clearBuffer();
  u8g2.setFont(u8g2_font_5x8_tr);
  char buf[20];
  sprintf(buf, "Bat: %.2fV", batteryVoltage);
  u8g2.drawStr(0, 8, buf);
  if (receivedMessage.length() > 0) {
    // Mostrar mensaje recibido
    u8g2.drawStr(60, 8, receivedMessage.c_str());
  } else {
    u8g2.drawStr(60, 8, String(consumed_mAh).c_str());
  }

  sprintf(buf, "PM2.5: %u", PMS2_5);
  u8g2.drawStr(0, 16, buf);
  u8g2.drawStr(60, 16, id.c_str());

  sprintf(buf, "Temp: %d.%dC", TPS / 10, TPS % 10);
  u8g2.drawStr(0, 24, buf);

  sprintf(buf, "Hum: %d.%d%%", HDS / 10, HDS % 10);
  u8g2.drawStr(60, 24, buf);

  // Mostrar tiempo de funcionamiento
  sprintf(buf, "%d:%02d:%02d", hora, minu, seg);
  u8g2.drawStr(0, 32, buf);

  if (displayDataSaved) {
    // Mostrar mensaje de datos guardados
    u8g2.drawStr(60, 32, "Data saved");
    // Verificar si han pasado 2 segundos para ocultar el mensaje
    if (millis() - dataSavedTime >= dataSavedDisplayTime) {
      receivedMessage = "";
      displayDataSaved = false;
    }
  } else {
    // Mostrar estado de conexión
    if (deviceConnected) {
      u8g2.drawStr(60, 32, "Connected");
    } else {
      u8g2.drawStr(60, 32, "Not Conn");
    }
  }

  u8g2.sendBuffer();
}

void handleDisconnectionBlinking() {
  unsigned long currentMillis = millis();

  if (!isBlinking && (currentMillis - lastBlinkSequenceTime >= blinkSequenceInterval)) {
    // Iniciar una nueva secuencia de parpadeo
    isBlinking = true;
    blinkCount = 0;
    lastBlinkTime = currentMillis;
    lastBlinkSequenceTime = currentMillis;
    ledState = false;  // Asegurarse de comenzar con el LED apagado
  }

  if (isBlinking) {
    if (currentMillis - lastBlinkTime >= blinkInterval) {
      lastBlinkTime = currentMillis;
      ledState = !ledState;

      // Controlar el LED durante el parpadeo
      if (ledState) {
        // Después de terminar la secuencia de parpadeo, volver al estado de indicar niveles de MP
        uint8_t redValue, greenValue;
        if (PMS2_5 <= 50) {
          // Interpolar entre verde y rojo según los niveles de MP2.5
          redValue = map(PMS2_5, 0, 50, 0, 255);
          greenValue = map(PMS2_5, 0, 50, 255, 0);
        } else {
          // Si el nivel de MP2.5 es mayor a 50, encender el LED en rojo
          redValue = 255;
          greenValue = 0;
        }
        setNeoPixelStatus(pixels.Color(redValue, greenValue, 0));
      } else {
        // Apagar el LED
        setNeoPixelStatus(pixels.Color(0, 0, 0));
        blinkCount++;
      }

      // Verificar si se ha completado el número de parpadeos
      if (blinkCount >= totalBlinks * 2) {  // Multiplicado por 2 porque contamos encendidos y apagados
        isBlinking = false;                 // Terminar secuencia de parpadeo
      }
    }
  } else {
    // Después de terminar la secuencia de parpadeo, volver al estado de indicar niveles de MP
    uint8_t redValue, greenValue;
    if (PMS2_5 <= 50) {
      // Interpolar entre verde y rojo según los niveles de MP2.5
      redValue = map(PMS2_5, 0, 50, 0, 255);
      greenValue = map(PMS2_5, 0, 50, 255, 0);
    } else {
      // Si el nivel de MP2.5 es mayor a 50, encender el LED en rojo
      redValue = 255;
      greenValue = 0;
    }
    setNeoPixelStatus(pixels.Color(redValue, greenValue, 0));
  }
}


// Definir una estructura para asociar IDs con sus datos
struct DeviceData {
  String id;
  String data;
};

// Inicializar un array de estructuras con los datos proporcionados
DeviceData devices[] = {
  { "HIRI-01", "25:3,25:6,25:8,28:4,29:11,29:12" },
  { "HIRI-02", "26:3,26:6,26:8,30:4,31:11,31:12" },
  { "HIRI-03", "27:3,27:6,27:8,32:4,33:11,33:12" },
  { "HIRI-04", "35:3,35:6,35:8,34:4,36:11,36:12" },
  { "HIRI-05", "38:3,38:6,38:8,37:4,39:11,39:12" },
  { "HIRI-06", "41:3,41:6,41:8,40:4,42:11,42:12" },
  { "HIRI-07", "44:3,44:6,44:8,43:4,45:11,45:12" },
  { "HIRI-08", "47:3,47:6,47:8,46:4,48:11,48:12" },
  { "HIRI-09", "50:3,50:6,50:8,49:4,51:11,51:12" },
  { "HIRI-10", "53:3,53:6,53:8,52:4,54:11,54:12" },
  { "HIRI-11", "56:3,56:6,56:8,55:4,57:11,57:12" },
  { "HIRI-12", "59:3,59:6,59:8,58:4,60:11,60:12" },
  { "HIRI-13", "62:3,62:6,62:8,61:4,63:11,63:12" },
  { "HIRI-14", "65:3,65:6,65:8,64:4,66:11,66:12" },
  { "HIRI-15", "68:3,68:6,68:8,67:4,69:11,69:12" }
};

// Función para buscar datos basados en el ID
String getDataById(String id) {
  for (int i = 0; i < sizeof(devices) / sizeof(devices[0]); i++) {
    if (devices[i].id == id) {
      return devices[i].data;
    }
  }
  return "";  // Retorna una cadena vacía si no se encuentra el ID
}
