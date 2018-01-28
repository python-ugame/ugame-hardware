$fs = 0.125;

module pcb() {
    color("purple") difference() {
        hull() {
            translate([2, 2, 0]) cylinder(1.4, 2, 2);
            translate([2, 50 - 2, 0]) cylinder(1.4, 2, 2);
            translate([42 - 2, 50 - 2, 0]) cylinder(1.4, 2, 2);
            translate([42 - 2, 2, 0]) cylinder(1.4, 2, 2);
        }
        translate([3.175, 3, -1]) cylinder(4, 1.3, 1.3);
        translate([42 - 3.175, 3, -1]) cylinder(4, 1.3, 1.3);
    }
}

module skpmape010() {
    translate([0, 0, 1.75]) color("gray") {
        intersection() {
            cube([6, 5.9, 3.5], center=true);
            rotate(45) cube([6.7, 6.7, 3.5], center=true);
        }
        translate([0, 0, 1.3]) intersection() {
            cube([5, 5, 3.5], center=true);
            rotate(45) cube([5.7, 5.7, 3.5], center=true);
        }
    }
    color("silver") translate([0, 0, 1.1]) cube([2, 6.6, 2], center=true);
}

module st7735s() {
    difference() {
        color("white") cube([29.5, 36.5, 2.5]);
        color("black") translate([2, 2.56, 2]) cube([25.5, 26.5, 1]);
    }
}

module mk12c02() {
    difference() {
        color("silver") cube([2.7, 6.6, 1.4]);
        color("black") translate([-0.1, 2, 0.5]) cube([0.2, 2.8, 0.5]);
    }
    color("gray") translate([-1.5, 2.7, 0.05]) cube([2, 1.3, 1.3]);
}

module det402g1() {
    color("silver") cube([3, 4.5, 1.9]);
}

module reset() {
    color("silver") cube([3, 4, 1.5]);
    color("black") translate([1.5, 2, 0.5]) cylinder(1.5, 1, 1);
}

module microusb() {
    color("silver") translate([0, 0, 1.175]) rotate([90, 0, 0]) hull() {
        translate([-2.325, 0 ,0]) cylinder(5, 1.175, 1.175);
        translate([2.325, 0, 0]) cylinder(5, 1.175, 1.175);
    }
}

module ugame() {
    pcb();
    translate([3.1, 10, 1.5]) skpmape010();
    translate([14.6, 10, 1.5]) skpmape010();
    translate([3.1 + (14.6 - 3.1) / 2, 4.4, 1.5]) skpmape010();
    translate([3.1 + (14.6 - 3.1) / 2, 15.6, 1.5]) skpmape010();
    translate([34.5, 5.6, 1.5]) skpmape010();
    translate([34.5, 14.4, 1.5]) skpmape010();
    translate([4, 49.5, 1.5]) rotate(-90) st7735s();
    translate([0.1, 39.9, 1.5]) mk12c02();
    translate([21.05, 3.5, 1.5]) microusb();
    translate([0.5, 25.2, 1.5]) det402g1();
    translate([0.5, 32.45, 1.5]) reset();
}
