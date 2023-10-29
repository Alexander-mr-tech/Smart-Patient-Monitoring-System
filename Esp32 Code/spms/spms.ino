#include <WiFi.h>
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_ADXL345_U.h>
#include <FirebaseESP32.h>
#include <OneWire.h>
#include <DallasTemperature.h>
#include <SimpleDHT.h>    
#include <Adafruit_GFX.h>    // Core graphics library
#include <Adafruit_ST7735.h> // Hardware-specific library for ST7735
#include <SPI.h>
#define pinDHT11 5
#define vibrator 18
#define FIREBASE_HOST "smart-patient-monitoring-44c28-default-rtdb.firebaseio.com/"
#define FIREBASE_AUTH "sxJCUtiJeU5lsT4E8PrDkrgupFsOC4AooTqzC4Ds"
#define WIFI_SSID "A and S Fire and Safety"
#define WIFI_PASSWORD "Arham2014"
//Define FirebaseESP32 data object
FirebaseData firebaseData;

SimpleDHT11 dht11(pinDHT11);
// GPIO where the DS18B20 is connected to
const int oneWireBus = 15;
// Setup a oneWire instance to communicate with any OneWire devices
OneWire oneWire(oneWireBus);
// Pass our oneWire reference to Dallas Temperature sensor 
DallasTemperature sensors(&oneWire);

int steps = 0;
int lastX = 0;
int lastY = 0;
int lastZ = 0;
               
//Pin for ESP32
  #define TFT_CS         13  //case select connect to pin 13
  #define TFT_RST        12 //reset connect to pin 23
  #define TFT_DC         14 //AO connect to pin 22  (not sure that this is really used)  try pin 25
  #define TFT_MOSI       27 //Data = SDA connect to pin 21
  #define TFT_SCLK       26 //Clock = SCK connect to pin 19

Adafruit_ADXL345_Unified accel = Adafruit_ADXL345_Unified(12345); // 0x53 is the default I2C address
// For ST7735-based displays, we will use this call
Adafruit_ST7735 tft = Adafruit_ST7735(TFT_CS, TFT_DC, TFT_MOSI, TFT_SCLK, TFT_RST);

void setup() {
  Serial.begin(115200);
  sensors.begin();
  if(!accel.begin()) {
    Serial.println("Could not find a valid ADXL345 sensor, check wiring!");
    while (1);
  }
  accel.setRange(ADXL345_RANGE_16_G);
  pinMode(pinDHT11,INPUT);
  pinMode(vibrator,OUTPUT);
  wifi();
  tftdisplay();
}//end of void setup

void loop() {
  sensors.requestTemperatures();
  int dallas_tempC = sensors.getTempCByIndex(0);
  int dallas_tempF = DallasTemperature::toFahrenheit(dallas_tempC);
  // int dallas_temp = sensors.getTempCByIndex(0);
  // int temperatureF = sensors.getTempFByIndex(0);
  byte temperature = 0;
byte humidity = 0;
int err = SimpleDHTErrSuccess;
  if ((err = dht11.read(&temperature, &humidity, NULL)) != SimpleDHTErrSuccess) {
    Serial.print("Read DHT11 failed, err="); Serial.print(SimpleDHTErrCode(err));
    Serial.print(","); Serial.println(SimpleDHTErrDuration(err)); delay(1000);
    return;
  }

sensors_event_t event;
  accel.getEvent(&event);
  double x = event.acceleration.x;
  double y = event.acceleration.y;
  double z = event.acceleration.z;
  if ((y > 0.01 && lastY < 0)|| (y < -0 && lastY > 0)||(x > 0 && lastX < 0)||(x < -1 && lastX > 0)||(z > 10 && lastX < 0)||(z < 12 && lastX > 0)) {
    steps++;
    Serial.print("Step Count: ");
    Serial.println(steps);
  }
  lastX = x;
  lastY = y;
  lastZ = z;
  delay(500);

  tft.setTextSize(2);
  tft.setTextColor(ST7735_RED,ST7735_WHITE);
  tft.setCursor(22, 76);
  tft.println((int)temperature);
  
  tft.setTextSize(2);
  tft.setTextColor(ST7735_BLUE,ST7735_WHITE);
  tft.setCursor(83, 76);
  tft.println((int)humidity);
  
  tft.setTextSize(2);
  tft.setTextColor(ST7735_BLUE,ST7735_WHITE);
  tft.setCursor(22, 114);
  tft.println(dallas_tempF);

  tft.setTextSize(2);
  tft.setTextColor(ST7735_RED,ST7735_WHITE);
  tft.setCursor(83, 114);
  tft.println(steps);

  tft.setTextSize(2);
  tft.setTextColor(ST7735_BLUE,ST7735_WHITE);
  tft.setCursor(66, 140);
  tft.println("HIGH");

  delay(1000);

  Firebase.setInt(firebaseData,"/All Parameters/Environment Temperature/Temperature",temperature);
  if (firebaseData.dataType() == "null") {
    Serial.println("Push failed");
    Serial.println(firebaseData.errorReason());
  } else {
    // Serial.println("Temperature Push Successful");
  }

  Firebase.setInt(firebaseData,"/All Parameters/Environment Temperature/Humidity",humidity);
  if (firebaseData.dataType() == "null") {
    Serial.println("Push failed");
    Serial.println(firebaseData.errorReason());
  } else {
    // Serial.println("Humidity Push Successful ");
  }

  Firebase.setInt(firebaseData,"/All Parameters/Patient's Temperature/Body Temperature",dallas_tempF);
  if (firebaseData.dataType() == "null") {
    Serial.println("Push failed");
    Serial.println(firebaseData.errorReason());
  } else {
    // Serial.println("Body Temperature Push Successful ");
  }

    Firebase.setInt(firebaseData,"/All Parameters/Patient's Steps/Steps",steps);
  if (firebaseData.dataType() == "null") {
    Serial.println("Push failed");
    Serial.println(firebaseData.errorReason());
  } else {
    // Serial.println("Steps Push Successful");
  }
}//end of void loop

