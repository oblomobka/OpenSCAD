// Dodecahedron
// (C) @oblomobka - 2023.03
// GPL license

/* **CUSTOMIZER VARIABLES** */
// Edge
edge=20; //[10:100]
// Center of the solid or stand over a face
position = "Center"; //["Center", "Face"]

/* **MODULES** */
module Dodecahedron(edge=20, position="Face"){ 
    // Constants
    phi = (1+sqrt(5))/2; // Golden ratio = 1,618...
    
    // Invariants
    diAngleDodecahedron = acos(-1/sqrt(5))/*atan(1/phi)*/; // dihedral angle of Dodecahedron = 116,56505...
    
    // Relations
    rCirDodecahedron = sqrt(3)*phi/2; // Radius of a circumscribed sphere for edge = 1 / =1,401...
    rInsDodecahedron = phi^2/(2*sqrt(3-phi)); // radius of a inscribed sphere for edge = 1 / =1,1135...
    rMidDodecahedron = phi^2/2; // Midradius, which touches the middle of each edge / =1,309...
    
    // Variables
    diagonal=phi; // x depicts the edge of cube inscrit in the dodecahedron, that is the lenght of the diagonal of regular pentagon
    a = edge*diagonal/2; // to depicts the coordinates of cube inscrit in a pentagon center in (0,0,0) - 8 vertices
    // Even permutations (+-phi, +-1/phi, 0) for the inscrit cube (+-1, +-1, +-1) / ratio longside/shortside = phi:(1/phi) -> phi^2
    b = (edge*phi^2)/2;     // long side of the rectangle - equivalente to phi
    c = edge/2;             // short side of the rectangle - equivalente to 1/phi
    /*Generalization for no regular dodecahedrons
    Even permutations (+-(1+h), +-(1-h^2), 0)
    a = 1;
    h = 1/phi;     // h = 0     -> cube 
                   // h = 1/2   -> pyritohedron  
                   // h = 1/phi -> regular dodecahedron 
                   // h = 1     -> Rhombic dodecahedron
    b = (1+h);     // long side of the rectangle - equivalente to phi
    c = (1-h^2);   // short side of the rectangle - equivalente to 1/phi*/
    // Definition of points and faces V = 20 / F = 12
    Dpoints = [
        // Build the cube inscrit in the Dodecahedron
        [+a, +a, +a],[-a, +a, +a],[+a, -a, +a],[-a, -a, +a],    // UP
        [+a, +a, -a],[-a, +a, -a],[+a, -a, -a],[-a, -a, -a],    // DOWN
        // Even permutations, every line draw a rectangule
        [+b, +c, 0], [-b, +c, 0], [+b, -c, 0], [-b, -c, 0],     // XY
        [+c, 0, +b], [-c, 0, +b], [+c, 0, -b], [-c, 0, -b],     // XZ
        [0, +b, +c], [0, -b, +c], [0, +b, -c], [0, -b, -c]      // YZ
        ];
         
    Dfaces = [
        [8,4,18,16,0],[9,1,16,18,5],[10,2,17,19,6],[11,7,19,17,3],  // Edges XY
        [12,2,10,8,0],[13,1,9,11,3],[14,4,8,10,6],[15,7,11,9,5],    // Edges YZ
        [16,1,13,12,0],[17,2,12,13,3],[18,4,14,15,5],[19,7,15,14,6] // Edges YZ
        ];
        
    AuxCube =    [[0,1,3,2],[4,6,7,5]];
    AuxDiedro =  [[8,9,11,10],[12,13,15,14],[16,17,19,18]];
    
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,edge*rInsDodecahedron])
            rotate([90-diAngleDodecahedron/2, 0, 0])
                    polyhedron(Dpoints,Dfaces);}
    else if(position=="Center") {
        //polyhedron(Dpoints,AuxDiedro);
        //color("orange", 0.3){polyhedron(Dpoints,AuxCube);}
        //color("grey", 1){
            polyhedron(Dpoints,Dfaces);
            //}        
        } 
}

/* **RENDERING** */ 
Dodecahedron(edge=edge, position=position);
