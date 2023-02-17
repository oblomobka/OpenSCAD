// PlatonicSolids v.01
// (C) @oblomobka - 2023.02
// GPL license
/*  LIST OF PLATONIC SOLIDS
    -----------------------                        
    - Tetrahedron
    - Octahedron
    - Cube
    - Dodecahedron
    - Icosahedron
*/

/* **CUSTOMIZER VARIABLES** */
// Type of Platonic Solid
type = "Dodecahedron"; //["Tetrahedron", "Cube", "Octahedron", "Dodecahedron", "Icosahedron"]
// Size of the solid
size=40; //[10:100]
// Parameter on which the solid is built
accordingTo = "edge"; //["Edge", "height", "radioCircumscribed", "radioInscribed"]

/* **MODULES** */
module Tetrahedron(edge=20, position="Face"){ 
    // Constants
    diAngleTetrahedron = acos(1/3); // dihedral angle of tetrahedron = 70.529
    rCirTetrahedron = sqrt(6)/4; // radius of a circumscribed sphere for edge = 1 / = 0,612...
    rInsTetrahedron = 1/sqrt(24); // radius of a inscribed sphere for edge = 1 / = 0,204
    rMidTetrahedron = 1/sqrt(8); // Midradius, which touches the middle of each edge / =354...
    hTetrahedron = sqrt(6)/3;
    
    // Variables
    x=edge/2;
    
    // Definition of points and faces
    Tpoints=[[x, 0, -x/sqrt(2)],[-x, 0, -x/sqrt(2)],[0, x, x/sqrt(2)],[0, -x, x/sqrt(2)]];
    Tfaces=[[0,2,3],[0,3,1],[3,2,1],[2,0,1]];
    
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,edge*(hTetrahedron-rCirTetrahedron)])
            rotate([90-diAngleTetrahedron/2, 0, 0])
                polyhedron(Tpoints,Tfaces);}
    else if(position=="Center") {
        polyhedron(Tpoints,Tfaces);} 
}

module Octahedron(edge=20, position="Face"){ 
    // Constants
    diAngleOctahedron = acos(-1/3); // dihedral angle of octahedron = 109,471
    rCirOctahedron = 1/sqrt(2); // radius of a circumscribed sphere for edge = 1 / = 0,707..
    rInsOctahedron = sqrt(6)/6; // radius of a inscribed sphere for edge = 1 / = 0,408
    rMidOctahedron = 1/2; // Midradius, which touches the middle of each edge / =0,5
    
    // Variables
    x=edge/sqrt(2);
    
    // Definition of points and faces
    Opoints=[[x,0,0],[-x,0,0],[0,x,0],[0,-x,0],[0,0,x],[0,0,-x]];
    Ofaces=[[0,4,3],[3,4,1],[1,4,2],[2,4,0],
            [5,0,3],[2,0,5],[1,2,5],[3,1,5]];
    
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,edge*rInsOctahedron])
            rotate([-diAngleOctahedron/2, 0, 0])    
                rotate([0, 0, 45])
                    polyhedron(Opoints,Ofaces);}
    else if(position=="Center") {
        polyhedron(Opoints,Ofaces);} 
}

module Cube(edge=20, position="Face"){
    // Constants
    diAngleCube = 90; // dihedral angle of cube
    rCirCube = sqrt(3)/2; // radius of a circumscribed sphere for edge = 1 / = 1,061...
    rInsCube = 1/2; // radius of a inscribed sphere for edge = 1 / = 0,5
    rMidCube = 1/sqrt(2); // Midradius, which touches the middle of each edge / =0,707...
    
    // Variables
    x=edge/2;
    
    // Definition of points and faces
    Cpoints=[[x, x, x],[x, -x, x],[-x, -x, x],[-x, x, x],
             [x, x, -x],[x, -x, -x],[-x, -x, -x],[-x, x, -x]];
    Cfaces=[[0,1,2,3],[0,4,5,1],[0,3,7,4],[2,1,5,6],[3,2,6,7],[7,6,5,4]];
    
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,x])
            polyhedron(Cpoints,Cfaces);}
    else if(position=="Center") {
        polyhedron(Cpoints,Cfaces);} 
}

