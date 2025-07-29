include <../../util/rounded_cube.scad>
include<../constants.scad>

difference() {
	union() {
		//main body
		cylinder(34, 4, 4);
		translate([0, 2, 17]) cube([8, 4, 34], center = true);
		translate([0, 3, 17]) rotate([90,0,0]) rounded_cube(12, 34, 2, 2);
		//rails
		translate([4, 5, 25]) rotate([90, 0, 0]) cylinder(2, 0.9, 0.9, center = true);
		translate([4, 5, 9]) rotate([90, 0, 0]) cylinder(2, 0.9, 0.9, center = true);
		translate([-4, 5, 25]) rotate([90, 0, 0]) cylinder(2, 0.9, 0.9, center = true);
		translate([-4, 5, 9]) rotate([90, 0, 0]) cylinder(2, 0.9, 0.9, center = true);
		//detent
		translate([4, 4, 17]) rotate([90, 0, 0]) sphere(1);
		translate([-4, 4, 17]) rotate([90, 0, 0]) sphere(1);
		translate([0,0,17]) rounded_cube(16,8,4,2);
	}
	//bungie holes
	cylinder(4, 2, 2);
	translate([0, 0, 30]) cylinder(4, 2, 2);
	translate([5, 0, 17]) cylinder(4, 2, 2, center = true);
	//section cuts
	translate([0, -1, 24.5]) cube([8, 6, 11], center = true);
	translate([0, -1, 9.5]) cube([8, 6, 11], center = true);
	//aperatures
	translate([0, 3, 21]) rotate([90, 0, 0]) cylinder(2.1, 2, 2, center = true);
	translate([0, 3, 13]) rotate([90, 0, 0]) cylinder(2.1, 1, 1, center = true);
}