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
    a= tri;
    
    // Definition of points and faces V = 24 / F = 38 ( 8+24 triangles + 6 squares )
    // Cartesian coordinates for the vertices of a snub cube are all the even permutations of(±1, ±1/tri, ±tri) with an even number of plus signs, along with all the odd permutations with an odd number of plus signs. Taking the even permutations with an odd number of plus signs, and the odd permutations with an even number of plus signs, gives a different snub cube, the mirror image. [Wikipedia]
    
    // Both simetric snub cubes are created with these points, even indexes build one, odd indexes the other one
    
    sCpoints=[  
        [ +a, +1, +1/a], [ +a, +1/a, +1], [ +1/a, +a, +1],
        [ +1, +a, +1/a], [ +1, +1/a, +a], [ +1/a, +1, +a],   // Corner triangles +X+Y+Z  [0-5]
    
        [ +a, -1/a, +1], [ +a, -1, +1/a], [ +1, -a, +1/a], 
        [ +1/a, -a, +1], [ +1/a, -1, +a], [ +1, -1/a, +a],   // Corner triangles +X-Y+Z  [6-11]
        
        [ -a, -1, +1/a], [ -a, -1/a, +1], [ -1/a, -a, +1],
        [ -1, -a, +1/a], [ -1, -1/a, +a], [ -1/a, -1, +a],   // Corner triangles -X-Y+Z  [12-17] 
        
        [ -a, +1/a, +1], [ -a, +1, +1/a], [ -1, +a, +1/a],
        [ -1/a, +a, +1], [ -1/a, +1, +a], [ -1, +1/a, +a],   // Corner triangles -X+Y+Z  [18-23]
    
        [ +a, +1/a, -1], [ +a, +1, -1/a], [ +1, +a, -1/a],
        [ +1/a, +a, -1], [ +1/a, +1, -a], [ +1, +1/a, -a],   // Corner triangles +X+Y-Z  [24-29]
        
        [ +a, -1, -1/a], [ +a, -1/a, -1], [ +1/a, -a, -1],
        [ +1, -a, -1/a], [ +1, -1/a, -a], [ +1/a, -1, -a],   // Corner triangles +X-Y-Z  [30-35]
        
        [ -a, -1/a, -1], [ -a, -1, -1/a], [ -1, -a, -1/a],
        [ -1/a, -a, -1], [ -1/a, -1, -a], [ -1, -1/a, -a],   // Corner triangles -X-Y-Z  [36-41] 
        
        [ -a, +1, -1/a], [ -a, +1/a, -1], [ -1/a, +a, -1],
        [ -1, +a, -1/a], [ -1, +1/a, -a], [ -1/a, +1, -a],   // Corner triangles -X+Y-Z  [42-47]        
        ];
        
    // Scub 1 - created with half of the points above described - odd index 
    sCfaceslaevo = [
        // Build 8 triangles. One triangle per octant
        [  1,  5,  3], [  7,  9, 11], [ 13, 17, 15], [ 19, 21, 23],     // Up
        [ 25, 27, 29], [ 31, 35, 33], [ 37, 39, 41], [ 43, 47, 45],     // Down
        
        // Squares        
        [  5, 11, 17, 23], [ 41, 35, 29, 47],   // parallel XY        
        [  3, 21, 45, 27], [ 15,  9, 33, 39],   // parallel XZ
        [  1, 25, 31,  7], [ 13, 37, 43, 19],   // parallel YZ
               
        // Other triangles
        [ 11,  1,  7], [  1, 11,  5],  [  5, 21,  3], [ 21,  5, 23],
        [ 23, 13, 19], [ 13, 23, 17],  [  9, 17, 11], [ 17,  9, 15],
        [  3, 25,  1], [ 25,  3, 27],  [ 19, 45, 21], [ 45, 19, 43],
        [ 15, 37, 13], [ 37, 15, 39],  [ 33,  7, 31], [  7, 33,  9],
        [ 47, 27, 45], [ 27, 47, 29],  [ 41, 43, 37], [ 43, 41, 47],
        [ 39, 35, 41], [ 35, 39, 33],  [ 29, 31, 25], [ 31, 29, 35]
      /*[  5,  7, 11], [  1,  7,  5],  [  3,  5, 23], [  3, 23, 21],
        [ 17, 19, 23], [ 13, 19, 17],  [ 11, 15, 17], [  9, 15, 11],
        [  1,  3, 27], [ 27, 25,  1],  [ 19, 43, 21], [ 43, 45, 21],
        [ 13, 15, 39], [ 37, 13, 39],  [  9,  7, 31], [  9, 31, 33],
        [ 45, 29, 27], [ 29, 45, 47],  [ 37, 47, 43], [ 47, 37, 41],
        [ 33, 41, 39], [ 41, 33, 35],  [ 35, 25, 29], [ 25, 35, 31]  */
        ];
        
    // Scub 2 - created with half of the points above described - even index
    sCfacesdextro = [  
        // Build 8 triangles. One triangle per octant
        [  0,  4,  2], [  6,  8, 10], [ 12, 16, 14], [ 18, 20, 22],     // Up
        [ 24, 26, 28], [ 30, 34, 32], [ 36, 38, 40], [ 42, 46, 44],     // Down
        
        // Squares        
        [  4, 10, 16, 22], [ 40, 34, 28, 46],   // parallel XY        
        [  2, 20, 44, 26], [ 14,  8, 32, 38],   // parallel XZ
        [  0, 24, 30,  6], [ 12, 36, 42, 18],   // parallel YZ
               
        // Other triangles
        [  4,  6, 10], [  0,  6,  4],  [  2,  4, 22], [  2, 22, 20],
        [ 16, 18, 22], [ 12, 18, 16],  [ 10, 14, 16], [  8, 14, 10],
        [  0,  2, 26], [ 26, 24,  0],  [ 18, 42, 20], [ 42, 44, 20],
        [ 12, 14, 38], [ 36, 12, 38],  [  8,  6, 30], [  8, 30, 32],
        [ 44, 28, 26], [ 28, 44, 46],  [ 36, 46, 42], [ 46, 36, 40],
        [ 32, 40, 38], [ 40, 32, 34],  [ 34, 24, 28], [ 24, 34, 30]  
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
                //color( "orange", 0.2 ) {sphere(rCirSnubCube);
                }      
        }       
    }
}

/* **RENDERING OF SOLIDS** */
SnubCube ( edge = edge, position = position, chiral = chiral);
