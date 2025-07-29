module rounded_cube(x, y, z, radius) {
	union() {
		translate([x / 2 - radius, y / 2 - radius, 0]) cylinder(z, radius, radius, center = true);
		translate([-x / 2 + radius, y / 2 - radius, 0]) cylinder(z, radius, radius, center = true);
		translate([x / 2 - radius, -y / 2 + radius, 0]) cylinder(z, radius, radius, center = true);
		translate([-x / 2 + radius, -y / 2 + radius, 0]) cylinder(z, radius, radius, center = true);
		cube([x, y - 2 * radius, z], center = true);
		cube([x - 2 * radius, y, z], center = true);
	}
}

module mlok_slot() {
	rounded_cube(7, 32, 4, 2);
}

module mlok_bulge_solid() {
	rounded_cube(11.8,6.8,2,3);
}

module mlok_bulge_with_hole() {
	difference(){
		rounded_cube(11.8,6.8,2,3);
		cylinder(2,3.5,3.5, center=true);
	}
}