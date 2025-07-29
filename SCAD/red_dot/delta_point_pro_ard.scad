include <../util/rounded_cube.scad>
include <../util/hex.scad>

$fn = 128;

window_width = 32.5;
window_height = 22.5;
window_radius = 22;
border_depth = 20;

window_depth = 4;
inner_diameter = 4;
hex_thickness = 0.5;

union() {
	//ard border
	translate([0, border_depth / 2, 0]) difference() {
		union() {
			translate([0, 0, -window_radius + window_height / 2]) intersection() {
				translate([0, 0, 0]) rotate([90, 0, 0]) cylinder(window_depth + border_depth, window_radius + 2,
					window_radius + 2, center = true);
				translate([0, 0, window_radius - 3]) cube([window_width + 4, window_depth + border_depth, 10], center = true);
			}
			translate([0, 0, -5]) cube([window_width + 4, window_depth + border_depth, window_height - 6], center = true);
		}
		union() {
			translate([0, 0, -window_radius + window_height / 2]) intersection() {
				translate([0, 0, 0]) rotate([90, 0, 0]) cylinder(window_depth + border_depth, window_radius,
				window_radius, center = true);
				translate([0, 0, window_radius - 4]) cube([window_width, window_depth + border_depth, 8], center = true);
			}
			translate([0, 0, -4]) cube([window_width, window_depth + border_depth, window_height - 8], center = true);
		}
		//cut bottom out
		translate([0, 2, -window_height / 2 - 1]) cube([window_width, border_depth, 2], center = true);
		//cut for bulge near the top
		translate([0, 2, 2.2]) rotate([90, 0, 0]) rounded_cube(window_width + 1, 8, 20, 4);
		//angle the rear
		translate([0, 13, 10]) rotate([15, 0, 0]) cube([window_width + 4, 8, 40], center = true);
	}
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
	//bulge at bottom to retain ard
	translate([window_width / 2 + 1, 10, -window_height / 2 - 3]) rotate([90, 0, 0]) cylinder(24, 2, 2, center = true);
	translate([-window_width / 2 - 1, 10, -window_height / 2 - 3]) rotate([90, 0, 0]) cylinder(24, 2, 2, center = true);
	translate([0, 0, -window_height / 2 - 3]) cube([window_width + 2, window_depth, 4], center = true);
	//nubs to prevent ard from moving forward and backwards
	translate([0, 1.5, window_height / 2]) rotate([90, 0, 0]) rounded_cube(6, 3, 7, 1);
	translate([0, 17, window_height / 2]) rotate([90, 0, 0]) rounded_cube(6, 3, 2, 1);
}