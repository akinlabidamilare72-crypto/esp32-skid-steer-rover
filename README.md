<img width="1200" height="896" alt="rover_prototype_render_1792144856178" src="https://github.com/user-attachments/assets/aa842943-a18c-4fe0-a8b0-45b7de8c2606" />
# 4WD ESP32 Differential RC Car
<img width="1728" height="3072" alt="IMG_20261015_064420_024@1935144976" src="https://github.com/user-attachments/assets/2805a685-aa5f-4020-b0da-e2bae42692f0" />
A custom, high-torque 4WD robotics rover driven by an ESP32 microcontroller and dual L298N motor drivers. It features true 4-wheel independent torque vectoring, dynamic electromagnetic braking, an electronic parking brake, and a zero-install responsive web controller hosted directly from the microcontroller's internal flash memory.

---

## Key Features

- **4-Wheel Independent Drive:** Dual L298N dual H-bridge drivers power each TT gearbox on its own dedicated channel, eliminating parallel motor cross-talk and thermal overloading.
- **Dynamic 4-Corner Torque Vectoring:** Real-time electronic differential algorithms calculate wheel velocities for each corner independently, varying wheel speeds through turns to eliminate lateral tire scrub.
- **Standstill Zero-Radius Pivot:** Counter-rotates opposite wheel tracks to execute smooth 360° spins on the spot.
- **Active Electromagnetic Braking (Dynamic Braking):** Simultaneously commands 100% PWM across both motor terminals to harness back-EMF, clamping the wheels electromagnetically to prevent slope creep.
- **Electronic Parking Brake (EPB):** Latching brake system engaged via on-screen toggle or keyboard (`P`) with built-in accelerator lockout.
- **Soft-Start Current Ramping:** 12-step PWM ramping curve prevents high inrush current spikes, protecting battery chemistry and stopping ESP32 Wi-Fi brownout resets.
- **Self-Hosted Web Cockpit:** Broadcasts a private Wi-Fi SoftAP (`ESP32-Rover` at `192.168.4.1`) streaming 25Hz WebSockets telemetry. Includes forced landscape mode for mobile phones (tilt steering & touch pedals) and keyboard navigation (WASD, Arrow keys, Numpad) with an adjustable Max Power speed governor.

---

## Bill of Materials & Final Procurement Budget

The vehicle hardware, diagnostic tools, and assembly supplies are budgeted under the Hack Club Forge Tier 3 Grant program ($97.50+ balance)[cite: 7, 30].

| Component / Item | Qty | Price (USD) | Function & Role |
| :--- | :--- | :--- | :--- |
| **ESP32 NodeMCU Dev Board** | 1 | $4.20 | Core processor, SoftAP web server, 8-channel LEDC PWM |
| **L298N Dual H-Bridge Drivers** | 2 | $4.50 | High-current motor power stages with heatsinks (Front & Rear axles) |
| **LM2596 DC-DC Buck Converter** | 1 | $2.10 | Steps 7.4V battery pack down to regulated 5.00V for logic rail |
| **Yellow TT DC Gearmotors (1:48)** | 4 | $6.20 | 3V–6V geared drive motors providing high low-end torque |
| **65mm All-Terrain Robot Wheels** | 4 | *(bundled)* | Knobby rubber tires with yellow 5-spoke D-shaft hubs |
| **2-Slot 18650 Battery Holder** | 1 | $0.90 | Series-wired battery sled providing 7.4V nominal output |
| **SPST Power Rocker Switch** | 1 | $0.80 | Master physical disconnect on positive battery rail |
| **Dupont Ribbon Jumper Wires (120pcs)**| 1 set | $4.26 | 20cm Female-to-Female, Male-to-Female interconnects |
| **M3 Nylon Standoffs (50pcs)** | 1 pack | $2.51 | Insulated air-gap spacers to mount PCBs off the chassis |
| **Metric Bolt Assortment (M2/M3/M4)** | 1 box | $5.62 | Machine screws & nuts to anchor standoffs through 3mm plywood |
| **Replacement 5V USB Soldering Tips** | 3 pcs | $4.85 | Restores portable USB soldering iron for bench assembly |
| **Plato 170 Flush Wire Cutters** | 1 | $1.85 | Clean trimming of wires, component leads, and zip-ties |
| **Mini 20W Hot Melt Glue Gun + Sticks**| 1 kit | $3.80 | Structural mounting for motor brackets and harness routing |
| **Rosin Paste Soldering Flux** | 1 tub | $2.00 | Non-corrosive chemical deoxidizer for motor lug solder joints |
| **ANENG Digital Multimeter** | 1 | $6.80 | Verifies buck converter voltage tuning and continuity |
| **Consolidated International Freight** | 1 | $17.68 | Consolidated courier shipping to Lagos, Nigeria[cite: 32] |
| **Item Subtotal** | | **$62.08** | *(Reflects platform discounts applied)*[cite: 32] |
| **Grand Total (Order Checkout)** | | **$79.76** | **Fully funded by approved Forge Grant ($17+ reserve)**[cite: 30, 32] |

*Note: Sourced on-hand stock includes a 47 cm x 18 cm birch plywood plate (trimmed to 200 mm x 150 mm) and five 3.7V 18650 lithium-ion cells organized into matched 2S packs (Pack A: 2x 1200mAh, Pack B: 2x 1500mAh).*

---

## Hardware Pinout & Architecture

### ESP32 GPIO to Motor Driver Mapping
ESP32 Microcontroller ]
├── GPIO 25 ──> Driver 1 (Front Axle) IN1 ──> Front-Left Forward
├── GPIO 26 ──> Driver 1 (Front Axle) IN2 ──> Front-Left Reverse
├── GPIO 27 ──> Driver 1 (Front Axle) IN3 ──> Front-Right Forward
├── GPIO 14 ──> Driver 1 (Front Axle) IN4 ──> Front-Right Reverse
├── GPIO 16 ──> Driver 2 (Rear Axle)  IN1 ──> Rear-Left Forward
├── GPIO 17 ──> Driver 2 (Rear Axle)  IN2 ──> Rear-Left Reverse
├── GPIO 18 ──> Driver 2 (Rear Axle)  IN3 ──> Rear-Right Forward
└── GPIO 19 ──> Driver 2 (Rear Axle)  IN4 ──> Rear-Right Reverse

### Power Distribution Schematic
[2x 18650 Li-ion Cells (7.4V - 8.4V)]
│
├── (Black Wire -) ──────────────────────────┐
│                                            │
└── (Red Wire +) ──> [SPST Power Switch]     │
│                │
┌───────────────┴────────┐       │
│                        │       │
[Driver 1: +12V]         [Driver 2: +12V] │
│                        │       │
└───────────────┬────────┘       │
│                │
[LM2596 Buck: IN (+)]       │
[LM2596 Buck: IN (-)] <─────┘
│
(Tuned to 5.00V)
│
[ ESP32: VIN / 5V ]
[ ESP32: GND Pin  ]
*Common Ground Rail: Battery Negative, Driver 1 GND, Driver 2 GND, LM2596 IN/OUT (-), and ESP32 GND are tied together.*

---

## Chassis Geometry

- **Material:** 3mm Birch Plywood
- **Dimensions:** 200 mm (Length) $\times$ 150 mm (Width)
- **Wheelbase-to-Track Ratio:** ~1.2:1 (optimizes skid-steer pivoting and prevents high-friction wheel binding)
- **CAD Source:** Fully parametric OpenSCAD script located at `hardware/chassis_base.scad`[cite: 13]

---
