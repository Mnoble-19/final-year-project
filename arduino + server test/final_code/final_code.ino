#include <WiFi.h>
#include <HTTPClient.h>
#include <ESP32QRCodeReader.h>
#include <ESP32Servo.h>

const char* ssid = "Noble";
const char* password = "ElbonMusk";

const char* serverURL = "http://192.168.43.207:5000/update-message";

ESP32QRCodeReader reader(CAMERA_MODEL_AI_THINKER);

#define PIN_SERVO 16
Servo myServo;

void setup() {
  Serial.begin(115200);
  Serial.println();

  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi..");
  }
  Serial.println("Connected to WiFi network");

  reader.setup();
  Serial.println("Setup QRCode Reader");
  reader.beginOnCore(1);
  Serial.println("Begin on Core 1");

  myServo.attach(PIN_SERVO);
}

void loop() {
  if(WiFi.status()== WL_CONNECTED){
    struct QRCodeData qrCodeData;
    if (reader.receiveQrCode(&qrCodeData, 100))
    {
      Serial.println("Found QRCode");
      if (qrCodeData.valid)
      {
        Serial.print("Payload: ");
        Serial.println((const char *)qrCodeData.payload);

        HTTPClient http;
        http.begin(serverURL);
        http.addHeader("Content-Type", "text/plain");
        int httpResponseCode = http.POST((const char *)qrCodeData.payload);
        if(httpResponseCode>0){
          String response = http.getString();
          Serial.println(httpResponseCode);
          Serial.println(response);
          if(response == "true"){
            myServo.write(90); // open the gate
            delay(5000); // wait for 5 seconds
            myServo.write(0); // close the gate
          }
        }
        else{
          Serial.print("Error on sending POST: ");
          Serial.println(httpResponseCode);
        }
        http.end();
      }
      else
      {
        Serial.print("Invalid: ");
        Serial.println((const char *)qrCodeData.payload);
      }
    }
    vTaskDelay(100 / portTICK_PERIOD_MS);
  }
  else{
    Serial.println("WiFi Disconnected");
  }
}
