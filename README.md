 ESP32 4WD Skid-Steer Rover (V1)

An open-hardware, Wi-Fi teleoperated rover designed, bare-metal ESP32, and an offline local WebSockets controller.
[Chassis Assembly CAD Render]<img width="817" height="342" alt="Screenshot 2026-10-25 051615" src="https://github.com/user-attachments/assets/00974642-a6b5-4b1a-9d46-ad7c44334fe0" />

Project Overview
it's an ESP32 controlled rover with two motor drivers controlling 4 motors with skid steering (like a tank) its powered by a 2s 18560 lithium battery  


Why did I make it?
two reasons actually first was to remove my Ideas from the drawing board and second was because I love building things that would amaze my friends and people that would see it plus it would be cool to talk about it and how I built it plus where I got my funding

How do you use it?
if it works normally you turn it on with the rocker switch and connect your device to the ESP32's wifi (assuming you have flashed the code to the ESP32) then open your browser and follow the browser countrols

 Hardware Architecture 
the ESP32 listens for inputs from the web browser on your device when it get an input like forward it sends a signal to the motor driver through one of the GPIO pins and the motor driver interpets the signals for the motors.

power architecture
from the battery pack the power is split across all the components first to the buck converter to step down the voltage to a steady 5v for the esp32 so it doesn't fry its components and for the two motor drivers for them to power the motors

 Wiring Diagram

