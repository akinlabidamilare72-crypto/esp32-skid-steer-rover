<img width="1728" height="3072" alt="IMG_20261015_064420_024@1935144976" src="https://github.com/user-attachments/assets/adc9bc22-07ae-421f-b4fb-dff54321af03" />
# Build Journal

## Entry 1: Component Sourcing and Power Architecture Research
**Time spent:** 2 hours

### Work Done
- Inspected the 5 small DC motors currently available for testing.
- Researched power dissipation and overheating issues when running hobby DC motors directly off series lithium cells.
- Evaluated motor drivers and confirmed the full-size L298N dual H-bridge module with screw terminals and a heatsink is required.
- Formulated the power delivery network: using two 3.7V 18650 cells in series (~7.4V) stepped down to 5.0V using an LM2596 buck converter to supply the ESP32 logic without triggering brownout reboots.

### Progress Photo
![Initial Motor Hardware](motors.jpg)
