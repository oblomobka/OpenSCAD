// PlatonicSolids v.01
// (C) @oblomobka - 2022.12
// GPL license

// Customizer Variables
// Edge Dodecahedron (distande between faces is aprox= edge*2,227)
Edge=10; //[10:100]
// Position: Center of the solid or stand over a face
Center = "Center"; //["Center", "Face"]

module Dodecahedron(edge=20, center="Face"){
    // Constants
    phi=(1+sqrt(5))/2; // Golden ratio = 1,618...
    diAngleDodecahedron = atan(1/phi); // dihedral angle of Dodecahedron = 116,56505...
    rCirDodecahedron = sqrt(3)*phi/2; // radius of a circumscribed sphere for edge = 1 / =1,401...
    rInsDodecahedron = phi^2/(2*sqrt(3-phi)); // radius of a inscribed sphere for edge = 1 / =1,1135...
    rMidDodecahedron = phi^2/2; // Midradius, which touches the middle of each edge / =1,309...
    
    // Variables
    diagonal=edge*phi; // x depicts the side of cube inscrit in the dodecahedron, that is the lenght of the diagonal of regular pentagon
    pCube = diagonal/2; // to depicts the coordinates of cube inscrit in a pentagon center in (0,0,0) - 8 vertices
    // longside : shortSide depicts the 3 rectangles to complete the 20 vertices of dodecahedron apart of the cube
    longSide = (edge*phi^2)/2;
    shortSide = edge/2;
    
    // Definition of points and faces
    Dpoints=[[-pCube,-pCube,-pCube],[-pCube,pCube,-pCube],[pCube,pCube,-pCube],[pCube,-pCube,-pCube],
            [-pCube,-pCube,pCube],[-pCube,pCube,pCube],[pCube,pCube,pCube],[pCube,-pCube,pCube],
            [0,-longSide,-shortSide],[0,-longSide,shortSide],[0,longSide,-shortSide],[0,longSide,shortSide],
            [-shortSide,0,-longSide],[shortSide,0,-longSide],[-shortSide,0,longSide],[shortSide,0,longSide],
            [-longSide,-shortSide,0],[-longSide,shortSide,0],[longSide,-shortSide,0],[longSide,shortSide,0]];
    Dfaces=[[0,8,3,13,12],[2,10,1,12,13],[2,13,3,18,19],[1,12,0,16,17],
           [0,16,4,9,8],[7,18,3,8,9],[2,19,6,11,10],[5,17,1,10,11],
           [7,9,4,14,15],[5,11,6,15,14],[5,14,4,16,17],[7,15,6,19,18]];
    
    // Dodecahedron stands on xy plane centered on (0,0)
    if(center=="Face"){
        translate([0,0,edge*rInsDodecahedron])
            rotate([diAngleDodecahedron, 0, 0])
                polyhedron(Dpoints,Dfaces);}
    else if(center=="Center") {
        rotate([diAngleDodecahedron, 0, 0])
            polyhedron(Dpoints,Dfaces);} 
}

module Cube(edge=40){
    x=edge/2;
    Cpoints=[[x, x, x],[x, -x, x],[-x, -x, x],[-x, x, x],
             [x, x, -x],[x, -x, -x],[-x, -x, -x],[-x, x, -x]];
    Cfaces=[[0,1,2,3],[0,4,5,1],[0,3,7,4],[2,1,5,6],[3,2,6,7],[7,6,5,4]];
    polyhedron(Cpoints,Cfaces);
}

Dodecahedron(edge=Edge, center=Center);
//Cube(side=20);