// #################################
NAME = "{{NAME}}";
// #################################


width = len(NAME)*7;
depth = 15;
thickness = 1;
corner_radius = 1.5;
keyring_radius = 4;

// For 3d printing
$fa = 1;
$fs = 0.4;



module body(){
    hull()
    {
        translate([0, 0, -corner_radius]) sphere(r=corner_radius,center=true);
        translate([0, depth, -corner_radius]) sphere(r=corner_radius,center=true);
        translate([width, 0, -corner_radius]) sphere(r=corner_radius,center=true);
        translate([width, depth, -corner_radius]) sphere(r=corner_radius,center=true);
        translate([0, depth/2, -corner_radius*2])
        linear_extrude(corner_radius*2)
        circle(r=keyring_radius, center=true);
    }
}

module name_text(){
    linear_extrude(thickness)
    translate([width/2,depth/2,-0.001])
    color("turquoise")
    text(str(" ", NAME), halign="center", valign="center", font="Ubuntu:style=Extra Bold Italic", size=8);
}

module keyring_hole(){
    translate([2, depth/2, -corner_radius*4])
    linear_extrude(corner_radius*8)
    circle(r=(keyring_radius-1), center=true);
}

module tag(){
    difference(){
        body();
        keyring_hole();
    }

    name_text();
}

module bone(){
    scale(0.2)
    translate([width,depth/2,-corner_radius*10])
    linear_extrude(corner_radius)
    import("/home/jowen/Downloads/dog-bone/dog-bone.svg", center=false);
}

difference(){
    tag();
    bone();
}

//bone();