module Dodecahedron(edge=20, position="Face"){ 
    // Constants
    phi = (1+sqrt(5))/2; // Golden ratio = 1,618...
    diAngleDodecahedron = acos(-1/sqrt(5))/*atan(1/phi)*/; // dihedral angle of Dodecahedron = 116,56505...
    rCirDodecahedron = sqrt(3)*phi/2; // radius of a circumscribed sphere for edge = 1 / =1,401...
    rInsDodecahedron = phi^2/(2*sqrt(3-phi)); // radius of a inscribed sphere for edge = 1 / =1,1135...
    rMidDodecahedron = phi^2/2; // Midradius, which touches the middle of each edge / =1,309...
    
    // Variables
    diagonal=edge*phi; // x depicts the side of cube inscrit in the dodecahedron, that is the lenght of the diagonal of regular pentagon
    pCube = diagonal/2; // to depicts the coordinates of cube inscrit in a pentagon center in (0,0,0) - 8 vertices
    // longside : shortSide depicts the 3 rectangles to complete the 20 vertices of dodecahedron apart of the cube
    longSide = (edge*phi^2)/2;
    shortSide = edge/2;
    
    // Definition of points and faces
    Dpoints=[[-pCube,-pCube,-pCube],[-pCube,pCube,-pCube],[pCube,pCube,-pCube],[pCube,-pCube,-pCube],
            [-pCube,-pCube,pCube],[-pCube,pCube,pCube],[pCube,pCube,pCube],[pCube,-pCube,pCube],
            [0,-longSide,-shortSide],[0,-longSide,shortSide],[0,longSide,-shortSide],[0,longSide,shortSide],
            [-shortSide,0,-longSide],[shortSide,0,-longSide],[-shortSide,0,longSide],[shortSide,0,longSide],
            [-longSide,-shortSide,0],[-longSide,shortSide,0],[longSide,-shortSide,0],[longSide,shortSide,0]];
    Dfaces=[[0,8,3,13,12],[2,10,1,12,13],[2,13,3,18,19],[1,12,0,16,17],
           [0,16,4,9,8],[7,18,3,8,9],[2,19,6,11,10],[5,17,1,10,11],
           [7,9,4,14,15],[5,11,6,15,14],[5,14,4,16,17],[7,15,6,19,18]];
    
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,edge*rInsDodecahedron])
            rotate([90-diAngleDodecahedron/2, 0, 0])
                polyhedron(Dpoints,Dfaces);}
    else if(position=="Center") {
        polyhedron(Dpoints,Dfaces);} 
}
module Icosahedron(edge=20, position="Face"){ 
    // Constants
    phi = (1+sqrt(5))/2; // Golden ratio = 1,618...
    diAngleIcosahedron = acos(-sqrt(5)/3); // dihedral angle of Icosahedron = 138,1897...
    rCirIcosahedron = sqrt(phi*sqrt(5))/2; // radius of a circumscribed sphere for edge = 1 / =0,951...
    rInsIcosahedron = phi^2/(2*sqrt(3)); // radius of a inscribed sphere for edge = 1 / =0,7558...
    rMidIcosahedron = phi/2; // Midradius, which touches the middle of each edge / =0,809...
    
    // Variables
    // longside : shortSide depicts the 3 rectangles (one in each plane (xy - xz - yz) to depict the 12 vertices of Icosahedron
    longSide = edge*phi/2;
    shortSide = edge/2;
    
    // Definition of points and faces
    Ipoints=[   [longSide,shortSide,0],[longSide,-shortSide,0],[-longSide,-shortSide,0],[-longSide,shortSide,0],
                [shortSide,0,longSide],[shortSide,0,-longSide],[-shortSide,0,-longSide],[-shortSide,0,longSide],
                [0,longSide,shortSide],[0,longSide,-shortSide],[0,-longSide,-shortSide],[0,-longSide,shortSide]];
    Ifaces=[    [0,4,1],[0,8,4],[0,9,8],[0,5,9],[0,1,5],
                [2,11,7],[2,10,11],[2,6,10],[2,3,6],[2,7,3],
                [1,10,5],[1,11,10],[1,4,11],[4,7,11],[4,8,7],
                [7,8,3],[3,8,9],[3,9,6],[6,9,5],[6,5,10]];
    
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,edge*rInsIcosahedron])
            rotate([90-diAngleIcosahedron/2, 0, 0])
                polyhedron(Ipoints,Ifaces);}
    else if(position=="Center") {
        polyhedron(Ipoints,Ifaces);} 
}

