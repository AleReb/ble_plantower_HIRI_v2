# Proyecto HIRI - Monitor de Calidad de Aire con BLE

Este proyecto utiliza un microcontrolador ESP32-C3 para recolectar datos de un sensor de partículas Plantower PMS5003ST y transmitirlos a través de Bluetooth Low Energy (BLE). También incluye una pantalla OLED para visualización de datos en tiempo real y un LED NeoPixel como indicador de estado.

## Características

- **Sensor de Partículas:** Mide concentraciones de material particulado PM1.0, PM2.5 y PM10, además de temperatura y humedad, utilizando un sensor Plantower PMS5003ST.
- **Conectividad BLE:** Publica un servicio BLE que permite a una aplicación móvil conectarse, enviar datos (como coordenadas GPS y timestamp) y recibir mediciones del sensor.
- **Almacenamiento en SD:** Guarda los datos de las mediciones en una tarjeta microSD en formato de texto. Cada línea contiene información de la muestra, incluyendo lecturas del sensor, datos de la app, y voltaje de la batería.
- **Pantalla OLED:** Muestra en tiempo real el voltaje de la batería, las lecturas de PM2.5, temperatura, humedad y el estado de la conexión BLE.
- **Indicadores Visuales:** Un LED NeoPixel indica el estado del dispositivo:
  - **Arranque:** Azul
  - **SD OK/No encontrada:** Verde / Morado
  - **Conectado a BLE:** El color varía de verde a rojo según la concentración de PM2.5.
  - **Desconectado de BLE:** Parpadea periódicamente para indicar que está disponible para conexión.
  - **Guardando en SD:** Realiza un efecto de atenuación.
  - **Batería Baja:** Parpadea en rojo antes de entrar en modo de sueño profundo.
- **Gestión de Energía:** Mide el voltaje de la batería y activa el modo de sueño profundo (`deep sleep`) si el nivel es críticamente bajo para proteger la batería.

## Hardware Requerido

- Placa de desarrollo basada en ESP32-C3 (el código está configurado para una LilyGO T-OI PLUS).
- Sensor de calidad de aire Plantower PMS5003ST.
- Pantalla OLED (SH1106, 128x32 I2C).
- Módulo para tarjeta MicroSD (conectado por SPI).
- LED RGB direccionable (NeoPixel).
- Batería LiPo para alimentación.

## Autor

- **Alejandro Rebolledo**
- arebolledo@udd.cl

## Licencia

Este proyecto se distribuye bajo la licencia **Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)**. Puedes ver el texto completo en el archivo [LICENSE](LICENSE).

## Descargo de Responsabilidad

El código de este proyecto se ofrece "tal cual", sin garantías de ningún tipo, expresas o implícitas. El autor no se hace responsable de ningún daño, pérdida de datos o cualquier otro problema derivado del uso de este software. Utilízalo bajo tu propio riesgo.
