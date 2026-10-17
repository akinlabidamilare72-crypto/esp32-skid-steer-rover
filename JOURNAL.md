<img width="1728" height="3072" alt="IMG_20261015_064420_024@1935144976" src="https://github.com/user-attachments/assets/adc9bc22-07ae-421f-b4fb-dff54321af03" />
# Build Journal

## Entry 1 - Planning and Motor Testing (2h 00m)

**Time spent:** 2 hours

### Work Done
- Tested small DC hobby motors with 3.7V lithium cells in series; observed high current draw and thermal overheating.
- Designed power delivery architecture: stepping down a 7.4V pack to 5.0V via an LM2596 buck converter to supply the ESP32.
- Outlined dual-channel skid-steering control scheme using an L298N driver.

### Hardware Photo
![Motors](motors.jpg)
## Entry 2 - Firmware Simulation and Differential Logic (3h 00m)

**Time spent:** 3 hours

### Work Done
- Built a virtual testing environment on Wokwi featuring the ESP32, an analog joystick, and 4 status LEDs to represent the L298N motor channels.
- Resolved circuit issues: corrected floating analog ground loops by tying joystick GND back to the ESP32 common ground rail and corrected GPIO pin mappings.
- Wrote and tested differential steering logic in C++:
  - Straight forward/reverse driving triggers both motor banks in tandem.
  - Directional steering reduces or cuts power to the inside wheel track to simulate tank/skid steering.
  - Zero-radius spins reverse opposite tracks when turning from a standstill.

### Simulation Screenshot<img width="1200" height="896" alt="rover_prototype_render_1792144856178" src="https://github.com/user-attachments/assets/663ae476-8126-4e1e-9af7-e7ab5e48a88d" />

![Wokwi ESP32 Circuit Simulation](simulation.png)
## Entry 3 - Wokwi Simulation Wiring and Pin Validation (2h 00m)

**Time spent:** 3 hours

### Work Done
- Built the interactive breadboard circuit on Wokwi to validate ESP32 GPIO logic before hardware procurement.
- Wired 4 channel indicator LEDs through current-limiting resistors to pins 25, 26, 27, and 14 to represent L298N forward/reverse inputs.
- Resolved analog ground loop errors by tying the joystick common ground rail back to ESP32 GND.
- Tested differential turning calculations and verified dual-track outputs in real time.

### Simulation Photo
![Simulation Testing](simulation.png)
### Prototype Chassis & Layout Render
Designed the physical layout showing board spacing, 3mm laser-cut plywood chassis, motor offsets, and wiring routes:

![3D Chassis and Electronics Layout](![Uploading rover_prototype_render_1792144856178.jpg…]()
)
## Entry 4 - Full-Stack Web Controller UI & WebSocket Firmware (3h 00m)

**Time spent:** 3 hours

### Work Done
- Shifted architecture from standard Bluetooth serial to a standalone ESP32 SoftAP web server hosting its own in-browser controller at `192.168.4.1`.
- Designed and built the responsive web dashboard:
  - Mobile interface: Ergonomic layout with the brake pedal locked to the far-left and the accelerator slider to the far-right for natural two-thumb driving.
  - Gyroscope & Tilt integration: Implemented device orientation handling so the virtual steering wheel automatically hides when tilt mode is active.
  - Desktop interface: Added full WASD keyboard event listeners and a dynamic "Max Power / Speed Limiter" slider.
- Embedded the HTML, CSS, and client-side JavaScript directly into ESP32 PROGMEM flash memory.
- Integrated low-latency WebSockets (port 81) to transmit packet states at 25Hz, complete with a 600ms safety watchdog that cuts power if connection drops.
- Programmed dual H-bridge motor logic with soft-start PWM acceleration ramping to prevent current spikes and brownout resets.

### Progress Photo
<img width="1050" height="727" alt="image" src="https://github.com/user-attachments/assets/0eb8216e-0e03-4075-91df-f43c8bc67757" /> <img width="950" height="522" alt="image" src="https://github.com/user-attachments/assets/3d27a0d9-baaa-419c-b0e6-7df8e7da05f4" />


