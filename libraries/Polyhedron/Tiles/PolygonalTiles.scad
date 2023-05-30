// Polygonal Tiles v.01
// (C) @oblomobka - 2023.03
// GPL license

phi = (1+sqrt(5))/2; // Golden ratio = 1,618...

module RectangularTile (side = 1, relation = phi, h = 0.35, Bevel =1){
    
    
    
    a = side * 0.5 ;
    b = a * relation;  
    
    // Definition of points and faces
    Gpoints=[
        [ +a, +b, 0], [ +a, -b, 0], [ -a, +b, 0], [ -a, -b, 0],
        [ +a, +b, h], [ +a, -b, h], [ -a, +b, h], [ -a, -b, h]
        ];
       
    Gfaces=[
        [ 0, 2, 3, 1], [ 4, 5, 7, 6],   // Floor & Roof
        // Walls
        [ 0, 4, 6, 2], [ 2,6,7,3],
        [ 3, 7, 5, 1], [ 1, 5, 4, 0]
    ];
    
    polyhedron(Gpoints,Gfaces);
}
side = 40;
h=6;
gap = 0.2;

difference(){
    translate([0,0,-h/2]) { RectangularTile(side = side, relation = phi, h = h);}
    rotate([90,0,90])
        translate([0,0,-h/2])
            RectangularTile(side = side + 2*gap, relation = phi, h = h + gap);
    }