void tftdisplay(){
tft.fillScreen(ST77XX_BLACK);   
tft.setRotation(1);
  // Use this initializer if using a 1.8" TFT screen:
tft.initR(INITR_BLACKTAB);      // Init ST7735S chip, black tab
Serial.println("Initialized");
tft.fillScreen(ST77XX_BLACK);
//expecting 128 x 160
tft.initR(INITR_BLACKTAB);
  tft.setRotation(0);
  tft.fillScreen(ST7735_WHITE);
  tft.setTextColor(ST7735_RED);
  tft.setTextSize(1);
  // Draw a rectangle
  int rectX = 10;  // X-coordinate of the top-left corner of the rectangle
  int rectY = 10;  // Y-coordinate of the top-left corner of the rectangle
  int rectWidth = 108;  // Width of the rectangle
  int rectHeight = 25;  // Height of the rectangle
  uint16_t rectColor = ST7735_BLUE;  // Color of the rectangle
  uint16_t strokeColor = ST7735_RED;  // Color of the stroke
  int strokeWeight = 6;  // Stroke weight in pixels
  tft.drawRect(rectX, rectY, rectWidth, rectHeight, rectColor);
  tft.drawRect(rectX - strokeWeight, rectY - strokeWeight, rectWidth + 2 * strokeWeight, rectHeight + 2 * strokeWeight, strokeColor);
  tft.setCursor(26, 14);
  tft.println("SMART PATIENT");
  tft.setCursor(14, 24);
  tft.println("MONITORING SYSTEM");
  tft.drawRect(4, 43, 120, 15, ST7735_BLUE);
  tft.setCursor(10, 48);
  tft.println("MONITORING DEVICES");
  tft.drawRect(4, 60, 59, 35, ST7735_RED);
  tft.setCursor(7, 63);
  tft.setTextColor(ST7735_BLUE);
  tft.println("ROOM TEMP");
  tft.drawRect(65, 60, 59, 35, ST7735_BLUE);
  tft.setTextSize(1);
  tft.setTextColor(ST7735_RED);
  tft.setCursor(72, 63);
  tft.println("HUMIDITY");
  tft.drawRect(4, 97, 59, 35, ST7735_BLUE);
  tft.setTextSize(1);
  tft.setTextColor(ST7735_RED);
  tft.setCursor(7, 100);
  tft.println("BODY TEMP");
  tft.drawRect(65, 97, 59, 35, ST7735_RED);
  tft.setTextSize(1);
  tft.setTextColor(ST7735_BLUE);
  tft.setCursor(74, 100);
  tft.println("T.STEPS");
  tft.drawRect(4, 134, 120, 25, ST7735_BLUE);
  tft.setTextSize(1);
  tft.setCursor(7, 138);
  tft.println("STRESS");
  tft.setTextSize(1);
  tft.setCursor(7, 148);
  tft.println("LEVEL");
}
void wifi(){
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.println("Searching for Network ");
    delay(100);
    Serial.println("WIFI : SEARCHING");
    delay(500);
  }
  Serial.println();
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();
  Serial.println("------------------------------------");
  Serial.println("Connected...");
  delay(500);
}
