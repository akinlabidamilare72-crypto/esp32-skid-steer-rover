# ESP32 4WD Skid-Steer Rover (V1)

An open-hardware, Wi-Fi teleoperated rover designed with a custom dual-tier chassis, bare-metal ESP32 differential drive firmware, and an offline local WebSockets controller.
![Chassis Assembly CAD Render]<img width="1200" height="896" alt="rover_prototype_render_1792144856178" src="https://github.com/user-attachments/assets/aa842943-a18c-4fe0-a8b0-45b7de8c2606" />
<img width="1728" height="3072" alt="IMG_20261015_064420_024@1935144976" src="https://github.com/user-attachments/assets/2805a685-aa5f-4020-b0da-e2bae42692f0" />
---

## 1. Project Overview & Motivation

### What is it?
The ESP32 Skid-Steer Rover is a scratch-built, four-wheel-drive robotics testbed. It utilizes an ESP32 microcontroller running an asynchronous local web server and WebSockets daemon, allowing low-latency, bi-directional teleoperation from any desktop or mobile browser over an isolated SoftAP network—no external router or internet connection required.

### Why did I make it?
Living in Lagos, Nigeria, access to standardized robotics kits and reliable high-speed internet is limited. I wanted to design an accessible, high-torque robotic platform using locally cut birch plywood, modular off-the-shelf electronics, and rugged skid-steer kinematics. Instead of relying on proprietary remote controllers or cloud-tethered IoT apps, this platform operates 100% offline and establishes the mechanical and power foundation for a future autonomous companion vehicle.

### How do you use it?
1. Power on the rover via the main SPST rocker switch on the upper battery deck.
2. The ESP32 boots in under 3 seconds and broadcasts a local Wi-Fi Access Point: `Rover-Cockpit` (WPA2 secured).
3. Connect your laptop or phone to the network and navigate to `http://192.168.4.1` in any browser.
4. Drive using standard keyboard inputs (`W` = Forward, `S` = Reverse, `A` = Skid Left, `D` = Skid Right, `Space` = Brake) or on-screen touch joysticks.
5. The web interface provides real-time latency diagnostics and motor state telemetry.

---

## 2. Hardware Architecture & Mounting

The rover uses a two-tier chassis constructed from 4 mm birch plywood:
* **Lower Deck:** Houses four 6V DC TT gearmotors secured with M3x30 mm steel bolts through slotted motor brackets, driving four 65 mm high-traction rubber wheels.
* **Electronics Deck:** Raised 35 mm above the drivetrain via brass M3 standoffs. The ESP32 NodeMCU, dual L298N H-bridge motor drivers, and an LM2596 buck converter are mounted with M2.5 and M3 pan-head machine screws into pre-drilled chassis mounting patterns—no tape or hot glue.
* **Power Distribution:** A 2S 18650 Li-ion battery pack feeds into an LM2596 switching buck converter adjusted to a clean 5.1V logic rail, while routing high-current lines directly to the motor driver inputs with a shared star-ground topology to eliminate brownouts.

---

## 3. Wiring Diagram

![Wiring Diagram](docs/wiring_diagram.png)

*All system grounds are tied together to a common star-ground terminal block to eliminate signal reference drift between logic PWM and motor inductive switching.*

---

## 4. Bill of Materials (BOM)

A complete, itemized spreadsheet is available in [`bom.csv`](bom.csv).

* **Total Project Cost:** $75.00 USD (including toolkit and spare hardware).

---

## 5. Build Progress & Demonstration

* Comprehensive design decisions, calculations, and problem-solving logs are documented in [`JOURNAL.md`](JOURNAL.md).
* **Demo Video:** *[Link to demo video will be added upon unboxing and hardware assembly]*
