// Icosidodecahedron
// (C) @oblomobka - 2023.06
// GPL license

/* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; // [10:100]
// Center of the solid or stand over a face
position = "Center"; // ["Center", "Face"]

/* **MODULES** */   
module Icosidodecahedron( edge = 30, position = "Face"){ //aD -> Conway notation 
    // Constants
    phi = (1+sqrt(5))/2; // Golden ratio = 1,618...
    
    // Invariants
    angle_aD = asin(2*sqrt((5+sqrt(5))/10)/(1+sqrt(5))); // angle vertex to center pentagon
    hPentagon = sqrt(phi^2-((5+sqrt(5))/10));
    
    // Variables
    r = edge*phi;
    a = edge*(phi^2)/2;
    b = edge*phi/2;
    c = edge/2;
    
    // Definition of points and faces V = 30 / F = 32 ( 20 triangles + 12 pentagons )
    // (0, 0, ±φ) and even permutations of ( ±φ^2/2, ±φ/2, ±1/2 )
    aDpoints = [
        [ +r,  0,  0], [  0, +r,  0], [  0,  0, +r], [ -r,  0,  0], [  0, -r,  0], [  0,  0, -r],  // [  0 -  5]
        
        // Rectangle XYZ
        [ +a, +b, +c], [ -a, +b, +c], [ +a, -b, +c], [ -a, -b, +c],     // UP       [  6 -  9]
        [ +a, +b, -c], [ -a, +b, -c], [ +a, -b, -c], [ -a, -b, -c],     // Down     [ 10 - 13]
        
        // Rectangle XZY
        [ +b, +c, +a], [ -b, +c, +a], [ +b, -c, +a], [ -b, -c, +a],     // UP       [ 14 - 17]
        [ +b, +c, -a], [ -b, +c, -a], [ +b, -c, -a], [ -b, -c, -a],     // Down     [ 18 - 21]
        
        // Rectangle YZX
        [ +c, +a, +b], [ -c, +a, +b], [ +c, -a, +b], [ -c, -a, +b],     // UP       [ 22 - 25]
        [ +c, +a, -b], [ -c, +a, -b], [ +c, -a, -b], [ -c, -a, -b]      // DOWN     [ 26 - 29]
        ];
    
    aDfaces = [
        [  0,  6, 10], [  0, 12,  8], [  3, 11,  7], [  3,  9, 13],     // triangles touching X axis
        [  1, 22, 23], [  1, 27, 26], [  4, 25, 24], [  4, 28, 29],     // triangles touching Y axis
        [  2, 14, 16], [  2, 17, 15], [  5, 20, 18], [  5, 19, 21],     // triangles touching Z axis
        
        [  0,  8, 16, 14,  6], [  0, 10, 18, 20, 12], [  3,  7, 15, 17,  9], [  3, 13, 21, 19, 11],  // pentagons touching X axis
        [  1, 26, 10,  6, 22], [  1, 23,  7, 11, 27], [  4, 24,  8, 12, 28], [  4, 29, 13,  9, 25],  // pentagons touching X axis
        [  2, 15, 23, 22, 14], [  2, 16, 24, 25, 17], [  5, 18, 26, 27, 19], [  5, 21, 29, 28, 20],  // pentagons touching Z axis
        
        [  6, 14, 22], [  7, 23, 15], [  8, 24, 16], [  9, 17, 25],     // triangles in octants UP
        [ 10, 26, 18], [ 11, 19, 27], [ 12, 20, 28], [ 13, 29, 21]      // triangles in octants DOWN
        ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if ( position == "Center") {
        polyhedron ( aDpoints, aDfaces);
        }
        
    else if ( position == "Face") {
        translate ([ 0, 0, (hPentagon*edge)])
            rotate ([ 0, 90-angle_aD, 0])
                polyhedron ( aDpoints, aDfaces);}
    }
    
/* **RENDERING OF SOLIDS** */
Icosidodecahedron(edge=edge, position=position);
