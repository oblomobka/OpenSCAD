// ArquimedianSolids v.01
// (C) @oblomobka - 2023.03
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
    + Icosidodecahedron             aD
    - Truncated Dodecahedron        tD
    - Truncated Icosahedron         tI
    - Rhombicosidodecahedron        eD / aaD
    - Truncated Icosidodecahedron   bD / taD
    - Snub Dodecahedron             sD
*/

/* **CUSTOMIZER VARIABLES** */
// Edge of Truncated Tetrahedron (h ****)
truncatedTetrahedron_Edge=20; //[10:100]
// Edge of Cuboctahedron (h ****)
cuboctahedron_Edge=30; //[10:100]
// Truncated Cube (h ****)
truncatedCube_Edge=20; //[10:100]
// Truncated Octahedron (h ****)
truncatedOctahedron_Edge=25; //[10:100]
// Rhombicuboctahedron (h ****)
rhombicuboctahedron_Edge=25; //[10:100]
// TruncatedCuboctahedron (h ****)
truncatedCuboctahedron_Edge=15; //[10:100]
// Snub Cube (h ****)
snubCube_Edge=15; //[10:100]
// Icosidodecahedron (h ****)
icosidodecahedron_Edge=20; //[10:100]
// Center of the solid or stand over a face
position = "Face"; //["Center", "Face"]
// Distance between solids in the rendering
matrix = 100; //[50:200]

/* **MODULES** */   
module TruncatedTetrahedron(edge=20, position="Face"){ //tT
    // Invariants
    diAngle66_tT = acos(1/3); // dihedral angle between hexagonal faces of tT  = 70.529
    diAngle36_tT = acos(-1/3); // dihedral angle between hexagonal-triangle faces of tT = 109,471
    
    rInsTruncatedTetrahedron = 3/sqrt(24); // radius of a inscribed sphere touching the hexagons - for edge = 1 -> radius = 0,612
    
    // Variables
    a=3*edge/(2*sqrt(2));   // Tetrahedron points
    b=edge/sqrt(2);         // Truncate factor
    
    // Definition of points and faces
    tTpoints=[  [a-b,a-b,a],[a, a-b, a-b],[a-b, a, a-b],                // +X +Y +Z
                [-(a-b),-(a-b),a],[-a, -(a-b), a-b],[-(a-b), -a, a-b],  // -X -Y +Z
                [a-b,-(a-b),-a],[a, -(a-b), -(a-b)],[a-b, -a, -(a-b)],  // +X -Y -Z
                [-(a-b),a-b,-a],[-a, a-b, -(a-b)],[-(a-b), a, -(a-b)]   // -X +Y -Z              
                ];
    tTfaces=[  
                [0,1,2],[3,4,5],[6,7,8],[9,10,11],
                [1,0,3,5,8,7],[2,1,7,6,9,11],[0,2,11,10,4,3],[5,4,10,9,6,8]
                ];
 
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Center") {
        polyhedron(tTpoints,tTfaces);}
    else if(position=="Face"){
        translate([0,0,edge*rInsTruncatedTetrahedron]) 
            rotate([90-diAngle66_tT/2, 0, 0])
                rotate([0, 0, 45])
                    polyhedron(tTpoints,tTfaces);}
    }

module Cuboctahedron(edge=20, position="Face"){ //aC / aaT
    // Constants

    
    // Variables
    a=edge/sqrt(2);
    
    // Definition of points and faces
    tCpoints=[  [a,a,0],[a,-a,0],[-a,-a,0],[-a,a,0],
                [a,0,a],[a,0,-a],[-a,0,-a],[-a,0,a],
                [0,a,a],[0,a,-a],[0,-a,-a],[0,-a,a]
                ];
    tCfaces=[   [0,4,1,5],[0,9,3,8],[1,11,2,10],[2,7,3,6],[4,8,7,11],[6,9,5,10],
                [0,8,4],[0,5,9],[1,4,11],[1,10,5],
                [2,11,7],[2,6,10],[3,7,8],[3,9,6]
                ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,a])
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
        
module TruncatedCuboctahedron(edge=20, position="Face"){ //bC / taC
    // Invariants
    
    
    // Variables
    a=edge/2+2*edge/sqrt(2);
    b=edge/sqrt(2); //b represent the truncation value to obtain regular polygons. It operates on the vertex of the original polyhedron, the cuboctahedron in this case.
    c=b/sqrt(2);
    
