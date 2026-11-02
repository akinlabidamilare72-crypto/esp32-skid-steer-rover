# **ESP32 4WD Skid-Steer Rover** (V1)

An open-hardware, Wi-Fi teleoperated rover designed, bare-metal ESP32, and an offline local WebSockets controller.
[Chassis Assembly CAD Render]<img width="817" height="342" alt="Screenshot 2026-10-25 051615" src="https://github.com/user-attachments/assets/00974642-a6b5-4b1a-9d46-ad7c44334fe0" />

## Project Overview
* **Core Drivetrain:** 4-wheel-drive tank-style skid-steering, it uses 4x TT gearmotors and dual L298N motor drivers split by axle.
* **Microcontroller:** ESP32 DevKit (CH340C Type-C) you connect to it over WI-FI and control it through your web browser with almost 0 lag.
* **Power Source:** 2S 18650 Li-ion battery pack stepped down by an LM2596 buck converter.
  [3D blender model] <img width="772" height="385" alt="image" src="https://github.com/user-attachments/assets/aeb38a31-c80b-4bc1-977d-a2d8c5553fb8" />
* **Bill of material:** is in this file and (bom.csv)


### Why did I make it ### 
* to remove my ideas from what is in my mind or and my drafts to an actual real object that works as intended 
* i also wanted to test my abilities to see if I can actual build what I say I can to prove I'm no all mouth
* and it will be fun to share the experience with people that are curious about how I made it

## How do you use it?
**Power Up:** Flip on the switch 
**Connect to it's wifi:** Scan for available networks on your phone or PC and connect to the ESP32 hotspot.
**Open cockpit:** Open any web browser and navigate to http://192.168.4.1.
**Drive:**
* **Mobile Cockpit:** Use touch pedals for throttle/brake, and either the virtual steering wheel or device tilt to steer.
   * **Desktop Cockpit:** Use W, A, S, D or Arrow Keys to steer, Space for brake, and P to toggle the parking brake.
   * **Speed Limiter:** Adjust the on-screen slider for PC or slide your finger up and down the screen for the mobile version to cap maximum motor PWM.
 ## Hardware Architecture 
* **Processing & Safety:** ESP32 puts out a constant PWM for the motor driver depending on what the speed limiter is on and the motor driver then uses the pattern to give the motors the right amount of energy, gradual power increase prevents sudden current draw from battery to keep it healthy and the Esp32 has a 600ms window where if it doesn't revive an input from the device it's connected it it will apply the breaks
* **GPIO Pin map:**
  * **Driver 1 (Front Axle):**
    * `IN1` -> GPIO 25 (Front-Left Forward)
    * `IN2` -> GPIO 26 (Front-Left Reverse)
    * `IN3` -> GPIO 27 (Front-Right Forward)
    * `IN4` -> GPIO 14 (Front-Right Reverse)
  * **Driver 2 (Rear Axle):**
    * `IN1` -> GPIO 16 (Rear-Left Forward)
    * `IN2` -> GPIO 17 (Rear-Left Reverse)
    * `IN3` -> GPIO 18 (Rear-Right Forward)
    * `IN4` -> GPIO 19 (Rear-Right Reverse)

## power architecture
* **power Source:** 2S 18650 Li-ion battery pack routed through a switch.
* **Motor Rails:** once turned on the battery voltage feeds directly into the 12V terminal blocks of both L298N drivers.
* **Logic Rail:** LM2596 buck converter steps down battery voltage to a regulated 5.1V connected to the ESP32 `VIN` pin.

## Wiring Diagram

![Wiring Diagram]<img width="3000" height="1965" alt="circuit_image" src="https://github.com/user-attachments/assets/735422f3-a965-43e4-9fce-bfdbafe76946" />



 ## Bill of Materials (BOM)

