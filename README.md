# 4WD ESP32 Differential RC Car

A remote-controlled 4WD robot car driven by an ESP32 microcontroller, utilizing dual-channel skid-steering and an electronic differential layout mounted on a custom lightweight plywood chassis.

![Chassis and Hardware Overview](motors.jpg)

## Bill of Materials

| Component | Quantity | Estimated Price | Function |
| :--- | :--- | :--- | :--- |
| ESP32 Development Board | 1 | $4.50 | Brain and Bluetooth receiver |
| L298N Dual H-Bridge Driver | 1 | $2.50 | High-current motor control |
| LM2596 Buck Converter (LED display) | 1 | $1.80 | Steps 7.4V down to 5.0V for logic |
| 18650 3.7V Li-ion Cells | 2 | $2.00 | Main power pack (7.4V series) |
| 2-Slot 18650 Battery Holder | 1 | $0.80 | Series cell mount |
| TT Gear Motors & Rubber Wheels | 4 | $6.00 | Geared drive system |
| Dupont Wires & Rocker Switch | 1 set | $1.50 | Circuit interconnects and power toggle |
| Plywood Plate & Standoffs | 1 | $3.00 | Chassis structure |

## Wiring Diagram & Power Routing

Since this project uses point-to-point hand wiring with screw terminals, the complete schematic flow is detailed below:
