// ArquimedianSolids v.01
// (C) @oblomobka - 2023.01
// GPL license
/*  LIST OF ARQUIMEDIAN SOLIDS
    -------------------------------------------------
    NAME                            CONWAY NOTATION
    - Truncated Tetrahedron         tT
    - Cuboctahedron                 aC / aaT
    - Truncated Cube                tC
    - Truncated Octahedron          tO / bT
    - Rhombicuboctahedron           eC / aaC / aaaT
    - Truncated Cuboctahedron       bC / taC
    - Snub Cube                     sC
    - Icosidodecahedron             aD
    - Truncated Dodecahedron        tD
    - Truncated Icosahedron         tI
    - Rhombicosidodecahedron        eD / aaD
    - Truncated Icosidodecahedron   bD / taD
    - Snub Dodecahedron             sD
*/

/* **CUSTOMIZER VARIABLES** */
// Edge of Truncated Tetrahedron (h ****)
truncatedTetrahedron_Edge=48; //[10:100]
// Edge of Cuboctahedron (h ****)
cuboctahedron_Edge=48; //[10:100]
// Truncated Cube (h ****)
truncatedCube_Edge=48; //[10:100]
// Center of the solid or stand over a face
position = "Face"; //["Center", "Face"]
// Distance between solids in the rendering
matrix = 70; //[50:200]

/* **MODULES** */
module TruncatedTetrahedron(edge=20, position="Face"){ //tT (Conway notation)
    // Constants
    diAngle_tT = acos(1/3); // dihedral angle between hexagonal faces of tT  = 70.529
    
    // Variables
    x=edge/sqrt(8);
    
    // Definition of points and faces
    tTpoints=[  [3*x,x,x],[x,3*x,x],[x,x,3*x],
                [-3*x,-x,x],[-x,-3*x,x],[-x,-x,3*x],
                [-3*x,x,-x],[-x,3*x,-x],[-x,x,-3*x],
                [3*x,-x,-x],[x,-3*x,-x],[x,-x,-3*x]
                ];
    tTfaces=[   [0,2,5,4,10,9],[7,1,0,9,11,8],[4,3,6,8,11,10],[1,7,6,3,5,2],
                [0,1,2],[3,4,5],[6,7,8],[9,10,11]
                ];
 
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        //translate([0,0,x*(hTetrahedron-rCirTetrahedron)]) 
            rotate([90-diAngle_tT/2, 0, 0])
                rotate([0, 0, 45])
                    polyhedron(tTpoints,tTfaces);}
    else if(position=="Center") {
        polyhedron(tTpoints,tTfaces);}
    }

module Cuboctahedron(edge=20, position="Face"){ //aC / aaT (Conway notation)
    // Constants
    //diAngle_aC = acos(1/3); // ****correct
    
    // Variables
    x=edge/sqrt(2);
    
    // Definition of points and faces
    tCpoints=[  [x,x,0],[x,-x,0],[-x,-x,0],[-x,x,0],
                [x,0,x],[x,0,-x],[-x,0,-x],[-x,0,x],
                [0,x,x],[0,x,-x],[0,-x,-x],[0,-x,x]
                ];
    tCfaces=[   [0,4,1,5],[0,9,3,8],[1,11,2,10],[2,7,3,6],[4,8,7,11],[6,9,5,10],
                [0,8,4],[0,5,9],[1,4,11],[1,10,5],
                [2,11,7],[2,6,10],[3,7,8],[3,9,6]
                ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,x])
            polyhedron(tCpoints,tCfaces);}
    else if(position=="Center") {
        polyhedron(tCpoints,tCfaces);}
    }
    
module TruncatedCube(edge=20, position="Face"){ //tC
    // Constants
    //diAngle_aC = acos(1/3); // ****correct
    
    // Variables
    x=(edge+2*edge/sqrt(2))/2;
    b=edge/sqrt(2);
    
    // Definition of points and faces
    aCpoints=[  [x-b,x,x],[x,x-b,x],[x,x,x-b],
                [-(x-b),x,x],[-x,x-b,x],[-x,x,x-b],
                [-(x-b),-x,x],[-x,-(x-b),x],[-x,-x,x-b],
                [x-b,-x,x],[x,-(x-b),x],[x,-x,x-b],
                [x-b,x,-x],[x,x-b,-x],[x,x,-(x-b)],
                [-(x-b),x,-x],[-x,x-b,-x],[-x,x,-(x-b)],
                [-(x-b),-x,-x],[-x,-(x-b),-x],[-x,-x,-(x-b)],
                [x-b,-x,-x],[x,-(x-b),-x],[x,-x,-(x-b)]
                ];
    aCfaces=[   [0,1,2],[3,4,5],[6,7,8],[9,10,11],
                [0,3,4,7,6,9,10,1],
                [12,14,13],[15,16,17],[18,20,19],[21,22,23],
                [12,13,22,21,18,19,16,15],
                [1,10,11,23,22,13,14,2],
                [6,8,20,18,21,23,11,9],
                [4,5,17,16,19,20,8,7],
                [0,2,14,12,15,17,5,3]
                ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,x])
            polyhedron(aCpoints,aCfaces);}
    else if(position=="Center") {
        //rotate([0, 0, 45])
            polyhedron(aCpoints,aCfaces);}
    }
    
    
/* **RENDERING OF SOLIDS** */
TruncatedTetrahedron(edge=truncatedTetrahedron_Edge, position=position);
translate([matrix,0,0])
    Cuboctahedron(edge=cuboctahedron_Edge, position=position);
translate([matrix*2,0,0])
    //rotate([0,0,45])
        TruncatedCube(edge=truncatedCube_Edge, position=position);
    
