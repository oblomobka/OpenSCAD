// Snub Cube
// (C) @oblomobka - 2023.06
// GPL license

 /* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; // [10:100]
// Center of the solid or stand over a face
position = "Center"; // ["Center", "Face"]
// Chiral
chiral = "Laevo"; //["Laevo", "Dextro"]


/* **MODULES** */
// Created with tribonacci constant
module SnubCube ( edge = 20, position = "Face", chiral = "Laevo"){ //sC -> Conway notation 

    // Constants
    tri = (1+(19-3*sqrt(33))^(1/3)+(19+3*sqrt(33))^(1/3))/3;  // Tribonacci constant = 1,839...
    
    // Invariants
    rCirSnubCube = sqrt((1+1/tri^2)+tri^2);
    
    // Variables
    //factor2 = sqrt(2+4*tri-2*tri^2); // acording to Wikipedia
    factor = sqrt(2*(1+1/tri^2)); // =1,60972 
    scale = edge/factor;
    a=tri;
    
    // Definition of points and faces V = 24 / F = 38 ( 8+24 triangles + 6 squares )
    // Both simetric snub cubes are created with these points, even indexes build one, odd indexes the other one
    sCpoints=[  
        [ +a, +1, +1/a], [ +a, +1/a, +1], [ +1/a, +a, +1],
        [ +1, +a, +1/a], [ +1, +1/a, +a], [ +1/a, +1, +a],   // Corner triangle +X+Y+Z  [0-5]
        [ +a, -1/a, +1], [ +a, -1, +1/a], [ +1, -a, +1/a], 
        [ +1/a, -a, +1], [ +1/a, -1, +a], [ +1, -1/a, +a],   // Corner triangle +X-Y+Z  [6-11]
        [ -a, -1, +1/a], [ -a, -1/a, +1], [ -1/a, -a, +1],
        [ -1, -a, +1/a], [ -1, -1/a, +a], [ -1/a, -1, +a],   // Corner triangle -X-Y+Z  [12-17]  
        [ -a, +1/a, +1], [ -a, +1, +1/a], [ -1, +a, +1/a],
        [ -1/a, +a, +1], [ -1/a, +1, +a], [ -1, +1/a, +a],   // Corner triangle -X+Y+Z  [18-23]
    
        [ +a, +1/a, -1], [ +a, +1, -1/a], [ +1, +a, -1/a],
        [ +1/a, +a, -1], [ +1/a, +1, -a], [ +1, +1/a, -a],   // Corner triangle XY-Z      [24-29]
        [ +a, -1, -1/a], [ +a, -1/a, -1], [ +1/a, -a, -1],
        [ +1, -a, -1/a], [ +1, -1/a, -a], [ +1/a, -1, -a],   // Corner triangle X-Y-Z     [30-35]
        [ -a, -1/a, -1], [ -a, -1, -1/a], [ -1, -a, -1/a],
        [ -1/a, -a, -1], [ -1/a, -1, -a], [ -1, -1/a, -a],   // Corner triangle -X-Y-Z    [36-41]  
        [ -a, +1, -1/a], [ -a, +1/a, -1], [ -1/a, +a, -1],
        [ -1, +a, -1/a], [ -1, +1/a, -a], [ -1/a, +1, -a],   // Corner triangle -XY-Z     [42-47]        
        ];
        
    // Scub 1 - created with half of the points above described - odd index 
    sCfaceslaevo=[  
        // Build 8 triangles. One triangle per octant
        [  1,  5,  3], [  7, 11,  9], [ 13, 15, 17], [ 19, 21, 23],     // Up
        [ 25, 27, 29], [ 31, 33, 35], [ 37, 39, 41], [ 43, 45, 47],     // Down
        // Squares
        [  1, 25, 31,  7], [  3, 21, 45, 27], [  5, 11, 17, 23],        // Up
        [ 13, 37, 43, 19], [ 15,  9, 33, 39], [ 41, 35, 29, 47],        // Down
        // Other triangles
        [  5, 11,  1], [  1, 11,  7], [  3, 21,  5], [  5, 21, 23],
        [ 19, 13, 23], [ 23, 13, 17], [ 15,  9, 17], [ 17,  9, 11],
        [  1, 25,  3], [  3, 25, 27], [ 21, 45, 19], [ 19, 45, 43],
        [ 13, 37, 15], [ 15, 37, 39], [  9, 33,  7], [  7, 33, 31],
        [ 29, 47, 27], [ 27, 47, 45], [ 47, 41, 43], [ 43, 41, 37],
        [ 41, 35, 39], [ 39, 35, 33], [ 35, 29, 31], [ 31, 29, 25]
        ];
        
    // Scub 2 - created with half of the points above described - even index
    sCfacesdextro=[  
        // Build 8 triangles. One triangle per octant
        [  0,  2,  4], [  6,  8, 10], [ 12, 14, 16], [ 18, 20, 22],     // Up
        [ 24, 26, 28], [ 30, 32, 34], [ 36, 38, 40], [ 42, 44, 46],     // Down
        // Squares
        [  0, 24, 30,  6], [  2, 20, 44, 26], [  4, 10, 16, 22],        // Up
        [ 12, 36, 42, 18], [ 14,  8, 32, 38], [ 40, 34, 28, 46],        // Down
        // Other triangles
        [  4, 10,  6], [  6,  0,  4], [  4,  2, 22], [ 22,  2, 20],
        [ 22, 18, 16], [ 16, 18, 12], [ 16, 14, 10], [ 10, 14,  8],
        [  2,  0, 26], [ 26,  0, 24], [ 18, 20, 42], [ 42, 20, 44],
        [ 14, 12, 38], [ 38, 12, 36], [  6,  8, 30], [ 30,  8, 32],
        [ 26, 28, 44], [ 44, 28, 46], [ 42, 46, 36], [ 36, 46, 40],
        [ 38, 40, 32], [ 32, 40, 34], [ 30, 34, 24], [ 24, 34, 28]
        ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if ( chiral == "Laevo"){
        if ( position == "Face"){
            translate ([ 0, 0, scale*a])
                scale ([ scale, scale, scale])
                    polyhedron ( sCpoints, sCfaceslaevo);}
        else if ( position == "Center") {
            scale ([ scale, scale, scale]){
                polyhedron ( sCpoints, sCfaceslaevo);
                //color( "orange", 0.2 ) {sphere(rCirSnubCube);}}
            }
        }
    }
    else if ( chiral == "Dextro") {
        if ( position == "Face"){
            translate ([ 0, 0, scale*a])
                scale ([ scale, scale, scale])
                    polyhedron ( sCpoints, sCfacesdextro);}
        else if ( position == "Center") {
            scale ([ scale, scale, scale]){
                polyhedron ( sCpoints, sCfacesdextro);
                //color( "orange", 0.2 ) {sphere(rCirSnubCube);}
                }
        }       
    }
}

/* **RENDERING OF SOLIDS** */
SnubCube ( edge = edge, position = position, chiral = chiral);
//SnubCube ( edge = edge, position = position, chiral = "Laevo");