    // Definition of points and faces
    taCpoints=[ [a-b, a, c],[a-b, a, -c],[a, a-b, -c],[a, a-b, c],          //+X+Y
                [a-b,-a,c],[a-b,-a,-c],[a,-(a-b),-c],[a,-(a-b),c],          //+X-Y
                [-(a-b),-a,c],[-(a-b),-a,-c],[-a,-(a-b),-c],[-a,-(a-b),c],  //-X-Y
                [-(a-b),a,c],[-(a-b),a,-c],[-a,a-b,-c],[-a,a-b,c],          //-X+Y
    
                [a-b,c,a],[a-b,-c,a],[a,-c,a-b],[a,c,a-b],                  //+X+Z
                [a-b,c,-a],[a-b,-c,-a],[a,-c,-(a-b)],[a,c,-(a-b)],          //+X-Z
                [-(a-b),c,-a],[-(a-b),-c,-a],[-a,-c,-(a-b)],[-a,c,-(a-b)],  //-X-Z
                [-(a-b),c,a],[-(a-b),-c,a],[-a,-c,a-b],[-a,c,a-b],          //-X+Z
    
                [c,a-b,a],[-c,a-b,a],[-c,a,a-b],[c,a,a-b],                  //+Y+Z
                [c,a-b,-a],[-c,a-b,-a],[-c,a,-(a-b)],[c,a,-(a-b)],          //+Y-Z
                [c,-(a-b),-a],[-c,-(a-b),-a],[-c,-a,-(a-b)],[c,-a,-(a-b)],  //-Y-Z
                [c,-(a-b),a],[-c,-(a-b),a],[-c,-a,a-b],[c,-a,a-b]           //-Y+Z
                ];
    taCfaces=[  [0,1,2,3],[4,5,6,7],[8,9,10,11],[12,13,14,15],              // Centrer of squares in XY
                [16,17,18,19],[20,21,22,23],[24,25,26,27],[28,29,30,31],    // Centrer of squares in XZ
                [32,33,34,35],[36,37,38,39],[40,41,42,43],[44,45,46,47],    // Centrer of squares in YZ
                [2,3,19,18,7,6,22,23],[34,35,0,1,39,38,13,12],
                [15,14,27,26,10,11,30,31],[4,5,43,42,9,8,46,47],
                [17,16,32,33,28,29,45,44],[21,20,36,37,24,25,41,40],
                [3,0,35,32,16,19],[1,2,23,20,36,39],[4,7,18,17,44,47],[43,40,21,22,6,5],
                [12,15,31,28,33,34],[8,11,30,29,45,46],[14,13,38,37,24,27],[25,26,10,9,42,41]
                ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,a])
            polyhedron(taCpoints,taCfaces);}
    else if(position=="Center") {
        polyhedron(taCpoints,taCfaces);}
    }
    
module SnubCube(edge=20, position="Face"){ //sC
    /* There are two possible Snubcubes, one symmetrical to the other. Both Snubcubes can be created from the vertices of a Truncated Cuboctahedron, half of the points for one Snubcube, the other half for the other Snubcube. Found in wikipedia, but does it make sense? diagonals of a square, a hexagon, and octogon should form a equilateral triangle, and it looks as is not possible*/
    
    // Invariants
    
    // Variables
    a=edge/2+2*edge/sqrt(2);
    b=1*edge/sqrt(2); //b represent the truncation value to obtain regular polygons. It operates on the vertex of the original polyhedron, the cuboctahedron in this case.
    c=1*b/sqrt(2);
    
    // Definition of points and faces
    sCpoints=[ [a-b, a, c],[a-b, a, -c],[a, a-b, -c],[a, a-b, c],           //+X+Y  [0-3]
                [a-b,-a,c],[a-b,-a,-c],[a,-(a-b),-c],[a,-(a-b),c],          //+X-Y  [4-7]
                [-(a-b),-a,c],[-(a-b),-a,-c],[-a,-(a-b),-c],[-a,-(a-b),c],  //-X-Y  [8-11]
                [-(a-b),a,c],[-(a-b),a,-c],[-a,a-b,-c],[-a,a-b,c],          //-X+Y  [12-15]
    
                [a-b,c,a],[a-b,-c,a],[a,-c,a-b],[a,c,a-b],                  //+X+Z  [16-19]
                [a-b,c,-a],[a-b,-c,-a],[a,-c,-(a-b)],[a,c,-(a-b)],          //+X-Z  [20-23]
                [-(a-b),c,-a],[-(a-b),-c,-a],[-a,-c,-(a-b)],[-a,c,-(a-b)],  //-X-Z  [24-27]
                [-(a-b),c,a],[-(a-b),-c,a],[-a,-c,a-b],[-a,c,a-b],          //-X+Z  [28-31]
    
                [c,a-b,a],[-c,a-b,a],[-c,a,a-b],[c,a,a-b],                  //+Y+Z  [32-35]
                [c,a-b,-a],[-c,a-b,-a],[-c,a,-(a-b)],[c,a,-(a-b)],          //+Y-Z  [36-39]
                [c,-(a-b),-a],[-c,-(a-b),-a],[-c,-a,-(a-b)],[c,-a,-(a-b)],  //-Y-Z  [40-43]
                [c,-(a-b),a],[-c,-(a-b),a],[-c,-a,a-b],[c,-a,a-b]           //-Y+Z  [44-47]
                ];
    sCfaces=[  /*[0,1,2,3],[4,5,6,7],[8,9,10,11],[12,13,14,15],              // Centrer of squares in XY
                [16,17,18,19],[20,21,22,23],[24,25,26,27],[28,29,30,31],    // Centrer of squares in XZ
                [32,33,34,35],[36,37,38,39],[40,41,42,43],[44,45,46,47],    // Centrer of squares in YZ*/
                // Scub 1 - created with half of the points above described
                [2,19,7,22],[15,27,10,30],          // squares in X
                [34,0,39,13],[5,42,8,47],           // squares in Y
                [17,32,28,45],[20,37,25,40],        // squares in Z
                // Triangles in XY
                [0,2,19],[2,0,39],
                [15,13,27],[13,15,34],
                [10,8,30],[8,10,42],
                [5,7,47],[7,5,22],
                // Triangles in XZ
                [19,17,7],[17,19,32],
                [28,45,30],[15,30,28],
                [27,10,25],[25,37,27],
                [20,40,22],[22,2,20],
                // Triangles in YZ
                [0,34,32],[34,28,32],
                [17,45,47],[47,8,45],
                [5,42,40],[40,25,42],
                [37,20,39],[13,39,37],
                // "Corner" triangles
                [19,0,32],[15,34,28],[30,8,45],[7,47,17],  // Up
                [2,39,20],[27,13,37],[10,42,25],[22,5,40],
                 // Scub 2
                /*[3,18,6,23],[35,1,38,12],    
                [14,26,11,31],[4,43,9,46],
                [16,33,29,44],[21,36,24,41],*/
                /*[3,0,35,32,16,19],[1,2,23,20,36,39],[4,7,18,17,44,47],[43,40,21,22,6,5],
                [12,15,31,28,33,34],[8,11,30,29,45,46],[14,13,38,37,24,27],[25,26,10,9,42,41]*/
                ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,a])
            polyhedron(sCpoints,sCfaces);}
    else if(position=="Center") {
        polyhedron(sCpoints,sCfaces);}
    }


