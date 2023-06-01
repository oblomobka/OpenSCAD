// Regular Dodecahedron
// (C) @oblomobka - 2023.05
// GPL license

/* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; //[10:100]
// Center of the solid or stand over a face
position = "Center"; //["Center", "Face"]

/* **MODULES** */
module DodecahedronRegular ( edge = 30, position = "Face"){
    
    // Constants
    phi = (1+sqrt(5))/2; // Golden ratio = 1,618...
    
    // Invariants
    diAngleDodecahedron = acos(-1/sqrt(5))/*atan(1/phi)*/; // dihedral angle of Dodecahedron = 116,56505...
    
    // Relations
    rCirDodecahedron = sqrt(3)*phi/2; // Radius of a circumscribed sphere for edge = 1 / =1,401...
    rInsDodecahedron = phi^2/(2*sqrt(3-phi)); // radius of a inscribed sphere for edge = 1 / =1,1135...
    rMidDodecahedron = phi^2/2; // Midradius, which touches the middle of each edge / =1,309...
    
    // Variables
    diagonal = phi; // x depicts the edge of cube inscrit in the dodecahedron, that is the lenght of the diagonal of regular pentagon
    a = edge*diagonal/2; // to depicts the coordinates of cube inscrit in a pentagon center in (0,0,0) - 8 vertices
    // Even permutations (+-phi, +-1/phi, 0) for the inscrit cube (+-1, +-1, +-1) / ratio longside : shortside = phi : (1/phi) -> phi^2
    b = (edge*phi^2)/2;     // long side of the rectangle - equivalente to phi
    c = edge/2;             // short side of the rectangle - equivalente to 1/phi
    
    // Definition of points and faces V = 20 / F = 12
    Dpoints = [
        // Build the cube inscrit in the Dodecahedron
        [ +a, +a, +a], [ -a, +a, +a], [ +a, -a, +a], [ -a, -a, +a],     // UP       [  0,  1,  2,  3]
        [ +a, +a, -a], [ -a, +a, -a], [ +a, -a, -a], [ -a, -a, -a],     // DOWN     [  4,  5,  6,  7]
        // Even permutations, every line draw a rectangule
        [ +b, +c, 0], [ -b, +c, 0], [ +b, -c, 0], [ -b, -c, 0],         // XY       [  8,  9, 10, 11]
        [ +c, 0, +b], [ +c, 0, -b], [ -c, 0, +b], [ -c, 0, -b],         // XZ       [ 12, 13, 14, 15]
        [ 0, +b, +c], [ 0, -b, +c], [ 0, +b, -c], [ 0, -b, -c]          // YZ       [ 16, 17, 18, 19]
        ];
         
    Dfaces = [
        [  0, 16, 18,  4,  8], [  1,  9,  5, 18, 16], [  2, 10,  6, 19, 17], [  3, 17, 19,  7, 11],  // Edges XY
        [  0,  8, 10,  2, 12], [  1, 14,  3, 11,  9], [  4, 13,  6, 10,  8], [  5,  9, 11,  7, 15],  // Edges XZ
        [  0, 12, 14,  1, 16], [  2, 17,  3, 14, 12], [  4, 18,  5, 15, 13], [  6, 13, 15,  7, 19]   // Edges YZ
        ];
    
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if ( position == "Face"){
        translate ([ 0, 0, edge*rInsDodecahedron])
            rotate ([ 90-diAngleDodecahedron/2, 0, 0])
                    polyhedron ( Dpoints, Dfaces);}
                    
    else if ( position == "Center") {
        polyhedron ( Dpoints, Dfaces);
            }         
        } 

/* **RENDERING** */
DodecahedronRegular ( edge = edge, position = position);
