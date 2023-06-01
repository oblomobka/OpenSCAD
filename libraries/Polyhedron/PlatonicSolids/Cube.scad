// Cube
// (C) @oblomobka - 2023.05
// GPL license

/* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; //[10:100]
// Center of the solid or stand over a face
position = "Center"; //["Center", "Face"]

/* **MODULES** */
module Cube ( edge = 30, position = "Face"){
    
    // Invariants
    diAngleCube = 90; // dihedral angle of cube
    
    // Relations
    rCirCube = sqrt(3)/2; // radius of a circumscribed sphere for edge = 1 / = 1,061...
    rInsCube = 1/2; // radius of a inscribed sphere for edge = 1 / = 0,5
    rMidCube = 1/sqrt(2); // Midradius, which touches the middle of each edge / =0,707...
    
    // Variables
    a = edge/2;
    
    // Definition of points and faces V = 8 / F = 6
    Cpoints = [
        [ +a, +a, +a], [ -a, +a, +a], [ +a, -a, +a], [ -a, -a, +a],     // UP       [  0,  1,  2,  3]
        [ +a, +a, -a], [ -a, +a, -a], [ +a, -a, -a], [ -a, -a, -a],     // DOWN     [  4,  5,  6,  7]
        ];
    
    Cfaces = [
        [ 0, 2, 3, 1], [ 4, 5, 7, 6],       // XY
        [ 0, 1, 5, 4], [ 2, 6, 7, 3],       // XZ
        [ 0, 4, 6, 2], [ 1, 3, 7, 5]        // YZ
        ];
    
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if ( position == "Face"){
        translate([ 0, 0, a])
            polyhedron( Cpoints, Cfaces);}
    else if ( position == "Center") {
        polyhedron( Cpoints, Cfaces);} 
}


/* **RENDERING OF SOLIDS** */ 
Cube ( edge = edge, position = position);