// This module is able to render any Platonic Solid, defined by its edge, height, radio of circumscribed sphere and radio of inscribed sphere
module PlatonicSolids (type="Dodecahedron", size=20, accordingTo="edge"){
    
    phi = (1+sqrt(5))/2; // Golden ratio = 1,618...
    
    if(accordingTo=="edge"){
        if(type=="Tetrahedron"||type=="T"){
            Tetrahedron (size, position="Face");
        }
                if(type=="Cube"||type=="C") {
                    Cube (size, position="Face");
                }
                        if(type=="Octahedron"||type=="O") {
                            Octahedron (size, position="Face");
                        }
                                if(type=="Dodecahedron"||type=="D") {
                                    Dodecahedron (size, position="Face");
                                }
                                        if(type=="Icosahedron"||type=="I") {
                                            Icosahedron (size, position="Face");
                                        }
    }
        
    if(accordingTo=="height"){
                if(type=="Tetrahedron"||type=="T"){
                    Tetrahedron (size/(sqrt(6)/3), position="Face");
                }
                        if(type=="Cube"||type=="C") {
                            Cube (size/1, position="Face");
                        }
                                if(type=="Octahedron"||type=="O") {
                                    Octahedron (size/(sqrt(6)/3), position="Face");
                                }
                                        if(type=="Dodecahedron"||type=="D") {
                                            Dodecahedron (size/(phi^2/sqrt(3-phi)), position="Face");
                                        }
                                                if(type=="Icosahedron"||type=="I") {
                                                    Icosahedron (size/(phi^2/sqrt(3)), position="Face");
                                                }
     }
    if(accordingTo=="radioCircumscribed"){
                if(type=="Tetrahedron"||type=="T"){
                    Tetrahedron (size/(sqrt(6)/4), position="Center");
                    color( "grey", 0.1 ) {sphere(size);}
                }
                        if(type=="Cube"||type=="C") {
                            Cube (size/(sqrt(3)/2), position="Center");
                            color( "grey", 0.1 ) {sphere(size);}
                        }
                                if(type=="Octahedron"||type=="O") {
                                    Octahedron (size/(1/sqrt(2)), position="Center");
                                    color( "grey", 0.1 ) {sphere(size);}
                                }
                                        if(type=="Dodecahedron"||type=="D") {
                                            Dodecahedron (size/(sqrt(3)*phi/2), position="Center");
                                            color( "grey", 0.1 ) {sphere(size);}
                                        }
                                                if(type=="Icosahedron"||type=="I") {
                                                    Icosahedron (size/(sqrt(phi*sqrt(5))/2), position="Center");
                                                    color( "grey", 0.1 ) {sphere(size);}
                                                }
    }
    if(accordingTo=="radioInscribed"){
                if(type=="Tetrahedron"||type=="T"){
                    sphere(size);
                    color( "orange", 0.4 ) {Tetrahedron (size/(1/sqrt(24)), position="Center");}                 
                }
                        if(type=="Cube"||type=="C") {
                            sphere(size);
                            color( "orange", 0.4 ) {Cube (size/(1/2), position="Center");}
                        }
                                if(type=="Octahedron"||type=="O") {
                                    sphere(size);
                                    color( "orange", 0.4 ) {Octahedron (size/(sqrt(6)/6), position="Center");}
                                }
                                        if(type=="Dodecahedron"||type=="D") {
                                            sphere(size);
                                            color( "orange", 0.4 ) {Dodecahedron (size/(phi^2/(2*sqrt(3-phi))), position="Center");}
                                        }
                                                if(type=="Icosahedron"||type=="I") {
                                                    sphere(size);
                                                    color( "orange", 0.4 ) {Icosahedron (size/(phi^2/(2*sqrt(3))), position="Center");}
                                                }
    }     
}
/* **RENDERING OF SOLIDS** */ 
PlatonicSolids(type, size, accordingTo);
