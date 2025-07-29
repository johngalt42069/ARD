include <../../util/front_scope_cover.scad>
include <../../util/rounded_cube.scad>
include<../constants.scad>

difference() {
	front_scope_cover(pvs_31_front - 1);
	cylinder(2, 2, 2);
	//rail hole
	translate([8, 4, 1]) rounded_cube(10, 2, 2, 1);
	translate([-8, 4, 1]) rounded_cube(10, 2, 2, 1);
	translate([8, -4, 1]) rounded_cube(10, 2, 2, 1);
	translate([-8, -4, 1]) rounded_cube(10, 2, 2, 1);
	//detent hole
	translate([0, 4, 1]) cylinder(2, 1, 1, center = true);
	translate([0, -4, 1]) cylinder(2, 1, 1, center = true);
}