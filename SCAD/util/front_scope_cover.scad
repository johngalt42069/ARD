include <rounded_cube.scad>

$fn = 256;

module front_scope_cover(diameter) {
	union() {
		//main body
		difference() {
			cylinder(6, diameter / 2 + 5, diameter / 2 + 5);
			translate([0, 0, 2])cylinder(4, diameter / 2 + 3, diameter / 2 + 3);
		}
		//bungee mount
		translate([diameter / 2 + 7, 0, 0]) difference() {
			cylinder(6, 4, 4);
			cylinder(6, 2, 2);
		}
		translate([-diameter / 2 - 7, 0, 0]) difference() {
			cylinder(6, 4, 4);
			cylinder(6, 2, 2);
		}
		//handle
		translate([-5, diameter / 2 + 6, 2]) rotate([0, 0, 20]) rounded_cube(15, 6, 4, 2);
		translate([5, diameter / 2 + 6, 2]) rotate([0, 0, -20]) rounded_cube(15, 6, 4, 2);
	}
}