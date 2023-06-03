// Truncated Tetrahedron
// (C) @oblomobka - 2023.06
// GPL license

/* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; //[10:100]
// Center of the solid or stand over a face
position = "Center"; //["Center", "Face"]

/* **MODULES** */   
module TruncatedTetrahedron(edge=20, position="Face"){ //tT -> Conway notation
    
    // Invariants
    diAngleHexHex_tT = acos(1/3);   // dihedral angle between hexagonal faces of tT  = 70.529
    diAngleTriHex_tT = acos(-1/3);  // dihedral angle between hexagonal-triangle faces of tT = 109,471
    
    // Relations
    rInsTruncatedTetrahedron = 3/sqrt(24); // radius of a inscribed sphere touching the hexagons - for edge = 1 -> radius = 0,612
    
    // Variables
    a = 3*edge/(2*sqrt(2));     // Tetrahedron points
    b = edge/sqrt(2);           // Truncate factor
    
    // Definition of points and faces V = 12 / F = 8 ( 4hexagons + 4 triangles )
    tTpoints=[
        // Every line define a triangle face
        [ +(a-b), +(a-b), +a], [ +(a-b), +a, +(a-b)], [ +a, +(a-b), +(a-b)],   // +X +Y +Z
        [ -(a-b), -(a-b), +a], [ -(a-b), -a, +(a-b)], [ -a, -(a-b), +(a-b)],   // -X -Y +Z
        [ +(a-b), -(a-b), -a], [ +(a-b), -a, -(a-b)], [ +a, -(a-b), -(a-b)],   // +X -Y -Z
        [ -(a-b), +(a-b), -a], [ -(a-b), +a, -(a-b)], [ -a, +(a-b), -(a-b)]    // -X +Y -Z              
        ];
    
    tTfaces=[  
        [  0,  1,  2], [  3,  4,  5], [  6,  7,  8], [  9, 10, 11],
        [  0,  3,  5, 11, 10,  1], [  1, 10,  9,  6,  8,  2],
        [  0,  2,  8,  7,  4,  3], [  4,  7,  6,  9, 11,  5]
        ];
 
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if ( position == "Center") {
        polyhedron ( tTpoints, tTfaces);
        }
    else if ( position == "Face"){
        translate ([ 0, 0, edge*rInsTruncatedTetrahedron]) 
            rotate ([ 90-diAngleHexHex_tT/2, 0, 0])
                rotate ([0, 0, 45])
                    polyhedron ( tTpoints, tTfaces);}
    }

/* **RENDERING OF SOLIDS** */
TruncatedTetrahedron ( edge = edge, position = position);