// ArquimedianSolids v.01
// (C) @oblomobka - 2023.01
// GPL license
/*  LIST OF ARQUIMEDIAN SOLIDS
    -------------------------------------------------
    NAME                            CONWAY NOTATION
    + Truncated Tetrahedron         tT
    + Cuboctahedron                 aC / aaT
    + Truncated Cube                tC
    + Truncated Octahedron          tO / bT
    + Rhombicuboctahedron           eC / aaC / aaaT
    + Truncated Cuboctahedron       bC / taC
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
// Truncated Octahedron (h ****)
truncatedOctahedron_Edge=48; //[10:100]
// Rhombicuboctahedron (h ****)
rhombicuboctahedron_Edge=48; //[10:100]
// TruncatedCuboctahedron (h ****)
truncatedCuboctahedron_Edge=20; //[10:100]
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
    
    // Variables
    x=(edge+2*edge/sqrt(2))/2;
    b=edge/sqrt(2); //b represent the truncation value to obtain regular polygons. It operates on the vertex of the original(Platonic) polyhedron.
    
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
    
module TruncatedOctahedron(edge=20, position="Face"){ //tO / bT
    // Constants
    
    // Variables
    x=3*edge/sqrt(2);
    b=edge/sqrt(2); //b represent the truncation value to obtain regular polygons. It operates on the vertex of the original(Platonic) polyhedron.
    
    // Definition of points and faces
    tOpoints=[  [x-b,0,b],[x-b,b,0],[x-b,0,-b],[x-b,-b,0],
                [0,x-b,b],[b,x-b,0],[0,x-b,-b],[-b,x-b,0],
                [b,0,x-b],[0,b,x-b],[-b,0,x-b],[0,-b,x-b],
                [-(x-b),0,b],[-(x-b),b,0],[-(x-b),0,-b],[-(x-b),-b,0],
                [0,-(x-b),b],[b,-(x-b),0],[0,-(x-b),-b],[-b,-(x-b),0],
                [b,0,-(x-b)],[0,b,-(x-b)],[-b,0,-(x-b)],[0,-b,-(x-b)],
                ];
    tOfaces=[   [0,3,2,1],[4,5,6,7],[8,9,10,11],[12,13,14,15],[16,19,18,17],[20,23,22,21],
                [0,8,11,16,17,3],[0,1,5,4,9,8],[4,7,13,12,10,9],[10,12,15,19,16,11],
                [14,22,23,18,19,15],[6,21,22,14,13,7],[2,3,17,18,23,20],[1,2,20,21,6,5]
                ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,edge*sqrt(2)])
                polyhedron(tOpoints,tOfaces);}
    else if(position=="Center") {
        rotate([0, 0, 45])
            polyhedron(tOpoints,tOfaces);}
    }

module Rhombicuboctahedron(edge=20, position="Face"){ //eC / aaC / aaaT 
    // Constants
    
    // Variables
    x=(edge+2*edge/sqrt(2))/2;
    b=edge/sqrt(2); //b represent the truncation value to obtain regular polygons. It operates on the vertex of the original(Platonic) polyhedron.
    
    // Definition of points and faces
    eCpoints=[  [x,x-b,x-b],[x-b,x,x-b],[x-b,x-b,x],
                [x,-(x-b),x-b],[x-b,-x,x-b],[x-b,-(x-b),x],
                [-x,-(x-b),x-b],[-(x-b),-x,x-b],[-(x-b),-(x-b),x],
                [-x,x-b,x-b],[-(x-b),x,x-b],[-(x-b),x-b,x],
                
                [x,x-b,-(x-b)],[x-b,x,-(x-b)],[x-b,x-b,-x],
                [x,-(x-b),-(x-b)],[x-b,-x,-(x-b)],[x-b,-(x-b),-x],
                [-x,-(x-b),-(x-b)],[-(x-b),-x,-(x-b)],[-(x-b),-(x-b),-x],
                [-x,x-b,-(x-b)],[-(x-b),x,-(x-b)],[-(x-b),x-b,-x],
                ];
    eCfaces=[   [0,1,2],[3,5,4],[6,7,8],[9,11,10],
                [12,13,14],[15,16,17],[18,20,19],[21,22,23],
                [2,11,8,5],[5,8,7,4],[2,5,3,0],[2,1,10,11],[8,11,9,6],
                [7,19,16,4],[3,4,16,15],[0,3,15,12],[0,12,13,1],
                [1,13,22,10],[10,22,21,9],[9,21,18,6],[6,18,19,7],
                [17,20,23,14],[15,17,14,12],[13,14,23,22],[23,20,18,21],[16,19,20,17]
                ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,x])
            polyhedron(eCpoints,eCfaces);}
    else if(position=="Center") {
        //rotate([0, 0, 45])
            polyhedron(eCpoints,eCfaces);}
    }
    
module TruncatedCuboctahedron(edge=20, position="Face"){ //bC / taC (Conway notation)
    // Constants
    
    // Variables
    x=edge/2+2*edge/sqrt(2);
    b=edge/sqrt(2); //b represent the truncation value to obtain regular polygons. It operates on the vertex of the original polyhedron, the cuboctahedron in this case.
    b2=edge/2;
    
    // Definition of points and faces
    taCpoints=[ [x-b,x,b2],[x-b,x,-b2],[x,x-b,-b2],[x,x-b,b2], //+X+Y
                [x-b,-x,b2],[x-b,-x,-b2],[x,-(x-b),-b2],[x,-(x-b),b2], //+X-Y
                [-(x-b),-x,b2],[-(x-b),-x,-b2],[-x,-(x-b),-b2],[-x,-(x-b),b2], //-X-Y
                [-(x-b),x,b2],[-(x-b),x,-b2],[-x,x-b,-b2],[-x,x-b,b2], //-X+Y
    
                [x-b,b2,x],[x-b,-b2,x],[x,-b2,x-b],[x,b2,x-b],  //+X+Z
                [x-b,b2,-x],[x-b,-b2,-x],[x,-b2,-(x-b)],[x,b2,-(x-b)],  //+X-Z
                [-(x-b),b2,-x],[-(x-b),-b2,-x],[-x,-b2,-(x-b)],[-x,b2,-(x-b)],  //-X-Z
                [-(x-b),b2,x],[-(x-b),-b2,x],[-x,-b2,x-b],[-x,b2,x-b],  //-X+Z
    
                [b2,x-b,x],[-b2,x-b,x],[-b2,x,x-b],[b2,x,x-b],  //+Y+Z
                [b2,x-b,-x],[-b2,x-b,-x],[-b2,x,-(x-b)],[b2,x,-(x-b)],  //+Y-Z
                [b2,-(x-b),-x],[-b2,-(x-b),-x],[-b2,-x,-(x-b)],[b2,-x,-(x-b)],  //-Y-Z
                [b2,-(x-b),x],[-b2,-(x-b),x],[-b2,-x,x-b],[b2,-x,x-b]   //-Y+Z
                ];
    taCfaces=[  [0,1,2,3],[4,5,6,7],[8,9,10,11],[12,13,14,15],             // Centrer of square in XY
                [16,17,18,19],[20,21,22,23],[24,25,26,27],[28,29,30,31],   // Centrer of square in XZ
                [32,33,34,35],[36,37,38,39],[40,41,42,43],[44,45,46,47],   // Centrer of square in YZ
                [2,3,19,18,7,6,22,23],[34,35,0,1,39,38,13,12],
                [15,14,27,26,10,11,30,31],[4,5,43,42,9,8,46,47],
                [17,16,32,33,28,29,45,44],[21,20,36,37,24,25,41,40],
                [3,0,35,32,16,19],[1,2,23,20,36,39],[4,7,18,17,44,47],[43,40,21,22,6,5],
                [12,15,31,28,33,34],[8,11,30,29,45,46],[14,13,38,37,24,27],[25,26,10,9,42,41]
                ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,x])
            polyhedron(taCpoints,taCfaces);}
    else if(position=="Center") {
        polyhedron(taCpoints,taCfaces);}
    }
    
/* **RENDERING OF SOLIDS** */
TruncatedTetrahedron(edge=truncatedTetrahedron_Edge, position=position);
translate([matrix,0,0])
    Cuboctahedron(edge=cuboctahedron_Edge, position=position);
translate([matrix*2,0,0])
    TruncatedCube(edge=truncatedCube_Edge, position=position);
translate([matrix*3,0,0])
    TruncatedOctahedron(edge=truncatedOctahedron_Edge, position=position);
translate([matrix*4,0,0])
    Rhombicuboctahedron(edge=rhombicuboctahedron_Edge, position=position);
translate([matrix*5,0,0])
    TruncatedCuboctahedron(edge=truncatedCuboctahedron_Edge, position=position);
    
