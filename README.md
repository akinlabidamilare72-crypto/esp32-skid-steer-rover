# **ESP32 4WD Skid-Steer Rover** (V1)

An open-hardware, Wi-Fi teleoperated rover designed, bare-metal ESP32, and an offline local WebSockets controller.
[Chassis Assembly CAD Render]<img width="817" height="342" alt="Screenshot 2026-10-25 051615" src="https://github.com/user-attachments/assets/00974642-a6b5-4b1a-9d46-ad7c44334fe0" />

# Project Overview
it's an ESP32 controlled rover with two motor drivers controlling 4 motors with skid steering (like a tank) its powered by a 2s 18560 lithium battery  

no custom pcb was used in this project every component was an off the shelve breakout module the firmware source code is committed and can be found in ['firmware/rover_web_controller"]
3D blender model <img width="772" height="385" alt="image" src="https://github.com/user-attachments/assets/aeb38a31-c80b-4bc1-977d-a2d8c5553fb8" />
abd the bill of material is in this file and ['bom.cvs']


# Why did I make it?
two reasons actually first was to remove my Ideas from the drawing board and second was because I love building things that would amaze my friends and people that would see it plus it would be cool to talk about it and how I built it plus where I got my funding

# How do you use it?
if it works normally you turn it on with the rocker switch and connect your device to the ESP32's wifi (assuming you have flashed the code to the ESP32) then open your browser and follow the browser countrols

 # Hardware Architecture 
the ESP32 listens for inputs from the web browser on your device when it get an input like forward it sends a signal to the motor driver through one of the GPIO pins and the motor driver interpets the signals for the motors.

# power architecture
from the battery pack the power is split across all the components first to the buck converter to step down the voltage to a steady 5v for the esp32 so it doesn't fry its components and for the two motor drivers for them to power the motors

# Wiring Diagram

![Wiring Diagram](<img width="856" height="728" alt="image" src="https://github.com/user-attachments/assets/a3bbf3f7-d296-4dc3-a646-c70377d9ba20" />


All system grounds are tied together to a common star-ground terminal block to eliminate signal reference drift between logic PWM and motor inductive switching.


 # Bill of Materials (BOM)

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


# Build Progress & Demonstration

Comprehensive design decisions, calculations, and problem-solving logs are documented in [`JOURNAL.md`](JOURNAL.md).
  build photo: [build photo will be uploaded upon completion of build]

 I am using a plywood cutout for the base so it will be easy to drill holes on the chassis I have already cut out its ~20×15cm (I didn't have a saw so I had to use a knife so it wasn't accurate and it had some parts of its layers sticking out so i glued them back together
for the wheels I am using the 65mm wheels that comes with the 1:47 tt motor sets
<img width="1728" height="3072" alt="IMG_20261025_073826_334@409478815" src="https://github.com/user-attachments/assets/b622adb4-9d67-42fe-bda0-6be983005e71" /> this is the cut plywood with my batteries for reference and the batteries are 1200mAh and 1500mAh pairs that's why a battery isn't part of my bom

reviewed by Emmanuel 
2026-10-25 
he said it was really cool and he'd like to see it built 

# How to build it
to build this the first thing I'd do is to flash the code to my esp32 you'd need to install Arduino IDE and CH340 USB-to-UART Driver in the Arduino IDE you'll go to files in files choose preference and in additional boards manager URL field pasth this   https://espressif.github.io/arduino-esp32/package_esp32_index.json   then go to tools (ensure your connected to the internet for this next step) in the tools click board then board manager and search for esp32 by Espressif systems and install version 2.0.17 required firmware libraries are asyncTCP by ESP32Async dvarrel/mathieucarbou and espasyncwebserver by me-no-dev/mathieucarbou to install just go to sketch, include library, manage libraries and search for it  or download the zip files form GitHub and add via sketch, include library and add.zip library. Then connect the esp32 to ur device through a usb cord and go to the firmware library copy or download the code in rover_web_controller and paste or open it in Arduino IDE, click the verify icon to compile the firmware and confirm all dependencies resolve click the upload icon and if the terminal displays connecting press and hold the boot button on the esp32 board for around 2 seconds until the upload starts and then release it then open the serial monitor to verify the access point initialization message and IP address
the second thing I will do is connect the battery pack to the buck converter and turn it down to a stable 5v and mount all the components and follow the wiring diagram the ESP32 should be mounted wit stand offs for proper cooling and strong signal the other components can be mounted directly on the board and pot the batteries either in the middle or close to it for maximum grip and weight distribution most of the components are screw ins or clip ons so it will be easy for almost anybody to put together and the only thing you might have to solder is the motors.
I think that's all for now I'll keep you updated on any new improvements or changes