![Wiring Diagram](<img width="856" height="728" alt="image" src="https://github.com/user-attachments/assets/a3bbf3f7-d296-4dc3-a646-c70377d9ba20" />


All system grounds are tied together to a common star-ground terminal block to eliminate signal reference drift between logic PWM and motor inductive switching.


 Bill of Materials (BOM)

Item,Description / Variant,Qty,Unit Price (USD),Total Price (USD),Link
80W Digital Soldering Iron Kit, Thermostatic LCD Soldering Iron (Black Set 2 / 220V EU Plug) ,1,12.96, 12.96, https://www.aliexpress.com/item/1005012698877194.html?spm=a2g0o.cart.0.0.5bda38dalOWPCz&mp=1&pdp_npi=6%40dis%21USD%21USD+27.57%21USD+12.96%21%21USD+12.96%21%21%21%400b15841617930654812781543e0ff2%2112000059122624875%21ct%21NG%218492089707%21%211%210%21
Replacement Soldering Iron Tips, Mix-3 PCS Soldering Tips, 1,4.86, 4.86, https://www.aliexpress.com/item/1005012574368119.html?spm=a2g0o.cart.0.0.5bda38dalOWPCz&mp=1&pdp_npi=6%40dis%21USD%21USD+5.22%21USD+4.86%21%21USD+4.86%21%21%21%400b15841617930654812781543e0ff2%2112000058753240313%21ct%21NG%218492089707%21%211%210%21
M3 Nylon Standoff Kit, 50pcs M3x10mm Hexagonal Spacers ,1 ,2.51 ,2.51, https://www.aliexpress.com/item/1005008584184387.html?spm=a2g0o.cart.0.0.5bda38dalOWPCz&mp=1&pdp_npi=6%40dis%21USD%21USD+2.60%21USD+2.51%21%21USD+2.51%21%21%21%400b15841617930654812781543e0ff2%2112000045833074277%21ct%21NG%218492089707%21%211%210%21
Metric Bolt & Nut Assortment, 420pcs M2/M3/M4 Fastener Set (420PCSM2), 1, 5.63, 5.63, https://www.aliexpress.com/item/1005008584184387.html?spm=a2g0o.cart.0.0.5bda38dalOWPCz&mp=1&pdp_npi=6%40dis%21USD%21USD+2.60%21USD+2.51%21%21USD+2.51%21%21%21%400b15841617930654812781543e0ff2%2112000045833074277%21ct%21NG%218492089707%21%211%210%21
40-Pin DuPont Jumper Wire Kit, 120pcs 20cm Male-to-Male / Male-to-Female / Female-to-Female, 1, 4.27, 4.27, https://www.aliexpress.com/item/1005006205169394.html?spm=a2g0o.cart.0.0.5bda38dalOWPCz&mp=1&pdp_npi=6%40dis%21USD%21USD+12.01%21USD+4.27%21%21USD+4.27%21%21%21%400b15841617930654812781543e0ff2%2112000036267230291%21ct%21NG%218492089707%21%211%210%21
PLATO 170 Diagonal Wire Cutters, Electronic Flush Side Cutting Nippers, 1, 2.35, 2.35, https://www.aliexpress.com/item/1005007465091242.html?spm=a2g0o.cart.0.0.5bda38dalOWPCz&mp=1&pdp_npi=6%40dis%21USD%21USD+2.35%21USD+2.35%21%21USD+2.35%21%21%21%400b15841617930654812781543e0ff2%2112000040864974557%21ct%21NG%218492089707%21%211%210%21
ANENG SZ308 Digital Multimeter, Square Wave Tester 1999 Counts with Transistor/Buzzer (Red), 1, 5.86, 5.86, https://www.aliexpress.com/item/1005007428133018.html?spm=a2g0o.cart.0.0.5bda38dalOWPCz&mp=1&pdp_npi=6%40dis%21USD%21USD+5.86%21USD+5.86%21%21USD+5.86%21%21%21%400b15841617930654812781543e0ff2%2112000040719267912%21ct%21NG%218492089707%21%211%210%21
KCD11 SPST Mini Rocker Switches, 2-Pin 10x15mm Power Switches (5pcs), 1, 1.92, 1.92, www.aliexpress.com/item/1005008778176373.html?spm=a2g0o.cart.0.0.5bda38dalOWPCz&mp=1&pdp_npi=6%40dis!USD!USD+1.92!USD+1.92!!USD+1.92!!!%400b15841617930654812781543e0ff2!12000046629830176!ct!NG!8492089707!!1!0!
18650 Battery USB Charger, 2-Slot Dual Lithium USB Charger (1pc), 1, 2.36, 2.36, https://www.aliexpress.com/item/1005013347376760.html?spm=a2g0o.cart.0.0.5bda38dalOWPCz&mp=1&pdp_npi=6%40dis%21USD%21USD+7.88%21USD+2.36%21%21USD+2.36%21%21%21%400b15841617930654812781543e0ff2%2112000060918440344%21ct%21NG%218492089707%21%211%210%21
18650 Battery Holder, 2-Slot 2S Series Battery Storage Case with Leads, 1, 1.08, 1.08, https://www.aliexpress.com/item/1005008625133461.html?spm=a2g0o.cart.0.0.5bda38dalOWPCz&mp=1&pdp_npi=6%40dis%21USD%21USD+1.08%21USD+1.08%21%21USD+1.08%21%21%21%400b15841617930654812781543e0ff2%2112000046003950474%21ct%21NG%218492089707%21%211%210%21
LM2596 DC-DC Buck Converter, Step-Down Regulator with Onboard LED Voltmeter Display, 1, 1.83, 1.83, https://www.aliexpress.com/item/1005007055625007.html?spm=a2g0o.cart.0.0.5bda38dalOWPCz&mp=1&pdp_npi=6%40dis%21USD%21USD+1.83%21USD+1.83%21%21USD+1.83%21%21%21%400b15841617930654812781543e0ff2%2112000039252295039%21ct%21NG%218492089707%21%211%210%21
L298N Dual H-Bridge Motor Driver, Dual Motor Controller Board for DC Motors, 2, 2.00, 4.00, https://www.aliexpress.com/item/32392774289.html?spm=a2g0o.cart.0.0.5bda38dalOWPCz&mp=1&pdp_npi=6%40dis%21USD%21USD+2.00%21USD+2.00%21%21USD+2.00%21%21%21%400b15841617930654812781543e0ff2%2157692613834%21ct%21NG%218492089707%21%212%210%21
ESP32 DevKit Development Board, ESP32 Type-C USB (CH340C Dual Core Wi-Fi + BLE), 1, 3.93, 3.93, https://www.aliexpress.com/item/1005004685935016.html?spm=a2g0o.cart.0.0.5bda38dalOWPCz&mp=1&pdp_npi=6%40dis%21USD%21USD+3.93%21USD+3.93%21%21USD+3.93%21%21%21%400b15841617930654812781543e0ff2%2112000030095280306%21ct%21NG%218492089707%21%211%210%21
TT Gearmotors & 65mm Wheels, 2 lots (4x Yellow TT Motors + 4x Rubber Wheels), 2, 1.12, 2.24, https://www.aliexpress.com/item/1005007519207278.html?spm=a2g0o.cart.0.0.5bda38dalOWPCz&mp=1&pdp_npi=6%40dis%21USD%21USD+1.51%21USD+1.12%21%21USD+1.12%21%21%21%400b15841617930654812781543e0ff2%2112000041105202780%21ct%21NG%218492089707%21%212%210%21
Rosin Soldering Flux Paste, 10g Plastic Box Lead-Free No-Clean Solder Rosin (2pcs), 1, 1.46, 1.46, https://www.aliexpress.com/item/1005008462401971.html?spm=a2g0o.cart.0.0.5bda38dalOWPCz&mp=1&pdp_npi=6%40dis%21USD%21USD+3.66%21USD+1.46%21%21USD+1.46%21%21%21%400b15841617930654812781543e0ff2%2112000045240051644%21ct%21NG%218492089707%21%211%210%21
Consolidated Shipping, AliExpress Standard Shipping to Lagos Nigeria, 1, 10.83, 10.83, ---
TOTAL,,, 68.09, 68.09,

its more arranged in Bom.cvs 

 Total Project Cost: $68.09 USD (including toolkit and no spear hardware).


 Build Progress & Demonstration

Comprehensive design decisions, calculations, and problem-solving logs are documented in [`JOURNAL.md`](JOURNAL.md).
  Demo Video: [Link to demo video will be added upon unboxing and hardware assembly]

 I am using a plywood cutout for the base so it will be easy to drill holes on the chassis I have already cut out its ~20×15cm (I didn't have a saw so I had to use a knife so it wasn't accurate and it had some parts of its layers sticking out so i glued them back together
for the wheels I am using the 65mm wheels that comes with the 1:47 tt motor sets
<img width="1728" height="3072" alt="IMG_20261025_073826_334@409478815" src="https://github.com/user-attachments/assets/b622adb4-9d67-42fe-bda0-6be983005e71" /> this is the cut plywood with my batteries for reference and the batteries are 1200mAh and 1500mAh pairs thats why a battery isn't part of my bom
