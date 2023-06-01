// Regular Tetrahedron
// (C) @oblomobka - 2023.05
// GPL license

/* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; //[10:100]
// Center of the solid or stand over a face
position = "Center"; //["Center", "Face"]

/* **MODULES** */
module TetrahedronRegular ( edge = 30, position = "Face"){ 
    
    // Invariants
    diAngleTetrahedron = acos(1/3); // dihedral angle of tetrahedron = 70.529
    
    // Relations
    rCirTetrahedron = sqrt(6)/4; // radius of a circumscribed sphere for edge = 1 / = 0,612...
    rInsTetrahedron = 1/sqrt(24); // radius of a inscribed sphere for edge = 1 / = 0,204
    rMidTetrahedron = 1/sqrt(8); // Midradius, which touches the middle of each edge / =354...
    hTetrahedron = sqrt(6)/3;
    
    // Variables
    a = edge/(2*sqrt(2));
    
    // Definition of points and faces V = 4 / F = 4
    Tpoints = [
        // Half of the vertices of a cube
        [ +a, +a, +a], [ -a, -a, +a],      // UP       [  0,  1]
        [ -a, +a, -a], [ +a, -a, -a],      // DOWN     [  2,  3]
        ];
    
    Tfaces = [
        [ 0, 3, 1], [ 0, 2, 3], [ 0, 1, 2], [ 1, 3, 2]
        ];
    
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if ( position == "Face"){
        translate ([ 0, 0, edge*(hTetrahedron-rCirTetrahedron)])
            rotate ([ 90-diAngleTetrahedron/2, 0, 0])
                rotate ([ 0, 0, 45])
                    polyhedron ( Tpoints, Tfaces);}
    else if ( position == "Center") {
        polyhedron ( Tpoints, Tfaces);} 
}


/* **RENDERING OF SOLIDS** */ 
TetrahedronRegular ( edge = edge, position = position);

