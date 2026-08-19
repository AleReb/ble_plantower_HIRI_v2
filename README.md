# HIRI Mini — monitor de calidad del aire con BLE

HIRI Mini es un monitor portátil basado en ESP32-C3 que lee un sensor Plantower PMS5003ST, muestra las mediciones en una pantalla OLED, registra los datos en una tarjeta microSD y los transmite mediante Bluetooth Low Energy (BLE). El proyecto también admite posicionamiento GPS, reloj de tiempo real y señalización mediante NeoPixel.

El repositorio contiene el firmware Arduino y los archivos de esquema y placa para fabricar la PCB adaptadora HIRI Mini.

## Funciones principales

- Medición de PM1.0, PM2.5, PM10, temperatura y humedad con un Plantower PMS5003ST.
- Envío de mediciones y recepción de metadatos mediante BLE.
- Lectura de sentencias NMEA `RMC` y `GGA` desde un GPS conectado por UART.
- Registro de mediciones en microSD, con un archivo nuevo en cada arranque.
- RTC DS3231 como fuente de fecha y hora cuando no hay datos temporales recibidos por BLE.
- Pantalla OLED SH1106 de 128 × 32 píxeles mediante I2C.
- Dos NeoPixel activos para indicar arranque, conexión, nivel de PM2.5, escritura en SD y batería baja.
- Medición de la batería y entrada en `deep sleep` bajo 3,15 V.

## Hardware

- LilyGO / TTGO T-OI Plus con ESP32-C3.
- Sensor Plantower PMS5003ST con conector Molex 53048-0810.
- Pantalla OLED SH1106 128 × 32, I2C.
- RTC DS3231, I2C.
- Módulo microSD, SPI.
- Módulo GPS con salida NMEA a 9600 baud.
- Tres NeoPixel en cadena; actualmente el firmware utiliza los dos primeros.
- Convertidor step-up y batería LiPo adecuados para el montaje.
- PCB HIRI Mini incluida en este repositorio, opcional para el prototipo.

> Verifica la tensión, polaridad y pinout de cada módulo antes de energizar el equipo. El conector Plantower recibe 5 V, mientras que la lógica del ESP32-C3 trabaja a 3,3 V.

## PCB HIRI Mini

Los diseños se encuentran en [`pcb/HIRI MINI`](pcb/HIRI%20MINI) y fueron creados con Autodesk EAGLE 9.6.2. Cada variante incluye el esquema `.sch` y la placa `.brd`:

| Variante | Archivos | Estado observado |
| --- | --- | --- |
| `HIRIMINI-CHINA` | `HIRIMINI-CHINA.sch` / `HIRIMINI-CHINA.brd` | Placa de dos capas completamente ruteada. Reglas principales de separación: 0,3 mm. |
| `HIRIMINI-BANTAM` | `HIRIMINI-BANTAM.sch` / `HIRIMINI-BANTAM.brd` | Versión con reglas de separación de 0,4 mm. Mantiene una conexión aérea pendiente en la red `3V3`; debe rutearse antes de fabricar. |

Ambas placas miden aproximadamente 26,2 × 35,5 mm, tienen dos perforaciones de montaje de 2 mm e incluyen conexiones para:

- LilyGO T-OI Plus.
- Plantower PMS5003ST.
- Step-up de tres pines (`3V3`, `GND`, `5V`).
- NeoPixel/RGB de tres pines (`3V3`, `GND`, señal).
- Módulo microSD de seis pines (`GND`, `MISO`, `CLK`, `MOSI`, `CS`, `3V3`).

La PCB enruta el núcleo formado por Plantower, alimentación, NeoPixel y microSD. El GPS, el RTC, la pantalla OLED y la medición de batería no aparecen como conectores dedicados en estos esquemas; deben conectarse a los pines de la placa indicados a continuación o incorporarse en una revisión futura del diseño.

Antes de enviar archivos a fabricación:

1. Abre juntos el `.sch` y el `.brd` de la variante elegida en EAGLE.
2. Ejecuta ERC y DRC con las reglas del fabricante o del proceso de fresado.
3. Confirma que no queden *airwires* y revisa el plano de masa, anchos de pista, perforaciones y contorno.
4. Genera y comprueba visualmente los Gerber y archivos de taladrado. Los Gerber no están incluidos en este repositorio.

