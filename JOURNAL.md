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

![Wokwi ESP32 Circuit Simulation](simulation.png<img width="471" height="527" alt="Screenshot 2026-10-16 062113" src="https://github.com/user-attachments/assets/2c5ff5c3-d797-4138-95cc-10167df7ad09" />
)
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
## Entry 5 - Landscape UI Architecture, Input Expansion & Mobile Optimization (3h 30m)

**Time spent:** 3 hours 30 mins

### Work Done
- **Mobile Landscape & Orientation Locking:**
  - Implemented an embedded Web App Manifest configured with `"orientation": "landscape"` and `"display": "standalone"` to force horizontal orientation when launched from the home screen.
  - Added a one-tap fullscreen and `screen.orientation.lock()` routine to automatically transition mobile browsers into landscape mode even with system portrait lock active.
  - Designed an adaptive portrait orientation alert overlay with auto-rotation guidance.
- **Hardware-Level Device Detection:**
  - Replaced brittle CSS screen-width media queries with unified hardware pointer detection (`pointer: coarse`, `navigator.maxTouchPoints`, and touch-capability testing) to prevent wide horizontal mobile screens from incorrectly triggering desktop views.
  - Added a manual header override button allowing instant toggling between mobile and desktop layouts.
- **Ergonomic Control Layout Adjustments:**
  - **Steering Mode:** Anchored the virtual steering wheel to the left thumb area while stacking both pedals on the right.
  - **Tilt Mode:** Configured dynamic DOM state changes that automatically remove the wheel and position the Brake pedal on the far left and the Accelerate pedal on the far right.
  - **Asymmetric Pedal Sizing:** Rescaled the Accelerate pedal to 175px height for fine throttle graduation, while keeping the Brake pedal distinctly shorter and wider at 120px.
  - **Steering Throw:** Expanded virtual wheel rotation limits from $\pm 80^\circ$ to $\pm 150^\circ$ ($300^\circ$ total sweep) to improve turning precision.
- **Desktop Input & Slider Shielding:**
  - Expanded desktop keyboard listeners to seamlessly map Arrow keys and Numpad keys (8, 4, 6, 2, 5) regardless of NumLock state.
  - Fixed speed limiter focus hijacking by implementing automatic element blurring (`blur()`) and `preventDefault()` keyboard shields, preventing driving arrow keys from accidentally adjusting the power slider percentage.

