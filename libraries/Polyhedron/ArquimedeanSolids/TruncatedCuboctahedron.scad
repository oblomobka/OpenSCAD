// Truncated Cuboctahedron
// (C) @oblomobka - 2023.06
// GPL license

/* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; // [10:100]
// Center of the solid or stand over a face
position = "Center"; // ["Center", "Face"]

/* **MODULES** */   
module TruncatedCuboctahedron ( edge = 30, position = "Face"){ //bC / taC -> Conway notation
    
    // Invariants
    
    // Relations
    
    // Variables
    a = edge*(1/2+sqrt(2));
    b = edge/sqrt(2); //b represent the truncation value to obtain regular polygons. It operates on the vertex of the original polyhedron, the cuboctahedron in this case.
    c = edge/2;
    
    // Definition of points and faces V = 48 / F = 26 ( 12 squares + 8 hexagons + 6 octagons )
    // 48 vertices -> All permutations of ( +-(1+2*sqrt(2)), +-(1+sqrt(2)), +-1) -> ( +-a, +-(a-b), +-c)
    taCpoints = [
        // Every two lines construct an auxiliary box where "a" is the distance between parallel octagons and "c" the edge
        // Even permutations
        // XY
        [ +a, +(a-b), +c], [ -a, +(a-b), +c], [ +a, -(a-b), +c], [ -a, -(a-b), +c],     // UP   [  0 -  3]
        [ +a, +(a-b), -c], [ -a, +(a-b), -c], [ +a, -(a-b), -c], [ -a, -(a-b), -c],     // DOWN [  4 -  7]
        // XZ
        [ +(a-b), +c, +a], [ -(a-b), +c, +a], [ +(a-b), -c, +a], [ -(a-b), -c, +a],     // UP   [  8 - 11]
        [ +(a-b), +c, -a], [ -(a-b), +c, -a], [ +(a-b), -c, -a], [ -(a-b), -c, -a],     // DOWN [ 12 - 15]
        // YZ
        [ +c, +a, +(a-b)], [ -c, +a, +(a-b)], [ +c, -a, +(a-b)], [ -c, -a, +(a-b)],     // UP   [ 16 - 19]
        [ +c, +a, -(a-b)], [ -c, +a, -(a-b)], [ +c, -a, -(a-b)], [ -c, -a, -(a-b)],     // DOWN [ 20 - 23]
        
        // Odd permutations
        // XY
        [ +(a-b), +a, +c], [ -(a-b), +a, +c], [ +(a-b), -a, +c], [ -(a-b), -a, +c],     // UP   [ 24 - 27]
        [ +(a-b), +a, -c], [ -(a-b), +a, -c], [ +(a-b), -a, -c], [ -(a-b), -a, -c],     // DOWN [ 28 - 31]
        // XZ
        [ +a, +c, +(a-b)], [ -a, +c, +(a-b)], [ +a, -c, +(a-b)], [ -a, -c, +(a-b)],     // UP   [ 32 - 35]
        [ +a, +c, -(a-b)], [ -a, +c, -(a-b)], [ +a, -c, -(a-b)], [ -a, -c, -(a-b)],     // DOWN [ 36 - 39]
        // YZ
        [ +c, +(a-b), +a], [ -c, +(a-b), +a], [ +c, -(a-b), +a], [ -c, -(a-b), +a],     // UP   [ 40 - 43]
        [ +c, +(a-b), -a], [ -c, +(a-b), -a], [ +c, -(a-b), -a], [ -c, -(a-b), -a]      // DOWN [ 44 - 47]
        ];
        
    taCfaces = [
        // 8 Hexagons, 1 per octant
        [  0, 32,  8, 40, 16, 24],      // +X+Y+Z
        [  1, 25, 17, 41,  9, 33],      // -X+Y+Z
        [  2, 26, 18, 42, 10, 34],      // +X-Y+Z
        [  3, 35, 11, 43, 19, 27],      // -X-Y+Z
        [  4, 28, 20, 44, 12, 36],      // +X+Y-Z
        [  5, 37, 13, 45, 21, 29],      // -X+Y-Z
        [  6, 38, 14, 46, 22, 30],      // +X-Y-Z
        [  7, 31, 23, 47, 15, 39],      // -X-Y-Z
        
        // 12 Squares
        [  0, 24, 28,  4], [  1,  5, 29, 25], [  2,  6, 30, 26], [  3, 27, 31,  7], // XY
        [ 32, 34, 10,  8], [ 11, 35, 33,  9], [ 12, 14, 38, 36], [ 37, 39, 15, 13], // XZ
        [ 16, 40, 41, 17], [ 18, 19, 43, 42], [ 20, 21, 45, 44], [ 22, 46, 47, 23], // YZ
        
        // Octagons
        [  8, 10, 42, 43, 11,  9, 41, 40], [ 14, 12, 44, 45, 13, 15, 47, 46],       // parallel XY       
        [ 24, 16, 17, 25, 29, 21, 20, 28], [ 26, 30, 22, 23, 31, 27, 19, 18],       // parallel XZ
        [  0,  4, 36, 38,  6,  2, 34, 32], [  1, 33, 35,  3,  7, 39, 37,  5]        // parallel YZ
        ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if  ( position == "Center") {
        polyhedron ( taCpoints, taCfaces);}
    else if ( position == "Face"){
        translate ([ 0, 0, a])
            polyhedron ( taCpoints, taCfaces);}
    }

/* **RENDERING OF SOLIDS** */
TruncatedCuboctahedron ( edge = edge, position = position);