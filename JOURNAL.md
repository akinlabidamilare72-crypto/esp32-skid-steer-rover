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

### Simulation Screenshot
![Wokwi ESP32 Circuit Simulation](simulation.png)
## Entry 3 - Wokwi Simulation Wiring and Pin Validation (2h 00m)

**Time spent:** 2 hours

### Work Done
- Built the interactive breadboard circuit on Wokwi to validate ESP32 GPIO logic before hardware procurement.
- Wired 4 channel indicator LEDs through current-limiting resistors to pins 25, 26, 27, and 14 to represent L298N forward/reverse inputs.
- Resolved analog ground loop errors by tying the joystick common ground rail back to ESP32 GND.
- Tested differential turning calculations and verified dual-track outputs in real time.

### Simulation Photo
![Simulation Testing](simulation.png)