module Icosidodecahedron(edge=20, position="Face"){ //aD
    // Constants
    phi = (1+sqrt(5))/2; // Golden ratio = 1,618...
    angle_aD = asin(2*sqrt((5+sqrt(5))/10)/(1+sqrt(5))); // angle vertex to center pentagon
    hPentagon = sqrt(phi^2-((5+sqrt(5))/10));
    
    // Variables
    x=edge*phi;
    b=edge/(2*phi);
    b2=x/2;
    
    // Definition of points and faces
    aDpoints=[  [x,0,0],[-x,0,0],[0,x,0],[0,-x,0],[0,0,x],[0,0,-x],  //0-5
    
                [x-b,b2,edge/2],[x-b,b2,-edge/2],[x-b,-b2,edge/2],[x-b,-b2,-edge/2], //+XY/6-9
                [-(x-b),b2,edge/2],[-(x-b),b2,-edge/2],[-(x-b),-b2,edge/2],[-(x-b),-b2,-edge/2],//-XY/10-13
    
                [edge/2,x-b,b2],[-edge/2,x-b,b2],[edge/2,x-b,-b2],[-edge/2,x-b,-b2], //+YZ/14-17
                [edge/2,-(x-b),b2],[-edge/2,-(x-b),b2],[edge/2,-(x-b),-b2],[-edge/2,-(x-b),-b2],//-YZ/18-21
    
                [b2,edge/2,x-b],[b2,-edge/2,x-b],[-b2,edge/2,x-b],[-b2,-edge/2,x-b], //+ZX/22-25
                [b2,edge/2,-(x-b)],[b2,-edge/2,-(x-b)],[-b2,edge/2,-(x-b)],[-b2,-edge/2,-(x-b)],//-ZX/26-29
                ];
    
    aDfaces=[   [0,7,6],[0,8,9],[1,10,11],[1,13,12],        //triangles touching X axis
                [2,15,14],[2,16,17],[3,18,19],[3,21,20],    //triangles touching Y axis
                [4,23,22],[4,24,25],[5,26,27],[5,29,28],    //triangles touching Z axis
                [6,14,22],[8,23,18],[10,24,15],[12,19,25],  //triangles in octants + 
                [7,26,16],[9,20,27],[11,17,28],[13,29,21],  //triangles in octants -
                [0,6,22,23,8],[0,9,27,26,7],[1,12,25,24,10],[1,11,28,29,13],        //pentagons touching X axis
                [2,14,6,7,16],[2,17,11,10,15],[3,20,9,8,18],[3,19,12,13,21],        //pentagons touching Y axis
                [4,22,14,15,24],[4,25,19,18,23],[5,28,17,16,26],[5,29,21,20,27],    //pentagons touching Z axis
                ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,(hPentagon*edge)])
            rotate([0, 90-angle_aD, 0])
                polyhedron(aDpoints,aDfaces);}
    else if(position=="Center") {
        polyhedron(aDpoints,aDfaces);}
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
translate([matrix*6,0,0])
    SnubCube(edge=snubCube_Edge, position=position);
translate([matrix*7,0,0])
    Icosidodecahedron(edge=icosidodecahedron_Edge, position=position);
   
    
