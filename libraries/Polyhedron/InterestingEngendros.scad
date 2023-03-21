// Interesting Engendros
// 
// (C) @oblomobka - 2023.03
// GPL license

/* here is defined the Golden ratio -> phi 
  ----- phi=(1+sqrt(5))/2 = 1,618 -----
*/
include <../general/constants.scad> 

/* **CUSTOMIZER VARIABLES** */
// Edge
edge = 20; //[10:100]

/* **Variables for Snub Cube Irregular** */
// Spin of squares in the Snub cube
spinS = 200; //[0:1000]
// Scale of squares in the Snub cube
scaleS = 100; //[0:1000]

/* **Variables for Snub Cube Roll** */
// rotations x
spX = 0; //[0:360]
// rotations y
spY = 0; //[0:360]
// rotations z
spZ = 0; //[0:360]

module Engendro1(edge=20){ 
    x=edge*phi; // x represent the side of cube inscrit in the dodecahedron, that is the lenght of the diagonal of regular pentagon
    
    Dpoints=[[-x,-x,-x],[-x,x,-x],[x,x,-x],[x,-x,-x],
            [-x,-x,x],[-x,x,x],[x,x,x],[x,-x,x],
            [0,-phi,-1/phi],[0,-phi,1/phi],[0,phi,-1/phi],[0,phi,1/phi],
            [-1/phi,0,-phi],[1/phi,0,-phi],[-1/phi,0,phi],[1/phi,0,phi],
            [-phi,-1/phi,0],[-phi,1/phi,0],[phi,-1/phi,0],[phi,1/phi,0]];
    Dfaces=[[0,8,3,13,12],[2,10,1,12,13],[2,13,3,18,19],[1,12,0,16,17],
           [0,16,4,9,8],[7,18,3,8,9],[2,19,6,11,10],[5,17,1,10,11],
           [7,9,4,14,15],[5,11,6,15,14],[5,14,4,16,17],[7,15,6,19,18]];
    polyhedron(Dpoints,Dfaces);
    
}

module Engendro2(edge=20){
   diagonal=edge*phi; // x represents the side of cube inscrit in the dodecahedron, that is the lenght of the diagonal of regular pentagon
   pCube = diagonal/2; // to represent the coordinates of cube inscrit in a pentagon center in (0,0,0)
    
    
    Dpoints=[[-pCube,-pCube,-pCube],[-pCube,pCube,-pCube],[pCube,pCube,-pCube],[pCube,-pCube,-pCube],
            [-pCube,-pCube,pCube],[-pCube,pCube,pCube],[pCube,pCube,pCube],[pCube,-pCube,pCube],
            [0,-phi,-1/phi],[0,-phi,1/phi],[0,phi,-1/phi],[0,phi,1/phi],
            [-1/phi,0,-phi],[1/phi,0,-phi],[-1/phi,0,phi],[1/phi,0,phi],
            [-phi,-1/phi,0],[-phi,1/phi,0],[phi,-1/phi,0],[phi,1/phi,0]];
    Dfaces=[[0,8,3,13,12],[2,10,1,12,13],[2,13,3,18,19],[1,12,0,16,17],
           [0,16,4,9,8],[7,18,3,8,9],[2,19,6,11,10],[5,17,1,10,11],
           [7,9,4,14,15],[5,11,6,15,14],[5,14,4,16,17],[7,15,6,19,18]];
    polyhedron(Dpoints,Dfaces);
    
}
module SnubCubeIrregular(edge=20, position="Face", spinS=1, scaleS=1){ //sC
   // There are two possible Snub cubes, one symmetrical to the other. Both Snub cubes can be created from the vertices of a Truncated Cuboctahedron, half of the points for one Snubcube, the other half for the other Snub cube. Found in wikipedia. That creates no regular Snub cubes
    
    // Invariants
    
    // Variables
    a=edge/2+2*edge/sqrt(2);
    b=((spinS/100)*edge)/sqrt(2); //b represent the truncation value to obtain regular polygons. It operates on the vertex of the original polyhedron, the cuboctahedron in this case.
    c=((scaleS/100)*b)/sqrt(2);
    
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
    sCfaces=[   // Scub 1 - created with half of the points above described
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
                [19,0,32],[15,34,28],[30,8,45],[7,47,17],   // Up
                [2,39,20],[27,13,37],[10,42,25],[22,5,40],  // Down
                 // Scub 2
                //[3,18,6,23],[35,1,38,12],    
                //[14,26,11,31],[4,43,9,46],
                //[16,33,29,44],[21,36,24,41],
                //[3,0,35,32,16,19],[1,2,23,20,36,39],[4,7,18,17,44,47],[43,40,21,22,6,5],
                //[12,15,31,28,33,34],[8,11,30,29,45,46],[14,13,38,37,24,27],[25,26,10,9,42,41]
                ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,a])
            polyhedron(sCpoints,sCfaces);}
    else if(position=="Center") {
        polyhedron(sCpoints,sCfaces);}
    }
    