the full spreadsheet with links is in (bom.csv)
| Item | Description / Variant | Qty | Unit Price (USD) | Total Price (USD) |
| :--- | :--- | :---: | :---: | :---: |
| 80W Digital Soldering Iron Kit | Thermostatic LCD Soldering Iron (Black Set 2 / 220V EU Plug) | 1 | $12.96 | $12.96 |
| Replacement Soldering Iron Tips | Mix-3 PCS Soldering Tips | 1 | $4.86 | $4.86 |
| M3 Nylon Standoff Kit | 50pcs M3x10mm Hexagonal Spacers | 1 | $2.51 | $2.51 |
| Metric Bolt & Nut Assortment | 420pcs M2/M3/M4 Fastener Set (420PCSM2) | 1 | $5.63 | $5.63 |
| 40-Pin DuPont Jumper Wire Kit | 120pcs 20cm Male-to-Male / Male-to-Female / Female-to-Female | 1 | $4.27 | $4.27 |
| PLATO 170 Diagonal Wire Cutters | Electronic Flush Side Cutting Nippers | 1 | $2.35 | $2.35 |
| ANENG SZ308 Digital Multimeter | Square Wave Tester 1999 Counts with Transistor/Buzzer (Red) | 1 | $5.86 | $5.86 |
| KCD11 SPST Mini Rocker Switches | 2-Pin 10x15mm Power Switches (5pcs) | 1 | $1.92 | $1.92 |
| 18650 Battery USB Charger | 2-Slot Dual Lithium USB Charger (1pc) | 1 | $2.36 | $2.36 |
| 18650 Battery Holder | 2-Slot 2S Series Battery Storage Case with Leads | 1 | $1.08 | $1.08 |
| LM2596 DC-DC Buck Converter | Step-Down Regulator with Onboard LED Voltmeter Display | 1 | $1.83 | $1.83 |
| L298N Dual H-Bridge Motor Driver | Dual Motor Controller Board for DC Motors | 2 | $2.00 | $4.00 |
| ESP32 DevKit Development Board | ESP32 Type-C USB (CH340C Dual Core Wi-Fi + BLE) | 1 | $3.93 | $3.93 |
| TT Gearmotors & 65mm Wheels | 2 lots (4x Yellow TT Motors + 4x Rubber Wheels) | 2 | $1.12 | $2.24 |
| Rosin Soldering Flux Paste | 10g Plastic Box Lead-Free No-Clean Solder Rosin (2pcs) | 1 | $1.46 | $1.46 |
| Consolidated Shipping | AliExpress Standard Shipping to Lagos Nigeria | 1 | $10.83 | $10.83 |
| **TOTAL** | | | | **$68.09** |

 Total Project Cost: $68.09 USD (including toolkit and no spear hardware).


## Build Progress & Demonstration

Comprehensive design decisions, calculations, and problem-solving logs are documented in [`JOURNAL.md`](JOURNAL.md).
* **build photo:** [build photo will be uploaded upon completion of build]
* **Chassis Material:** knife-cut ~20 × 15 cm birch plywood baseplate.
* **Drivetrain:** 4x 1:48 reduction yellow TT gearmotors paired with 65 mm rubber wheels.
* **Batteries On-Hand:** Tested using existing pairs of 1200 mAh and 1500 mAh 18650 cells, which is why cells are excluded from the purchase grant.
<img width="1728" height="3072" alt="IMG_20261025_073826_334@409478815" src="https://github.com/user-attachments/assets/b622adb4-9d67-42fe-bda0-6be983005e71" />

## Reviewed by:
Emmanuel
2026-10-25 
he said it was really cool and he'd like to see it built 

##  How to build it
### ESP32 Setup & Flashing
   * Install Arduino IDE and the WCH CH340USB Driver from your browser
   * In Arduino IDE open File -> Preferences and Add this URL to Additional Boards Manager URLs
 [https://espressif.github.io/arduino-esp32/package_esp32_index.json](https://espressif.github.io/arduino-esp32/package_esp32_index.json)
<img width="868" height="602" alt="image" src="https://github.com/user-attachments/assets/df186469-aac4-4e5a-a236-33456a435213" />

  * then Open Tools -> Board -> Boards Manager and search for esp32 by Espressif Systems, and install version 2.0.17.
    <img width="237" height="250" alt="image" src="https://github.com/user-attachments/assets/b599f642-e73e-4b21-b6a2-9722e897d972" />

   * Go to Sketch -> Include Library -> Manage Libraries.
   * Search for and install WebSockect by Markus Sattler.
   * <img width="247" height="270" alt="image" src="https://github.com/user-attachments/assets/8afb25a2-4a70-4fcc-804a-08359bf24102" />

   * Open firmware/rover_web_controller,
   * Connect ESP32 via USB-C or micro usb depending on which version you are with and select board: DOIT ESP32 DEVKIT .
   * Click Upload. (Hold physical BOOT button for 2 seconds if upload is stuck on on Connecting).
   * Open Serial Monitor at 115200 baud to verify startup and the IP address in case if it's different.

   * Connect the 2S battery pack through the rocker switch to LM2596 `IN+` and `IN-`.
   * Switch on and turn the brass potentiometer screw until the buck converter output reads exactly 5.10V with your multimeter if your buck converter doesn't have a display.
   * disconnect the battery before connecting it to the ESP32.
   * Fasten the four TT motors to the chassis base using M3 machine screws and nuts.
   * Mount the ESP32 elevated on M3 nylon standoffs.
   * Secure both L298N drivers and place the 18650 battery holder in the middle for balanced weight distribution.
   * Solder motor leads to TT motor tabs using rosin flux paste.
   * Connect switched battery power to L298N 12V rails and calibrated 5.1V to ESP32 `VIN`.
   * and your 4wd skid steer rover is ready to drive
   * next you'll connect your device to it's Wi-Fi and copy the IP address mentioned earlier to your browser there you'll see all the controls and u can start operating the rover

## AI DISCLOSURE
I used AI to generate the code confirm features that are possible and choose the most affordable parts that could still run all the features of the project  normally.
