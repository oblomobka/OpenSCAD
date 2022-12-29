// Interesting Engendros
// 
// (C) @oblomobka - 2022.12
// GPL license

/* here is defined the Golden ratio -> phi 
  ----- phi=(1+sqrt(5))/2 = 1,618 -----
*/
include <../general/constants.scad> 

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
  
//Engendro1(edge=5);
Engendro2(edge=1);