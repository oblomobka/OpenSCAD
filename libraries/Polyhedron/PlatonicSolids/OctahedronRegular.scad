// Regular Octahedron
// (C) @oblomobka - 2023.06
// GPL license

/* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; //[10:100]
// Center of the solid or stand over a face
position = "Center"; //["Center", "Face"]

/* **MODULES** */
module OctahedronRegular ( edge = 30, position = "Face"){ 
    
    // Invariants
    diAngleOctahedron = acos(-1/3); // dihedral angle of octahedron = 109,471
    
    // Relations
    rCirOctahedron = 1/sqrt(2); // radius of a circumscribed sphere for edge = 1 / = 0,707..
    rInsOctahedron = sqrt(6)/6; // radius of a inscribed sphere for edge = 1 / = 0,408
    rMidOctahedron = 1/2; // Midradius, which touches the middle of each edge / =0,5
    
    // Variables
    a = edge/sqrt(2);
    
    // Definition of points and faces V = 6 / F = 8
    Opoints = [
        [ +a, 0, 0], [ 0, +a, 0], [ 0, 0, +a],
        [ -a, 0, 0], [ 0, -a, 0], [ 0, 0, -a]
        ];
    
    Ofaces = [
        [ 0, 2, 1], [ 0, 4, 2], [ 1, 2, 3], [ 3, 2, 4],     // UP faces
        [ 0, 1, 5], [ 0, 5, 4], [ 3, 4, 5], [ 1, 3, 5]      // DOWN faces
        ];
    
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if ( position == "Face"){
        translate ([ 0, 0, edge*rInsOctahedron])
            rotate ([ -diAngleOctahedron/2, 0, 0])    
                rotate ([ 0, 0, 45])
                    polyhedron ( Opoints, Ofaces);}
                    
    else if ( position == "Center") {
        polyhedron ( Opoints, Ofaces);} 
}

/* **RENDERING OF SOLIDS** */ 
OctahedronRegular ( edge = edge, position = position);
