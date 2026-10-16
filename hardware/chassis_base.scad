// 4WD Differential RC Car Chassis
// Editable OpenSCAD Source Design

chassis_length = 200; // mm
chassis_width  = 150; // mm
chassis_thick  = 3;   // mm (3mm plywood sheet)
hole_radius    = 1.5; // 3mm screw clearance

difference() {
    // Base plate outline
    cube([chassis_length, chassis_width, chassis_thick], center = true);

    // Front and rear motor bracket mounting holes
    translate([ 80,  60, 0]) cylinder(h = chassis_thick + 2, r = hole_radius, center = true, $fn = 20);
    translate([ 80, -60, 0]) cylinder(h = chassis_thick + 2, r = hole_radius, center = true, $fn = 20);
    translate([-80,  60, 0]) cylinder(h = chassis_thick + 2, r = hole_radius, center = true, $fn = 20);
    translate([-80, -60, 0]) cylinder(h = chassis_thick + 2, r = hole_radius, center = true, $fn = 20);

    // Center wiring pass-through slot
    translate([0, 0, 0]) cylinder(h = chassis_thick + 2, r = 8, center = true, $fn = 30);
}
