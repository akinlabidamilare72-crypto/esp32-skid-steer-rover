<img width="1728" height="3072" alt="IMG_20261015_064420_024@1935144976" src="https://github.com/user-attachments/assets/c110f218-3873-4c6f-8ec3-19eeb7575c72" />
# esp32-skid steer rover
A 4-wheel-drive remote control car powered by an ESP32 and controlled over Bluetooth/Wi-Fi. Designed with an independent dual-channel drive system (skid-steer/electronic differential) mounted on a custom plywood chassis.
===

# 

# \## Features

# \- \*\*Brain:\*\* ESP32 development board running custom PWM skid-steering logic.

# \- \*\*Motor Control:\*\* L298N Dual H-Bridge driver powering 4 TT gear motors.

# \- \*\*Power System:\*\* 2x 18650 Li-ion cells (\~7.4V) stepped down to 5.0V via an LM2596 buck converter for safe microcontroller logic.

# \- \*\*Chassis:\*\* Lightweight custom plywood platform with rubber high-traction wheels.

# 

# \## Bill of Materials (BOM)

# 

# | Item | Qty | Estimated Cost | Purpose |

# | :--- | :--- | :--- | :--- |

# | ESP32 Dev Board | 1 | \~$4.50 | Brain \& Bluetooth controller |

# | L298N Motor Driver Module | 1 | \~$2.50 | Dual H-bridge motor current controller |

# | LM2596 Buck Converter (with LED readout) | 1 | \~$1.80 | Regulates 7.4V battery pack down to stable 5.0V |

# | 18650 3.7V Batteries | 2 | \~$2.00 | Main power pack (in series = 7.4V) |

# | 2-Slot 18650 Battery Holder | 1 | \~$0.80 | Series battery tray with leads |

# | 4WD TT Gear Motors + Wheels | 4 | \~$6.00 | Drive system and traction |

# | Dupont Jumper Wires \& Power Switch | 1 set | \~$1.50 | Connections and circuit power cutoff |

# | Plywood base \& hardware | 1 | \~$3.00 | Chassis platform |

# | \*\*Total\*\* | | \*\*\~$22.10\*\* | \*\*Tier 3 Grant Budget Range\*\* |

# 

# \## Power Flow

# `\[2x 18650 (7.4V)]` ➔ `\[L298N 12V In]` ➔ `\[Motors (PWM-controlled)]`  

# `\[2x 18650 (7.4V)]` ➔ `\[LM2596 Buck Converter (tuned to 5.0V)]` ➔ `\[ESP32 VIN / GND]`


