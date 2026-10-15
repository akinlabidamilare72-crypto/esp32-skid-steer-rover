// ESP32 4WD RC Car Skid-Steer Controller
#define IN1 25
#define IN2 26
#define IN3 27
#define IN4 14

void setup() {
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);
  pinMode(IN3, OUTPUT);
  pinMode(IN4, OUTPUT);
  Serial.begin(115200);
}

void loop() {
  // Motor control logic will be populated here
}
