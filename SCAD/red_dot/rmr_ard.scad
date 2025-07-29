include <../util/rounded_cube.scad>
include <../util/hex.scad>

$fn = 256;

window_width = 28;
window_height = 18;
window_radius = 22;
border_depth = 33.5;

window_depth = 4;
inner_diameter = 4;
hex_thickness = 0.5;

union() {
	//ard border
	translate([0, border_depth / 2, 0]) difference() {
		union() {
			translate([0, 0, 2.5]) rotate([90, 0, 0]) rounded_cube(window_width + 4, window_height + 7, window_depth +
				border_depth, 2);
			translate([0, 2, -window_height / 2]) rotate([90, 0, 0]) rounded_cube(window_width + 4, 8, border_depth, 2);
		}
		union() {
			translate([0, 0, -window_radius + window_height / 2]) intersection() {
				translate([0, 0, 0]) rotate([90, 0, 0]) cylinder(window_depth + border_depth, window_radius,
				window_radius, center = true);
				translate([0, 0, window_radius - 4]) cube([window_width, window_depth + border_depth, 8], center = true)
					;
			}
			translate([0, 0, -4]) cube([window_width, window_depth + border_depth, window_height - 8], center = true);
		}
		translate([0, window_depth / 2, 0]) difference() {
			rotate([90, 0, 0]) rounded_cube(window_width, window_height + 8, border_depth, 2);
			translate([0, 0, 51]) rotate([90, 0, 0]) cylinder(border_depth, 40, 40, center = true);
		}
		//cut bottom out
		translate([0, 2, -window_height / 2 - 2]) cube([window_width, border_depth, 4], center = true);
		//angle the rear
		translate([0, 16, 18]) rotate([20, 0, 0]) cube([window_width + 4, 12, 50], center = true);
		//shape of top
		translate([0, 0, 53]) rotate([90, 0, 0]) cylinder(border_depth + window_depth, 40, 40, center = true);
		//side button cuts
		translate([0, 2.5 - 4.25, -7]) rotate([0, 90, 0]) rounded_cube(8, 16, window_width + 4, 3);
		translate([0, -7, -5]) rotate([0, 90, 0]) rounded_cube(12, 6, window_width + 4, 3);
		translate([0, -3, 2.4]) rotate([0, 90, 0]) cylinder(window_width + 4, 5, 5, center = true);
		translate([0, 1, -1])  rotate([0, 90, 0]) rotate([0, 0, 25]) rounded_cube(16,6,window_width + 4, 3);
		translate([0, 0.5, -1])  rotate([0, 90, 0]) rotate([0, 0, 25]) rounded_cube(16,8,window_width + 4, 4);
		translate([0, -3.5, 0]) rotate([0, 90, 0]) rotate([0, 0, -25]) rounded_cube(14, 12, window_width + 4, 6);
	}
	//knobs to to retain
	translate([-window_width / 2, border_depth + 0.4, -9]) rotate([0, 90, 0]) cylinder(2, 1.6, 1.6);
	translate([window_width / 2, border_depth + 0.4, -9]) rotate([0, -90, 0]) cylinder(2, 1.6, 1.6);
	//hexagonal pattern
	intersection() {
		translate([0, window_depth / 2, 0]) rotate([90, 0, 0]) honeycomb(window_width, window_height, window_depth,
		inner_diameter, hex_thickness, whole_only = false);
		union() {
			translate([0, 0, -window_radius + window_height / 2]) intersection() {
				translate([0, 0, 0]) rotate([90, 0, 0]) cylinder(window_depth, window_radius, window_radius, center =
				true);
				translate([0, 0, window_radius - 4]) cube([window_width, window_depth, 8], center = true);
			}
			translate([0, 0, -4]) cube([window_width, window_depth, window_height - 8], center = true);
		}
	}
	//nmbs to prevent ard from moving forward and backwards
	translate([0, 3.75, window_height / 2 + 2]) rotate([90, 0, 0]) rounded_cube(6, 3, 3.5, 1);
}