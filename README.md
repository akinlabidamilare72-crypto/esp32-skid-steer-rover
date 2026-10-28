 ESP32 4WD Skid-Steer Rover (V1)

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


 Bill of Materials (BOM)



 Total Project Cost: $68.09 USD (including toolkit and no spear hardware).


 Build Progress & Demonstration

Comprehensive design decisions, calculations, and problem-solving logs are documented in [`JOURNAL.md`](JOURNAL.md).
  build photo: [build photo will be uploaded upon completion of build]

 I am using a plywood cutout for the base so it will be easy to drill holes on the chassis I have already cut out its ~20×15cm (I didn't have a saw so I had to use a knife so it wasn't accurate and it had some parts of its layers sticking out so i glued them back together
for the wheels I am using the 65mm wheels that comes with the 1:47 tt motor sets
<img width="1728" height="3072" alt="IMG_20261025_073826_334@409478815" src="https://github.com/user-attachments/assets/b622adb4-9d67-42fe-bda0-6be983005e71" /> this is the cut plywood with my batteries for reference and the batteries are 1200mAh and 1500mAh pairs thats why a battery isn't part of my bom

reviewed by Emmanuel 
2026-10-25 
he said it was really cool and he'd like to see it built 