## Mapa de pines del firmware

Placa configurada en Arduino: `esp32:esp32:ttgo-t-oi-plus`.

| GPIO | Función | Conexión |
| --- | --- | --- |
| 2 | ADC de batería | `BAT_ADC` |
| 4 | RX del PMS5003ST | TX del Plantower |
| 5 | TX del PMS5003ST | RX del Plantower |
| 6 | SD MOSI | MOSI del módulo microSD |
| 7 | SD MISO | MISO del módulo microSD |
| 8 | SD SCLK | CLK del módulo microSD |
| 9 | SD CS | CS del módulo microSD |
| 10 | Datos NeoPixel | Entrada de la cadena RGB |
| 18 | I2C SCL | OLED y RTC |
| 19 | I2C SDA | OLED y RTC |
| 20 | RX del GPS | TX del GPS |
| 21 | TX del GPS | RX del GPS, si se requieren comandos |

GPIO 0 y GPIO 1 quedan disponibles en el firmware actual. GPIO 3 puede estar conectado al LED integrado. Los GPIO 11 a 17 suelen estar reservados para la memoria flash del ESP32-C3 y no se recomiendan para periféricos externos.

## Software y dependencias

Instala el paquete de placas **ESP32 by Espressif Systems** y selecciona `TTGO T-OI Plus`. El sketch usa las siguientes bibliotecas externas:

- Adafruit NeoPixel.
- Time by Michael Margolis (`TimeLib.h`).
- U8g2.
- RTClib by Adafruit.

`Wire`, `SPI`, `SD`, las bibliotecas BLE y `esp_adc_cal` forman parte del core de ESP32.

Para cargar el firmware:

1. Abre [`ble_plantower_HIRI_v2.ino`](ble_plantower_HIRI_v2.ino) en Arduino IDE.
2. Instala el core y las bibliotecas indicadas.
3. Selecciona la placa `TTGO T-OI Plus` y el puerto correspondiente.
4. Ajusta `DEVICE_NAME` en el sketch si el equipo no será `HIRI-01`.
5. Compila y carga el programa.
6. Abre el monitor serie a 115200 baud para revisar el arranque de RTC, SD, PMS, GPS y BLE.

## Comunicación BLE

El dispositivo se anuncia por defecto como `HIRI-01` y utiliza:

| Elemento | UUID | Operación |
| --- | --- | --- |
| Servicio | `4fafc201-1fb5-459e-8fcc-c5c9c331914b` | Servicio principal |
| Característica TX | `beb5483e-36e1-4688-b7f5-ea07361b26a8` | Lectura y notificaciones hacia la app |
| Característica RX | `6e400003-b5a3-f393-e0a9-e50e24dcca9e` | Escritura desde la app |

La app puede escribir un mensaje con el formato:

```text
latitud,longitud,timestamp_unix,sesionID,evento
```

Después del intercambio inicial, el dispositivo notifica mediciones con el formato:

```text
pm2_5,id_dispositivo,humedad_x10,temperatura_x10,voltaje_bateria
```

## Registro en microSD

En cada arranque se crea el primer nombre disponible, con una secuencia entre `01` y `9999`:

```text
/DD_MM_AAAAdatoHIRI-0101.csv
```

Si el RTC no está disponible, se omite la fecha del nombre. Aunque la extensión es `.csv`, las líneas actuales se guardan como pares etiquetados (`Tiempo: ...`, `Latitud: ...`, etc.); no contienen una fila de encabezados CSV convencional.

## Estructura del repositorio

```text
.
├── ble_plantower_HIRI_v2.ino    # firmware Arduino
├── pcb/
│   └── HIRI MINI/               # esquemas y placas EAGLE
├── README.md
└── LICENSE
```

## Autor

Alejandro Rebolledo — arebolledo@udd.cl

## Licencia

Este proyecto se distribuye bajo la licencia Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0). Consulta el texto completo en [`LICENSE`](LICENSE).

## Descargo de responsabilidad

El código y los diseños se ofrecen “tal cual”, sin garantías expresas ni implícitas. Revisa el esquema, la placa y las condiciones eléctricas antes de fabricar o conectar el hardware.
