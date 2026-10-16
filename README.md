# 4WD ESP32 Differential RC Car
<img width="1728" height="3072" alt="IMG_20261015_064420_024@1935144976" src="https://github.com/user-attachments/assets/2805a685-aa5f-4020-b0da-e2bae42692f0" />

A remote-controlled 4WD robot car driven by an ESP32 microcontroller, utilizing dual-channel skid-steering and an electronic differential layout mounted on a custom lightweight plywood chassis.

![Chassis and Hardware Overview](motors.jpg)![Motor Hardware](motors.jpg)

![Chassis Layout](motors.jpg)

## Bill of Materials
| Component | Quantity | Estimated Price | Function |
| :--- | :--- | :--- | :--- |
| ESP32 Development Board | 1 | $4.50 | Brain and Bluetooth receiver |
| L298N Dual H-Bridge Driver | 1 | $2.50 | High-current motor control |
| LM2596 Buck Converter (LED display) | 1 | $1.80 | Steps 7.4V down to 5.0V for logic |
| 18650 3.7V Li-ion Cells | 2 | $2.00 | Main power pack (7.4V series) |
| 2-Slot 18650 Battery Holder | 1 | $0.80 | Series cell mount |
| USB 18650 Charger Cradle | 1 | $2.00 | Recharges lithium battery cells |
| TT Gear Motors & Rubber Wheels | 4 | $6.00 | Geared drive system and high-traction tires |
| Dupont Wires & Rocker Switch | 1 set | $1.50 | Circuit interconnects and power toggle |
| Rosin Paste Soldering Flux | 1 tub | $2.00 | Clean solder flow on motor contacts |
| Replacement Soldering Tips | 1 pack | $2.50 | Fine-tip heat transfer for terminal joints |
| Mini Hot Glue Gun + Glue Sticks | 1 set | $4.00 | Secures motors, boards, and wiring to chassis |
| Plywood Plate & Standoffs | 1 | $3.00 | Chassis structure |
| **Total** | | **$32.60** | **Fully within $35.00 Forge Grant Balance** |
## Wiring Diagram & Power Routing

Since this project uses point-to-point hand wiring with screw terminals, the complete schematic flow is detailed below:
[2x 18650 Cells (7.4V)]
|
+---> [SPST Power Switch]
|
+--------------------+
|                    |
[L298N 12V In]      [LM2596 In (+)]
[L298N GND] <------+ [LM2596 In (-)]
|
(Stepped to 5.0V)
|
[ESP32 5V / VIN]
[ESP32 GND]

Control Connections:

ESP32 GPIO 25 ---> L298N IN1 (Left Forward)

ESP32 GPIO 26 ---> L298N IN2 (Left Reverse)

ESP32 GPIO 27 ---> L298N IN3 (Right Forward)

ESP32 GPIO 14 ---> L298N IN4 (Right Reverse)

Common Ground : ESP32 GND connected to L298N GND & Battery Negative
## Chassis Layout
The chassis is constructed from 3mm/4mm cut plywood with motor brackets mounted on the underside. Detailed cutting templates and 3D mount files are organized in the `/hardware` folder.
