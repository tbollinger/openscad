module n_sided_tray(width, height, walls, sides=0) {
    difference() {
        linear_extrude(height) circle(width, $fn=sides);
        translate([0,0,walls]) n_sided_cylinder(width - walls, height + walls + 1, sides);
    }
}

module n_sided_trough(width, height, walls, trough, sides=0) {
    difference() {
        n_sided_tray(width, height, walls, sides);
        translate([0,0,- walls - 1]) n_sided_cylinder(width - trough - walls, height + walls + 2, sides);
    }

    difference(){
        n_sided_tray(width - trough, height, walls, sides);
        translate([0,0,- walls - 1]) n_sided_cylinder(width - trough - walls, height + walls + 2, sides);
    }
}

module n_sided_slide_case_top(width, height, walls, sides) {
    linear_extrude(height) circle(width, $fn=sides);
    translate([0,0,walls]) {
        difference() {
	    linear_extrude(height * 0.125) circle(width - walls - 0.5, $fn=sides);
            translate([0,0,-0.25]) linear_extrude(height * 0.25) circle(width - walls - 2, $fn=sides);
        }
    }
}

module n_sided_slide_case_bottom(width, height, walls, sides=0) {
    n_sided_tray(width, height - walls, walls, sides);
}
