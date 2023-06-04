// Rhombicuboctahedron
// (C) @oblomobka - 2023.06
// GPL license

/* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; // [10:100]
// Center of the solid or stand over a face
position = "Center"; // ["Center", "Face"]

/* **MODULES** */   
module Rhombicuboctahedron ( edge = 30, position = "Face"){ //eC / aaC / aaaT -> Conway notation
    
    // Invariants
    
    // Relations
    
    // Variables
    a = (edge+2*edge/sqrt(2))/2;
    b = edge/sqrt(2); //b represent the truncation value to obtain regular polygons. It operates on the vertex of the original(Platonic) polyhedron.
    
    // Definition of points and faces V = 24 / F = 26 ( 8 triangles + 18 squares )
    eCpoints = [
        // Every line define a triangle face in one octant
        [ +(a-b), +(a-b), +a], [ +(a-b), +a, +(a-b)], [ +a, +(a-b), +(a-b)],    // +X+Y+Z [  0,  1,  2]
        [ -(a-b), +(a-b), +a], [ -(a-b), +a, +(a-b)], [ -a, +(a-b), +(a-b)],    // -X+Y+Z [  3,  4,  5]
        [ +(a-b), -(a-b), +a], [ +(a-b), -a, +(a-b)], [ +a, -(a-b), +(a-b)],    // +X-Y+Z [  6,  7,  8]
        [ -(a-b), -(a-b), +a], [ -(a-b), -a, +(a-b)], [ -a, -(a-b), +(a-b)],    // -X-Y+Z [  9, 10, 11]
    
        [ +(a-b), +(a-b), -a], [ +(a-b), +a, -(a-b)], [ +a, +(a-b), -(a-b)],    // +X+Y-Z [ 12, 13, 14]
        [ -(a-b), +(a-b), -a], [ -(a-b), +a, -(a-b)], [ -a, +(a-b), -(a-b)],    // -X+Y-Z [ 15, 16, 17]
        [ +(a-b), -(a-b), -a], [ +(a-b), -a, -(a-b)], [ +a, -(a-b), -(a-b)],    // +X-Y-Z [ 18, 19, 20]
        [ -(a-b), -(a-b), -a], [ -(a-b), -a, -(a-b)], [ -a, -(a-b), -(a-b)],    // -X-Y-Z [ 21, 22, 23]
        ];
        
    eCfaces = [
        // Build 8 triangles. One triangle per octant
        [  0,  1,  2], [  3,  5,  4], [  6,  8,  7], [  9, 10, 11],     // UP
        [ 12, 14, 13], [ 15, 16, 17], [ 18, 19, 20], [ 21, 23, 22],     // DOWN
        
        // Squares
        [  0,  6,  9,  3], [ 12, 15, 21, 18],                                           // parallel XY
        [  1,  4, 16, 13], [  7, 19, 22, 10],                                           // parallel XZ
        [  2, 14, 20,  8], [  5, 11, 23, 17],                                           // parallel YZ        
        [  1, 13, 14,  2], [  4,  5, 17, 16], [  7,  8, 20, 19], [ 10, 22, 23, 11],     // bevel XY
        [  0,  2,  8,  6], [  3,  9, 11,  5], [ 12, 18, 20, 14], [ 15, 17, 23, 21],     // bevel XZ
        [  0,  3,  4,  1], [ 12, 13, 16, 15], [  6,  7, 10,  9], [ 18, 21, 22, 19]      // bevel YZ
        ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if ( position == "Center") {
            polyhedron ( eCpoints, eCfaces);}
        
    else if ( position == "Face"){
        translate([ 0, 0, a])
            polyhedron ( eCpoints, eCfaces);}
    }
        
/* **RENDERING OF SOLIDS** */
Rhombicuboctahedron ( edge = edge, position = position);