### Progress Photo
![Landscape Controller UI](## Entry 4 - Landscape UI Architecture, Input Expansion & Mobile Optimization (3h 30m)

**Time spent:** 3 hours 30 mins

### Work Done
- **Mobile Landscape & Orientation Locking:**
  - Implemented an embedded Web App Manifest configured with `"orientation": "landscape"` and `"display": "standalone"` to force horizontal orientation when launched from the home screen.
  - Added a one-tap fullscreen and `screen.orientation.lock()` routine to automatically transition mobile browsers into landscape mode even with system portrait lock active.
  - Designed an adaptive portrait orientation alert overlay with auto-rotation guidance.
- **Hardware-Level Device Detection:**
  - Replaced brittle CSS screen-width media queries with unified hardware pointer detection (`pointer: coarse`, `navigator.maxTouchPoints`, and touch-capability testing) to prevent wide horizontal mobile screens from incorrectly triggering desktop views.
  - Added a manual header override button allowing instant toggling between mobile and desktop layouts.
- **Ergonomic Control Layout Adjustments:**
  - **Steering Mode:** Anchored the virtual steering wheel to the left thumb area while stacking both pedals on the right.
  - **Tilt Mode:** Configured dynamic DOM state changes that automatically remove the wheel and position the Brake pedal on the far left and the Accelerate pedal on the far right.
  - **Asymmetric Pedal Sizing:** Rescaled the Accelerate pedal to 175px height for fine throttle graduation, while keeping the Brake pedal distinctly shorter and wider at 120px.
  - **Steering Throw:** Expanded virtual wheel rotation limits from $\pm 80^\circ$ to $\pm 150^\circ$ ($300^\circ$ total sweep) to improve turning precision.
- **Desktop Input & Slider Shielding:**
  - Expanded desktop keyboard listeners to seamlessly map Arrow keys and Numpad keys (8, 4, 6, 2, 5) regardless of NumLock state.
  - Fixed speed limiter focus hijacking by implementing automatic element blurring (`blur()`) and `preventDefault()` keyboard shields, preventing driving arrow keys from accidentally adjusting the power slider percentage.

### Progress Photo
![Landscape Controller UI](<img width="1442" height="506" alt="image" src="https://github.com/user-attachments/assets/e34366be-5f77-46f0-8101-16e0bc4b2b28" />
<img width="1917" height="926" alt="image" src="https://github.com/user-attachments/assets/ff758122-bca1-4c7f-b606-287299af4af5" />
)
## Entry 6 - Dual-Driver Architecture & 4-Wheel Torque Vectoring (3h 00m)

**Time spent:** 3 hours

### Work Done
- **Drivetrain Architecture Upgrade:**
  - Upgraded drivetrain topology from a 2-channel paired skid-steer layout to a true **4-channel independent all-wheel-drive (AWD)** system using dual L298N H-bridge motor drivers.
  - Eliminated parallel-wired motor pairs so each TT gearbox receives dedicated current without thermal overload or cross-motor back-EMF interference.
- **Microcontroller Pin & PWM Expansion:**
  - Expanded ESP32 GPIO allocation to 8 dedicated output pins:
    - Front Axle (Driver 1): `FL_IN1` (GPIO 25), `FL_IN2` (GPIO 26), `FR_IN3` (GPIO 27), `FR_IN4` (GPIO 14)
    - Rear Axle (Driver 2): `RL_IN1` (GPIO 16), `RL_IN2` (GPIO 17), `RR_IN3` (GPIO 18), `RR_IN4` (GPIO 19)
  - Configured 8 independent ESP32 LEDC hardware PWM timer channels operating at 1 kHz with 8-bit resolution (0–255 duty cycle) to provide silent, continuous torque control.
- **4-Corner Electronic Differential & Torque Vectoring:**
  - Implemented real-time proportional differential math that calculates wheel velocity curves for each corner independently during turns:
    - Front-outside wheel runs at maximum commanded speed ($100\%$).
    - Rear-outside wheel tracks tightly behind at $85\%$ speed.
    - Front-inside wheel crawls through the inner radius at $30\%$ speed.
    - Rear-inside wheel pivots at the apex at $15\%$ speed to completely eliminate tire scrubbing.
  - Preserved standstill zero-radius counter-rotation for sharp 360° spins.
  - Applied 4-channel synchronized soft-start ramping (`RAMP_STEP`) to protect the 7.4V battery pack from sudden inrush current spikes.
- **Power Delivery Finalization:**
  - Confirmed 2S series architecture (7.4V nominal) using existing 1200mAh 18650 cells in a hot-swap configuration, keeping the rover lightweight and agile while avoiding excessive weight or gear wear.

### Progress Photo
![Dual Driver Firmware Update](<img width="442" height="392" alt="image" src="https://github.com/user-attachments/assets/3955c97f-0e7e-4b45-bd72-3630ffc47afa" />
## Entry 7 - Power Architecture Audit, Cell Matching & Chassis Sizing (2h 30m)

**Time spent:** 2 hours 30 mins

### Work Done
- **Lithium-Ion Inventory & Cell Matching:**
  - Audited the available 18650 cell stock: identified two 1200mAh cells, two 1500mAh cells, and one unmarked spare cell.
  - Investigated discharge behavior: determined why small direct-drive DC motors tolerated AAA cells (high internal resistance causing natural voltage sag under load) while lithium-ion cells dumped high, unrestricted current.
  - Implemented cell-balancing safety rules: organized the batteries into two dedicated, capacity-matched 2S packs (2x 1200mAh and 2x 1500mAh) to prevent cell reversal during series discharge. The mystery cell was permanently isolated for standalone 1-cell bench testing.
- **Physical Chassis Stock & Turning Geometry:**
  - Acquired a 47 cm x 18 cm piece of birch plywood for the main chassis platform.
  - Calculated skid-steer mechanical geometry: determined that mounting wheels to the full 47 cm length would create an overly long wheelbase, resulting in excessive lateral tire scrubbing that would stall TT gearmotors during zero-radius turns.
  - Marked cutting dimensions to trim the board down to 20 cm x 15 cm, maintaining an optimal ~1.2:1 wheelbase-to-track width ratio for responsive pivoting.
- **System Architecture Audit & Budget Optimization:**
  - Evaluated external design feedback and de-scoped unnecessary subsystems (such as complex optical wheel encoders and auxiliary power distribution boards) to preserve software reliability and minimize points of failure.
  - Decided to utilize the LM2596 buck converter's onboard LED display to monitor raw battery voltage at a glance, removing the need for a separate analog resistor divider.
  - Optimized the procurement cart to protect a $20+ reserve for the Hack Club Forge shop soldering kit.

### Progress Photo
![Chassis Stock and Battery Inventory](## Entry 7 - Power Architecture Audit, Cell Matching & Chassis Sizing (2h 30m)

**Time spent:** 2 hours 30 mins

### Work Done
- **Lithium-Ion Inventory & Cell Matching:**
  - Audited the available 18650 cell stock: identified two 1200mAh cells, two 1500mAh cells, and one unmarked spare cell.
  - Investigated discharge behavior: determined why small direct-drive DC motors tolerated AAA cells (high internal resistance causing natural voltage sag under load) while lithium-ion cells dumped high, unrestricted current.
  - Implemented cell-balancing safety rules: organized the batteries into two dedicated, capacity-matched 2S packs (2x 1200mAh and 2x 1500mAh) to prevent cell reversal during series discharge. The mystery cell was permanently isolated for standalone 1-cell bench testing.
- **Physical Chassis Stock & Turning Geometry:**
  - Acquired a 47 cm x 18 cm piece of birch plywood for the main chassis platform.
  - Calculated skid-steer mechanical geometry: determined that mounting wheels to the full 47 cm length would create an overly long wheelbase, resulting in excessive lateral tire scrubbing that would stall TT gearmotors during zero-radius turns.
  - Marked cutting dimensions to trim the board down to 20 cm x 15 cm, maintaining an optimal ~1.2:1 wheelbase-to-track width ratio for responsive pivoting.
- **System Architecture Audit & Budget Optimization:**
  - Evaluated external design feedback and de-scoped unnecessary subsystems (such as complex optical wheel encoders and auxiliary power distribution boards) to preserve software reliability and minimize points of failure.
  - Decided to utilize the LM2596 buck converter's onboard LED display to monitor raw battery voltage at a glance, removing the need for a separate analog resistor divider.
  - Optimized the procurement cart to protect a $20+ reserve for the Hack Club Forge shop soldering kit.

### Progress Photo
![Chassis Stock](<img width="877" height="722" alt="image" src="https://github.com/user-attachments/assets/9dd76718-5dcb-4bea-9c29-daf3c332a5b0" />
)
## Entry 8 - Dynamic Electromagnetic Braking, EPB & Slider Debugging (2h 00m)

**Time spent:** 2 hours

### Work Done
- **Dynamic Electromagnetic Braking:**
  - Implemented an active dynamic braking routine (`applyDynamicBrake()`) across both L298N drivers by commanding 100% PWM duty cycle (`255`) to both forward and reverse channels simultaneously.
  - Utilized motor back-EMF to create an electromagnetic clamp across all four wheel terminals, preventing the vehicle from creeping on slopes or inclines.
- **Electronic Parking Brake (EPB) Integration:**
  - Added a latching parking brake state toggled by the **`P`** key on desktop and a dedicated **`🅿️ PARK`** header button on mobile.
  - Integrated visual feedback (red glowing indicators) and programmed an accelerator safety lockout that overrides the throttle while the parking brake is engaged.
- **UI Event Listener & Speed Limiter Fixes:**
  - Diagnosed and resolved mobile browser rendering glitches where C++ `#include` headers appeared as raw text during local preview.
  - Fixed an event listener conflict on the desktop speed limiter: removed the aggressive `keydown` focus blur that was resetting the slider when holding down the **`W`** drive key, enabling seamless on-the-fly speed adjustments while moving.
- **Single-Binary Firmware Architecture:**
  - Consolidated the entire web application (HTML5, responsive CSS, PointerEvents JavaScript, and WebSockets client) into a single `PROGMEM` string within `rover_web_controller.ino`.
  - Confirmed compilation integrity in Arduino IDE, ensuring the physical ESP32 handles Wi-Fi access point broadcast, HTTP delivery, and real-time motor control from a single uploaded sketch.

### Progress Photo
![EPB and Slider Fix](<img width="1297" height="461" alt="image" src="https://github.com/user-attachments/assets/73c31953-c6ef-404e-9016-182151f7ca84" />
)
- **Dynamic Electromagnetic Braking & EPB:**
  - Implemented an active dynamic braking routine (`applyDynamicBrake()`) across both L298N drivers by commanding 100% PWM duty cycle (`255`) to both forward and reverse channels simultaneously, shorting motor terminals to harness back-EMF and prevent slope creep.
  - Added a latching Electronic Parking Brake (EPB) toggled by the **`P`** key on desktop and a dedicated **`🅿️ PARK`** header button on mobile, complete with visual glowing states and an accelerator lockout safety override.
- **UI Event Listener & Speed Limiter Shielding:**
  - Resolved mobile browser rendering bugs where C++ headers leaked into local preview files by isolating clean HTML/JS assets.
  - Fixed an event listener conflict on the desktop speed limiter: shielded the slider from continuous `keydown` focus blur events so speed limits can be smoothly adjusted while actively holding drive keys (`W/A/S/D`).
- **ESP32 GPIO Hardware Pinout Audit:**
  - Conducted a deep architectural review of the 8 motor logic pins:
    - Dedicated glitch-free digital outputs: Front Axle on GPIO 25, 26, 27, 14; Rear Axle on GPIO 16, 17, 18, 19.
    - Specifically avoided input-only pins (GPIO 34, 35, 36, 39) which lack internal output driving transistors.
    - Avoided critical boot-strapping pins (GPIO 0, 2, 12, 15) to ensure motor driver impedance does not pull pins low at startup and lock the ESP32 out of flash execution mode.
- **Toolchain Consolidation & BOM Synchronization:**
  - Streamlined the assembly toolchain: replaced scattered soldering accessories with a comprehensive 80W digital LCD thermostatic soldering iron kit (220V-240V EU Type C plug) containing a metal stand, cleaning sponge, solder wire, tweezers, and 5x 900M tips.
  - Locked final procurement cart at **$88.21**, fully funded within the approved Forge Tier 3 grant balance with surplus reserved for local battery procurement.
  - Completely updated `README.md` to reflect the 8-channel pinout schematic, dynamic torque vectoring equations, and finalized procurement table.
