// Truncated Cube
// (C) @oblomobka - 2023.06
// GPL license

 /* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; //[10:100]
// Center of the solid or stand over a face
position = "Center"; //["Center", "Face"]

/* **MODULES** */      
module TruncatedCube ( edge = 30, position = "Face"){ //tC 
    
    // Invariants
    
    // Relations
    
    // Variables
    a = (edge+2*edge/sqrt(2))/2;
    b = edge/sqrt(2); //b represent the truncation value to obtain regular polygons. It operates on the vertex of the original(Platonic) polyhedron.
    
    // Definition of points and faces V = 24 / F = 14 ( 6 Octagons + 8 triangles )
    tCpoints = [
        // Every line define a triangle face in one octant
        [ +(a-b), +a, +a], [ +a, +(a-b), +a], [ +a, +a, +(a-b)],    // +X+Y+Z   [  0,  1,  2]
        [ -(a-b), +a, +a], [ -a, +(a-b), +a], [ -a, +a, +(a-b)],    // -X+Y+Z   [  3,  4,  5]
        [ +(a-b), -a, +a], [ +a, -(a-b), +a], [ +a, -a, +(a-b)],    // +X-Y+Z   [  6,  7,  8]
        [ -(a-b), -a, +a], [ -a, -(a-b), +a], [ -a, -a, +(a-b)],    // -X-Y+Z   [  9, 10, 11]
        [ +(a-b), +a, -a], [ +a, +(a-b), -a], [ +a, +a, -(a-b)],    // +X+Y-Z   [ 12, 13, 14]
        [ -(a-b), +a, -a], [ -a, +(a-b), -a], [ -a, +a, -(a-b)],    // -X+Y-Z   [ 15, 16, 17]
        [ +(a-b), -a, -a], [ +a, -(a-b), -a], [ +a, -a, -(a-b)],    // +X-Y-Z   [ 18, 19, 20]
        [ -(a-b), -a, -a], [ -a, -(a-b), -a], [ -a, -a, -(a-b)]     // -X-Y-Z   [ 21, 22, 23]
        ];
    
    tCfaces = [
        // Build 8 triangles. One triangle per octant
        [  0,  2,  1], [  3,  4,  5], [  6,  7,  8], [ 10,  9, 11],     // UP
        [ 12, 13, 14], [ 15, 17, 16], [ 18, 20, 19], [ 21, 22, 23],     // DOWN
        // Octagons
        [  0,  1,  7,  6,  9, 10,  4,  3], [ 12, 15, 16, 22, 21, 18, 19, 13],       // parallel XY
        [  0,  3,  5, 17, 15, 12, 14,  2], [  6,  8, 20, 18, 21, 23, 11,  9],       // parallel XZ
        [  1,  2, 14, 13, 19, 20,  8,  7], [  4, 10, 11, 23, 22, 16, 17,  5]        // parallel YZ
        ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if ( position == "Center") {
            polyhedron ( tCpoints, tCfaces);}
            
    else if ( position == "Face"){
        translate ([ 0, 0, a])
            polyhedron ( tCpoints, tCfaces);}
    }

/* **RENDERING OF SOLIDS** */
TruncatedCube ( edge = edge, position = position);
