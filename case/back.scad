use <ugame.scad>;
$fs = 0.25;


module torus(r1, r2) {
    rotate_extrude(convexity=4)
    translate([r1 - r2, 0, 0])
    circle(r=r2);
}

ugame();
thick = 1.5;
space = 0.025;
difference() {
    hull() {
        for (y = [2, 50 - 2]) {
            for (x = [2, 42 - 2]) {
                translate([x, y, 0]) cylinder(1.44 + space, 2 + thick, 2 + thick);
            }
        }
        for (y = [2 + 24, 50 - 2 - 10]) {
            for (x = [2 + 12, 42 - 2 - 12]) {
                translate([x, y, -3 - thick]) cylinder(1, 6 + thick, 6 + thick);
            }
        }
    }
    difference() {
        hull() {
            for (y = [2, 50 - 2]) {
                for (x = [2, 42 - 2]) {
                    translate([x, y, 0]) cylinder(2, 2 + space, 2 + space);
                }
            }
            for (y = [2 + 24, 50 - 2 - 10]) {
                for (x = [2 + 12, 42 - 2 - 12]) {
                    translate([x, y, -3 - space]) cylinder(1, 6 + space, 6 + space);
                }
            }
        }
        for (y = [3, 50 - 3]) {
            for (x = [3.175, 42 - 3.175]) {
                translate([x, y, -10]) cylinder(10, 3, 3);
            }
        }
    }
}
translate([3.175, 3, -0.5]) cylinder(0.5 + 1.44 + thick, 1.3 - space, 1.3 - space);
translate([42 - 3.175, 3, -0.5]) cylinder(0.5 + 1.44 + thick, 1.3 - space, 1.3 - space);
difference() {
    for (x = [2, 42 - 2]) {
        translate([x, 50 - 2, 1.44]) cylinder(thick, 2 + thick, 2 + thick);
    }
    translate([30, 45, 0]) rotate(-45) cube(10);
    translate([5, 38, 0]) rotate(45) cube(10);
}
    translate([2, 50, 1.44 - space]) cube([38, thick, thick + space]);
