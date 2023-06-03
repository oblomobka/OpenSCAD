// Cuboctahedron
// (C) @oblomobka - 2023.06
// GPL license

/* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; //[10:100]
// Center of the solid or stand over a face
position = "Center"; //["Center", "Face"]

/* **MODULES** */   
module Cuboctahedron ( edge = 30, position = "Face"){ //aC / aaT -> Conway notation
    
    // Invariants
    
    // Relations
    
    // Variables
    a = edge/sqrt(2);
    
    // Definition of points and faces V = 12 / F = 14 ( 6 squares + 8 triangles )
    // 12 vertices -> Even permutations of ( +-1, +-1, 0)
    aCpoints = [
        // Every line an auxiliar rectangle on planes XY/XZ/YZ
        [ +a, +a,  0], [ -a, +a,  0], [ +a, -a,  0], [ -a, -a,  0],     // XY [  0,  1,  2,  3]
        [ +a,  0, +a], [ -a,  0, +a], [ +a,  0, -a], [ -a,  0, -a],     // XZ [  4,  5,  6,  7] 
        [  0, +a, +a], [  0, -a, +a], [  0, +a, -a], [  0, -a, -a]      // YZ [  8,  9, 10, 11]
        ];
    
    aCfaces = [
        // Build 8 triangles. One triangle per octant
        [  0,  4,  8], [  1,  8,  5], [  2,  9,  4], [  3,  5,  9],     // UP
        [  0, 10,  6], [  1,  7, 10], [  3, 11,  7], [  2,  6, 11],     // DOWN
        // Squares
        [  9,  5,  8,  4], [  6, 10,  7, 11],       // parallel XY
        [  0,  8,  1, 10], [  2, 11,  3,  9],       // parallel XZ
        [  1,  5,  3,  7], [  0,  6,  2,  4]        // parallel YZ
        ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if ( position == "Center") {
        polyhedron ( aCpoints, aCfaces);
        
        }
    else if ( position == "Face"){
        translate ([ 0, 0, a])
            polyhedron ( aCpoints, aCfaces);
        }
    }
    
/* **RENDERING OF SOLIDS** */
Cuboctahedron ( edge = edge, position = position);
