# Build Journal

### Entry 1: Planning, Research & Safety
- **Goal:** Build an RC vehicle with skid/differential steering using an ESP32.
- **Initial Testing & Lessons Learned:**
  - Tested small direct DC motors with two 3.7V lithium cells in series (7.4V); identified overheating/burning smell from over-voltage and lack of current regulation.
  - Decided to switch to geared TT motors with higher torque and use an L298N driver with PWM regulation to manage motor speeds safely.
- **Power Architecture Finalized:**
  - Standardized on a 2S 18650 setup.
  - Added an LM2596 buck converter with an onboard voltmeter to drop 7.4V down to 5.0V, preventing ESP32 brownouts when Wi-Fi/Bluetooth transmits.
- **Next Steps:**
  - Submit parts list to Hack Club Forge (Tier 3).
  - Cut chassis baseplate from 3mm/4mm plywood once motor dimensions are confirmed.

---

### Entry 2: [Date]
- **Accomplished today:** ...
- **Blockers / Problems faced:** ...
- **Fix:** ...