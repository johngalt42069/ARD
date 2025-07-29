include <../util/rounded_cube.scad>
include <../util/hex.scad>

$fn = 128;

window_width = 33;
window_height = 24.5;
window_radius = 6;

window_depth = 14;
inner_diameter = 7;
hex_thickness = 0.5;

union() {
	intersection() {
		translate([0, window_depth / 2, 0]) rotate([90, 0, 0]) honeycomb(window_width, window_height, window_depth,
		inner_diameter, hex_thickness, whole_only = false);
		rotate([90, 0, 0]) rounded_cube(window_width, window_height, window_depth, window_radius);
	}
	difference() {
		rotate([90, 0, 0]) rounded_cube(window_width, window_height, window_depth, window_radius);
		rotate([90, 0, 0]) rounded_cube(window_width - 1, window_height - 1, window_depth, window_radius);
	}
	difference() {
		rotate([90, 0, 0]) rounded_cube(window_width + 4, window_height + 4, window_depth, window_radius);
		rotate([90, 0, 0]) rounded_cube(window_width, window_height, window_depth, window_radius);
		translate([0, 0, -10]) cube([window_width + 4, window_depth, 10], center = true);
	}
	difference() {
		translate([0, -11, 0])rotate([90, 0, 0]) rounded_cube(window_width + 8, window_height + 8, 36, window_radius + 2);
		translate([0, -11, 0])rotate([90, 0, 0]) rounded_cube(window_width + 4, window_height + 4, 36, window_radius + 1);
		translate([0, -11, -12]) cube([window_width + 8, 36, 14], center = true);
		translate([window_width / 2 + 4, 0, 5]) rounded_cube(4, 8, 20, 2);
		translate([-window_width / 2 - 4, 0, 5]) rounded_cube(4, 8, 20, 2);
	}
}