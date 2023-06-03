// Truncated Octahedron
// (C) @oblomobka - 2023.06
// GPL license

/* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; // [10:100]
// Center of the solid or stand over a face
position = "Center"; // ["Center", "Face"]

/* **MODULES** */   
module TruncatedOctahedron ( edge = 30, position = "Face"){ //tO / bT -> Conway notation
    
    // Invariants
    
    // Relations
    
    // Variables
    a = 3*edge/sqrt(2);
    b = edge/sqrt(2); //b represent the truncation value to obtain regular polygons. It operates on the vertex of the original(Platonic) polyhedron.
    
    // Definition of points and faces V = 24 / F = 14 ( 6 squares + 8 hexagons )
    tOpoints = [
        // Every line build the vertices of a square, tha is the truncation on the octahedron vertices
        [ +(a-b), +b, 0], [ +(a-b), -b, 0], [ +(a-b), 0, +b], [ +(a-b), 0, -b], // +X   [  0,  1,  2,  3]
        [ +b, +(a-b), 0], [ -b, +(a-b), 0], [ 0, +(a-b), +b], [ 0, +(a-b), -b], // +Y   [  4,  5,  6,  7]
        [ +b, 0, +(a-b)], [ -b, 0, +(a-b)], [ 0, +b, +(a-b)], [ 0, -b, +(a-b)], // +Z   [  8,  9, 10, 11]
        [ -(a-b), +b, 0], [ -(a-b), -b, 0], [ -(a-b), 0, +b], [ -(a-b), 0, -b], // -X   [ 12, 13, 14, 15]
        [ +b, -(a-b), 0], [ -b, -(a-b), 0], [ 0, -(a-b), +b], [ 0, -(a-b), -b], // -Y   [ 16, 17, 18, 18]
        [ +b, 0, -(a-b)], [ -b, 0, -(a-b)], [ 0, +b, -(a-b)], [ 0, -b, -(a-b)]  // -Z   [ 20, 21, 22, 23]
        ];
    
    tOfaces = [
        // Squares
        [  0,  3,  1,  2], [ 12, 14, 13, 15],                   // parallel YZ
        [  4,  6,  5,  7], [ 16, 19, 17, 18],                   // parallel XZ
        [  8, 11,  9, 10], [ 21, 23, 20, 22],                   // parallel XY
        // Build 8 hexagons. One hexagon per octant
        [  0,  2,  8, 10,  6,  4], [  5,  6, 10,  9, 14, 12],   // UP
        [  1, 16, 18, 11,  8,  2], [  9, 11, 18, 17, 13, 14],   // UP
        [  0,  4,  7, 22, 20,  3], [  5, 12, 15, 21, 22,  7],   // DOWN
        [  1,  3, 20, 23, 19, 16], [ 13, 17, 19, 23, 21, 15]    // DOWN
        ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if ( position == "Center"){
        polyhedron ( tOpoints, tOfaces);
        }
    else if ( position == "Face"){
        translate ([ 0, 0, edge*sqrt(2)])
            polyhedron ( tOpoints, tOfaces);
        }
    }

/* **RENDERING OF SOLIDS** */
TruncatedOctahedron ( edge = edge, position = position);
