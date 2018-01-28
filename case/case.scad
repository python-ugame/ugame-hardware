use <ugame.scad>;

$fs = 0.125;

module button() {
    translate([0, 0, 1.75]) {
        intersection() {
            cube([6.25, 6.25, 7], center=true);
            rotate(45) cube([6.95, 6.95, 7], center=true);
        }
    }
}

module torus(r1, r2) {
    rotate_extrude(convexity=4)
    translate([r1 - r2, 0, 0])
    circle(r=r2);
}

module case_top() {
    thick = 0.75;
    space = 0.25;
    size = 2 + space + thick;
    translate([0, 0, -1]) difference() {
        hull() {
            translate([2, 2, 0]) cylinder(2, size, size);
            translate([2, 2, 4]) torus(size, size / 2);
            translate([42 - 2, 2, 0]) cylinder(2, size, size);
            translate([42 - 2, 2, 4]) torus(size, size / 2);
            translate([42 - 2, 50 - 2, 0]) cylinder(2, size, size);
            translate([42 - 2, 50 - 2, 4]) torus(size, size / 2);
            translate([2, 50 - 2, 0]) cylinder(2, size, size);
            translate([2, 50 - 2, 4]) torus(size, size / 2);
        }
        difference() {
            hull() {
                translate([2, 2, -0.5]) cylinder(1, 2 + space, 2 + space);
                translate([2, 2, 4]) torus(2 + space, (2 + space) / 2);
                translate([42 - 2, 2, -0.5]) cylinder(1, 2 + space, 2 + space);
                translate([42 - 2, 2, 4]) torus(2 + space, (2 + space) / 2);
                translate([42 - 2, 50 - 2, -0.5]) cylinder(1, 2 + space, 2 + space);
                translate([42 - 2, 50 - 2, 4]) torus(2 + space, (2 + space) / 2);
                translate([2, 50 - 2, -0.5]) cylinder(1, 2 + space, 2 + space);
                translate([2, 50 - 2, 4]) torus(2 + space, (2 + space) / 2);
            }
            translate([3.175, 3, 2.44]) cylinder(2.75, 2.5, 2.5);
            translate([42 - 3.175, 3, 2.44]) cylinder(2.75, 2.5, 2.5);
        }
        translate([3.1, 10, 1]) button();
        translate([14.6, 10, 1]) button();
        translate([3.1 + (14.6 - 3.1) / 2, 4.4, 1]) button();
        translate([3.1 + (14.6 - 3.1) / 2, 15.6, 1]) button();
        translate([34.5, 5.6, 1]) button();
        translate([34.5, 14.4, 1]) button();

        hull() {
            translate([32, 23.5, 3]) cylinder(5, 2, 2);
            translate([32, 46.25, 3]) cylinder(5, 2, 2);
            translate([7.5, 23.5, 3]) cylinder(5, 2, 2);
            translate([7.5, 46.25, 3]) cylinder(5, 2, 2);
        }

        translate([21.05, 3.5, 2.5])
        translate([0, 0, 1 - 0.175]) rotate([90, 0, 0]) hull() {
            translate([-2.325, 0 ,0]) cylinder(6, 1.175 + 0.5, 1.175 + 0.5);
            translate([2.325, 0, 0]) cylinder(6, 1.175 + 0.5, 1.175 + 0.5);
        }

        translate([-1, 43.25, 3.125]) rotate(90) rotate([90, 0, 0]) hull() {
            translate([-1.25, 0 ,0]) cylinder(4, 0.75, 0.75);
            translate([1.25, 0, 0]) cylinder(4, 0.75, 0.75);
        }

        translate([2.5, 34.5, 0]) cylinder(20, 0.5, 0.5);

        translate([2.5, 29, 0]) cylinder(20, 0.5, 0.5);
        translate([2.5, 27.5, 0]) cylinder(20, 0.5, 0.5);
        translate([2.5, 26, 0]) cylinder(20, 0.5, 0.5);
        translate([1.5, 26.75, 0]) cylinder(20, 0.5, 0.5);
        translate([1.5, 28.25, 0]) cylinder(20, 0.5, 0.5);
        translate([3.5, 26.75, 0]) cylinder(20, 0.5, 0.5);
        translate([3.5, 28.25, 0]) cylinder(20, 0.5, 0.5);
    }
    translate([3.175, 3, 0]) cylinder(2.75, 1.25, 1.25);
    translate([42 - 3.175, 3, 0]) cylinder(2.75, 1.25, 1.25);
}
module case_bottom() {
    taperx = 8;
    tapery = 12;
    space = 0.25;
    thick = 0.5;
    translate([0, 0, -5]) difference() {
        hull() {
            translate([2, 2, 4]) torus(2.75, 2.25/2);
            translate([2, 2, 4]) cylinder(1, 2.25, 2.25);
            translate([2 + taperx, 2 + tapery, 2]) torus(6, 3);
            translate([42 - 2, 2, 4]) torus(2.75, 2.25/2);
            translate([42 - 2, 2, 4]) cylinder(1, 2.25, 2.25);
            translate([42 - 2 - taperx, 2 + tapery, 2]) torus(6, 3);
            translate([42 - 2, 50 - 2, 4]) torus(2.75, 2.25/2);
            translate([42 - 2, 50 - 2, 4]) cylinder(1, 2.25, 2.25);
            translate([42 - 2 - taperx, 50 - 2 - tapery, 2]) torus(6, 3);
            translate([2, 50 - 2, 4]) torus(2.75, 2.25/2);
            translate([2, 50 - 2, 4]) cylinder(1, 2.25, 2.25);
            translate([2 + taperx, 50 - 2 - tapery, 2]) torus(6, 3);
        }
        difference() {
            hull() {
                translate([2, 2, 4]) torus(2.25 - thick, (2.25- thick)/2);
                translate([2, 2, 5]) cylinder(2, 2.25 - thick, 2.25 - thick);
                translate([2 + taperx, 2 + tapery, 2]) torus(6 - thick, 3 - thick);
                translate([42 - 2, 2, 4]) torus(2.25 - thick, (2.25- thick)/2);
                translate([42 - 2, 2, 5]) cylinder(2, 2.25 - thick, 2.25 - thick);
                translate([42 - 2 - taperx, 2 + tapery, 2]) torus(6 - thick, 3 - thick);
                translate([42 - 2, 50 - 2, 4]) torus(2.25 - thick, (2.25 - thick)/2);
                translate([42 - 2, 50 - 2, 5]) cylinder(2, 2.25 - thick, 2.25 - thick);
                translate([42 - 2 - taperx, 50 - 2 - tapery, 2]) torus(6 - thick, 3 - thick);
                translate([2, 50 - 2, 4]) torus(2.25 - thick, (2.25 - thick)/2);
                translate([2, 50 - 2, 5]) cylinder(2, 2.25 - thick, 2.25 - thick);
                translate([2 + taperx, 50 - 2 - tapery, 2]) torus(6 - thick, 3 - thick);
            }
            translate([3.175, 3, 1]) cylinder(5, 2.5, 2.5);
            translate([42 - 3.175, 3, 1]) cylinder(5, 2.5, 2.5);
            translate([3.175, 50 - 3, 1]) cylinder(5, 2.5, 2.5);
            translate([42 - 3.175, 50 - 3, 1]) cylinder(5, 2.5, 2.5);
        }
        translate([0, 0, 5]) difference() {
            translate([-1, -1, -1]) cube([44, 52, 6]);
            hull() {
                translate([2, 2, -2]) cylinder(5, 2 + space, 2 + space);
                translate([42 - 2, 2, -2]) cylinder(5, 2 + space, 2 + space);
                translate([42 - 2, 50 - 2, -2]) cylinder(5, 2 + space, 2 + space);
                translate([2, 50 - 2, -2]) cylinder(5, 2 + space, 2 + space);
            }
        }
        translate([-1, -1, 5]) cube([44, 52, 6]);
    }
}

ugame();
translate([0, 0, 10]) color("maroon") case_top();
//translate([0, 0, -10]) color("green") 
case_bottom();

