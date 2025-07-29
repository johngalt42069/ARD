include <hex.scad>

$fn = 256;

module scope_ard(diameter, depth, inner_diameter, hex_thickness) {
	union() {
		//main body
		intersection() {
			cylinder(10, diameter / 2, diameter / 2);
			honeycomb(diameter, diameter, depth, inner_diameter, hex_thickness, whole_only = false);
		}
		//outer shape
		difference() {
			cylinder(20, diameter / 2 + 2, diameter / 2 + 2);
			cylinder(20, diameter / 2, diameter / 2);
			//cut out to allow ard to pivot to the side
			translate([0, 0, 12 + diameter / 2])rotate([90, 0, 0])cylinder(diameter + 10, diameter / 2, diameter / 2,
			center = true);
		}
		//bungee mounts
		translate([diameter / 2 + 4, 0, 10]) difference() {
			cylinder(6, 4, 4);
			cylinder(6, 2, 2);
		}
		translate([-diameter / 2 - 4, 0, 10]) difference() {
			cylinder(6, 4, 4);
			cylinder(6, 2, 2);
		}
	}
}