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
 
    // Truncated Tetrahedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
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
    diAngle_aC = acos(1/3); // ****correct
    
    // Variables
    x=edge/sqrt(2);
    
    // Definition of points and faces
    aCpoints=[  [x,x,0],[x,-x,0],[-x,-x,0],[-x,x,0],
                [x,0,x],[x,0,-x],[-x,0,-x],[-x,0,x],
                [0,x,x],[0,x,-x],[0,-x,-x],[0,-x,x]
                ];
    aCfaces=[   [0,4,1,5],[0,9,3,8],[1,11,2,10],[2,7,3,6],[4,8,7,11],[6,9,5,10],
                [0,8,4],[0,5,9],[1,4,11],[1,10,5],
                [2,11,7],[2,6,10],[3,7,8],[3,9,6]
                ];
  
    // Cuboctahedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,x])
            polyhedron(aCpoints,aCfaces);}
    else if(position=="Center") {
        polyhedron(aCpoints,aCfaces);}
    }
    
/* **RENDERING OF SOLIDS** */
TruncatedTetrahedron(edge=truncatedTetrahedron_Edge, position=position);
translate([matrix,0,0])
    Cuboctahedron(edge=cuboctahedron_Edge, position=position);