module SnubCubeRoll(edge=20, spin=[0, 0, 0]){ //sC - Created with tribonacci constant
    $fs = 0.1;
    // Constants
    tri = (1+(19-3*sqrt(33))^(1/3)+(19+3*sqrt(33))^(1/3))/3;  // Tribonacci constant = 1,839...
    
    // Invariants
    rCirSnubCube = sqrt((1+1/tri^2)+tri^2);
    
    // Variables
    //factor2 = sqrt(2+4*tri-2*tri^2); // acording to Wikipedia
    factor = sqrt(2*(1+1/tri^2)); // =1,60972 
    scale = edge/factor;
    a=tri;
    
    // Definition of points and faces
    // Both simetric snub cubes are created with these points, even index buids one, odd index the other one
    sCpoints=[  
        [+a, +1, +1/a],[+a, +1/a, +1],[+1/a, +a, +1],[+1, +a, +1/a],[+1, +1/a, +a],[+1/a, +1, +a],   //Corner triangle XYZ      [0-5]
        [+a, -1/a, +1],[+a, -1, +1/a],[+1, -a, +1/a],[+1/a, -a, +1],[+1/a, -1, +a],[+1, -1/a, +a],   //Corner triangle X-YZ     [6-11]
        [-a, -1, +1/a],[-a, -1/a, +1],[-1/a, -a, +1],[-1, -a, +1/a],[-1, -1/a, +a],[-1/a, -1, +a],   //Corner triangle -X-YZ    [12-17]  
        [-a, +1/a, +1],[-a, +1, +1/a],[-1, +a, +1/a],[-1/a, +a, +1],[-1/a, +1, +a],[-1, +1/a, +a],   //Corner triangle -XYZ     [18-23]
    
        [+a, +1/a, -1],[+a, +1, -1/a],[+1, +a, -1/a],[+1/a, +a, -1],[+1/a, +1, -a],[+1, +1/a, -a],   //Corner triangle XY-Z      [24-29]
        [+a, -1, -1/a],[+a, -1/a, -1],[+1/a, -a, -1],[+1, -a, -1/a],[+1, -1/a, -a],[+1/a, -1, -a],   //Corner triangle X-Y-Z     [30-35]
        [-a, -1/a, -1],[-a, -1, -1/a],[-1, -a, -1/a],[-1/a, -a, -1],[-1/a, -1, -a],[-1, -1/a, -a],   //Corner triangle -X-Y-Z    [36-41]  
        [-a, +1, -1/a],[-a, +1/a, -1],[-1/a, +a, -1],[-1, +a, -1/a],[-1, +1/a, -a],[-1/a, +1, -a],   //Corner triangle -XY-Z     [42-47]
        
        ];
    // Scub 1 - created with half of the points above described - odd index 
    sCfaceslaevo=[  
        // "Corner" triangles
        [1,5,3],[7,11,9],[13,15,17],[19,21,23],             // Up
        [25,27,29],[31,33,35],[37,39,41],[43,45,47],        // Down
        // Squares
        [1,25,31,7],[3,21,45,27],[5,11,17,23],              // Up
        [13,37,43,19],[15,9,33,39],[41,35,29,47],           // Down
        // Other triangles
        [5,11,1],[1,11,7],[3,21,5],[5,21,23],[19,13,23],[23,13,17],[15,9,17],[17,9,11],
        [1,25,3],[3,25,27],[21,45,19],[19,45,43],[13,37,15],[15,37,39],[9,33,7],[7,33,31],
        [29,47,27],[27,47,45],[47,41,43],[43,41,37],[41,35,39],[39,35,33],[35,29,31],[31,29,25]
        ];
    // Scub 2 - created with half of the points above described - even index
    sCfacesdextro=[  
        // "Corner" triangles
        [0,2,4],[6,8,10],[12,14,16],[18,20,22],             // Up
        [24,26,28],[30,32,34],[36,38,40],[42,44,46],        // Down
        // Squares
        [0,24,30,6],[2,20,44,26],[4,10,16,22],              // Up
        [12,36,42,18],[14,8,32,38],[40,34,28,46],           // Down
        // Other triangles
        [4,10,6],[6,0,4],[4,2,22],[22,2,20],[22,18,16],[16,18,12],[16,14,10],[10,14,8],
        [2,0,26],[26,0,24],[18,20,42],[42,20,44],[14,12,38],[38,12,36],[6,8,30],[30,8,32],
        [26,28,44],[44,28,46],[42,46,36],[36,46,40],[38,40,32],[32,40,34],[30,34,24],[24,34,28]
        ];
  
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    rotate([spin[0], -spin[1], spin[2]])
        scale([scale,scale,scale])
            polyhedron(sCpoints,sCfaceslaevo);
        
    rotate([-spin[0], +spin[1], -spin[2]])
        scale([scale,scale,scale])
            polyhedron(sCpoints,sCfacesdextro);

   }

SnubCubeRoll(edge=edge, spin=[spX, spY, spZ]);
//SnubCubeIrregular (edge=edge, position="Center", spinS=spinS, scaleS=scaleS);    
//Engendro1(edge=5);
//Engendro2(edge=0.8);