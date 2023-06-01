// Regular Icosahedron
// (C) @oblomobka - 2023.06
// GPL license

 /* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; //[10:100]
// Center of the solid or stand over a face
position = "Center"; //["Center", "Face"]

module IcosahedronRegular ( edge = 30, position = "Face"){ 
    // Constants
    phi = (1+sqrt(5))/2; // Golden ratio = 1,618...
    
    // Invariants
    diAngleIcosahedron = acos(-sqrt(5)/3); // dihedral angle of Icosahedron = 138,1897...
    
    // Relations
    rCirIcosahedron = sqrt(phi*sqrt(5))/2; // radius of a circumscribed sphere for edge = 1 / =0,951...
    rInsIcosahedron = phi^2/(2*sqrt(3)); // radius of a inscribed sphere for edge = 1 / =0,7558...
    rMidIcosahedron = phi/2; // Midradius, which touches the middle of each edge / =0,809...
    
    // Variables
    // longSide (a): shortSide (b) depicts the 3 rectangles (one in each plane (xy - xz - yz) to depict the 12 vertices of Icosahedron
    a = edge*phi/2;
    b = edge/2;
    
    // Definition of points and faces V = 12 / F = 20
    // 12 vertices -> Even permutations of ( +-phi, +-1, 0)
    Ipoints = [ 
        // Build 3 rectangles on plane XY/XZ/YZ
        [ +a, +b, 0], [ -a, +b, 0], [ +a, -b, 0], [ -a, -b, 0],         // XY [  0,  1,  2,  3]
        [ +b, 0, +a], [ -b, 0, +a], [ +b, 0, -a], [ -b, 0, -a],         // XZ [  4,  5,  6,  7]  
        [ 0, +a, +b], [ 0, -a, +b], [ 0, +a, -b], [ 0, -a, -b]          // YZ [  8,  9, 10, 11]
        ];
         
    Ifaces = [
        // Build 8 triangles. One triangle per octant
        [  0,  4,  8], [  1,  8,  5], [  9,  4,  2], [  3,  5,  9],     // UP
        [  0, 10,  6], [  1,  7, 10], [  2,  6, 11], [  7,  3, 11],     // DOWN
        // Pairs of triangles on shortSide of rectangles
        [  0,  2,  4], [  0,  6,  2], [  1,  5,  3], [  1,  3,  7],     // XY
        [  5,  4,  9], [  5,  8,  4], [  6,  7, 11], [  7,  6, 10],     // XZ
        [  8, 10,  0], [  8,  1, 10], [ 11,  9,  2], [  3,  9, 11]      // YZ
        ];
    
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if ( position == "Face"){
        translate ([ 0, 0, edge*rInsIcosahedron])
            rotate ([ 90-diAngleIcosahedron/2, 0, 0])
                polyhedron ( Ipoints, Ifaces);}
    else if ( position == "Center") {
        polyhedron ( Ipoints, Ifaces);} 
}

/* **RENDERING OF SOLIDS** */ 
IcosahedronRegular ( edge = edge, position = position);
