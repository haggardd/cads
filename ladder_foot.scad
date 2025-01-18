wallWidth = 3;
length = 84;
width = 21;
height = 22;
angle = 20;
screwHole = 4.5;


difference() {
    union(){
        rotate([180,0,0]){
            translate([0, 0, height + wallWidth]){
                prism(wallWidth * 2 + width, length + wallWidth * 2, height); 
            }   
        }
        
        cube([width + (wallWidth * 2), length + (wallWidth * 2), height + (wallWidth * 2)], true);
    }
    
    translate([0, 0, wallWidth]){
        cube([width, length, height + (wallWidth * 2)], true);
    }
    
    translate([0, 0, -12.5]){
        cylinder(3, screwHole, 1.5, true);
    }
    
    translate([0, 0, -height - wallWidth]){
        cylinder(height, screwHole, screwHole, true);
    }
    
    translate(-[0, 40, 40]){
        rotate([60, 0, 0]){
            cube([width + wallWidth * 2, 20, 50], true);
        }
    }
}

module prism(l, w, h){
    polyhedron(
        points=[-[l, w ,h], [l, -w, -h], [l, w , -h], [-l, w, -h], [-l, w, h + angle], [l, w, h + angle]] / 2,
        faces=[[0, 1, 2, 3], [5, 4, 3, 2], [0, 4, 5, 1], [0, 3, 4], [5, 2, 1]]
    );
}