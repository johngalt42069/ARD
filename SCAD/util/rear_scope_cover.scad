include <rounded_cube.scad>

$fn = 256;

module rear_scope_cover(diameter) {
	union() {
		//main body
		difference() {
			cylinder(14, diameter / 2 + 2, diameter / 2 + 2);
			translate([0, 0, 2])cylinder(12, diameter / 2, diameter / 2);
			//cut out to allow cover to pivot to the side
			translate([0, 0, 10 + diameter / 2])rotate([90, 0, 0])cylinder(diameter + 10, diameter / 2, diameter / 2,
			center = true);
		}
		//bungee mount
		translate([diameter / 2 + 4, 0, 0]) difference() {
			cylinder(6, 4, 4);
			cylinder(6, 2, 2);
		}
		translate([-diameter / 2 - 4, 0, 0]) difference() {
			cylinder(6, 4, 4);
			cylinder(6, 2, 2);
		}
		//handle
		translate([-5, diameter / 2 + 3, 2]) rotate([0, 0, 20]) rounded_cube(15, 6, 4, 2);
		translate([5, diameter / 2 + 3, 2]) rotate([0, 0, -20]) rounded_cube(15, 6, 4, 2);
	}
}