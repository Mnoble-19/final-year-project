#include <Arduino.h>
#include <ESP32QRCodeReader.h>
#include <ESP32Servo.h>
#include <WiFi.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>

#define PIN_SERVO 12
Servo myServo;
ESP32QRCodeReader reader(CAMERA_MODEL_AI_THINKER);
const char* ssid = "Noble";
const char* password = "ElbonMusk";
const char* serverURL = "http://192.168.43.109:5000/update-message";

bool firstScan = true; 

void onQrCodeTask(void* pvParameters)
{
  struct QRCodeData qrCodeData;

  while (true)
  {
    if (reader.receiveQrCode(&qrCodeData, 100))
    {
      Serial.println("Found QRCode");
      if (qrCodeData.valid)
      {
        Serial.print("Payload: ");
        Serial.println((const char*)qrCodeData.payload);

        delay(5000);

        // parse the QR code payload as JSON
        DynamicJsonDocument doc(1024);
        String qrValue1 = (const char*)qrCodeData.payload;
        deserializeJson(doc, qrValue1);
        bool isStudent = doc["isStudent"]; // get the value of the isStudent key

        // check if isStudent is true or false
        if (isStudent) // if true, turn the servo by 90 degrees
        {
          myServo.write(90);
          delay(5000);
          myServo.write(0);
        }
        else // if false, proceed with the modified implementation
        {
          // add a new key-value pair isStart to the payload
          doc["isStart"] = firstScan; // set it to true or false depending on the global variable
          String qrValue2; // declare a new variable to store the modified payload
          serializeJson(doc, qrValue2); // convert the JSON document back to a string

          // Send QR code value to the server
          if (WiFi.status() == WL_CONNECTED)
          {
            HTTPClient http;
            http.begin(serverURL);
            http.addHeader("Content-Type", "text/plain");
            Serial.println(qrValue2);
            int httpResponseCode = http.POST(qrValue2);
            // int httpResponseCode = http.POST("\"" + qrValue2 + "\""); 
            if (httpResponseCode == 200)
            {
              String response = http.getString();
              Serial.println(httpResponseCode);
              Serial.println(response);

              delay(5000);

              if (firstScan) // if it is the first scan, open and close the servo and set firstScan to false
              {
                myServo.write(90);
                delay(5000);
                myServo.write(0);
                firstScan = false;
              }
              else // if it is the second scan, open and close the servo and set firstScan back to true
              {
                myServo.write(90);
                delay(5000);
                myServo.write(0);
                firstScan = true;
              }
            }
            else
            {
              Serial.print("Error on sending POST: ");
              Serial.println(httpResponseCode);

              if (!firstScan) // if it is the second scan and there is an error, print "Please pay"
              {
                Serial.println("Please pay");
              }
            }
            http.end();
          }
          else
          {
            Serial.println("WiFi Disconnected");
          }
        }
      }
      else
      {
        Serial.print("Invalid: ");
        Serial.println((const char*)qrCodeData.payload);
      }
    }
    vTaskDelay(100 / portTICK_PERIOD_MS);
  }
}

void setup()
{
  Serial.begin(115200);
  Serial.println();

  reader.setup();
  myServo.attach(PIN_SERVO);
  Serial.println("Setup QRCode Reader");

  reader.beginOnCore(1);

  Serial.println("Begin on Core 1");

  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(1000);
    Serial.println("Connecting to WiFi..");
  }
  Serial.println("Connected to WiFi network");

  xTaskCreate(onQrCodeTask, "onQrCode", 4 * 1024, NULL, 4, NULL);
}

void loop()
{
  delay(100);
}
