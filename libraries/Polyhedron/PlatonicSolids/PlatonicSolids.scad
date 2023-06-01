// PlatonicSolids
// (C) @oblomobka - 2023.06
// GPL license
/*  LIST OF PLATONIC SOLIDS
    -----------------------                        
    + Tetrahedron
    + Octahedron
    + Cube
    + Dodecahedron
    + Icosahedron
*/


/* **CUSTOMIZER VARIABLES** */
// Type of Platonic Solid
type = "Dodecahedron"; //["Tetrahedron", "Cube", "Octahedron", "Dodecahedron", "Icosahedron"]
// Size of the solid
size = 30; //[10:100]
// Parameter on which the solid is built
accordingTo = "height"; //["edge", "height", "radioCircumscribed", "radioInscribed"]

/* **External files** */
use <TetrahedronRegular.scad>
use <OctahedronRegular.scad>
use <Cube.scad>
use <DodecahedronRegular.scad>
use <IcosahedronRegular.scad>

// This module is able to render any Platonic Solid, defined by its edge, height, radio of circumscribed sphere and radio of inscribed sphere
module PlatonicSolids ( type = "Dodecahedron", size = 30, accordingTo = "edge"){
    
    phi = (1+sqrt(5))/2; // Golden ratio = 1,618...
    
    if ( accordingTo == "edge"){
        if ( type == "Tetrahedron" || type == "T" ){
            TetrahedronRegular ( size, position = "Face");
        }
                if ( type == "Cube" || type == "C") {
                    Cube ( size, position = "Face");
                }
                        if( type == "Octahedron" || type == "O") {
                            OctahedronRegular ( size, position = "Face");
                        }
                                if ( type == "Dodecahedron" || type == "D") {
                                    DodecahedronRegular ( size, position = "Face");
                                }
                                        if ( type == "Icosahedron" || type == "I") {
                                            IcosahedronRegular ( size, position = "Face");
                                        }
    }
        
    if ( accordingTo == "height"){
                if ( type == "Tetrahedron" || type == "T"){
                    TetrahedronRegular ( size/(sqrt(6)/3), position = "Face");
                }
                        if ( type == "Cube" || type == "C") {
                            Cube ( size/1, position = "Face");
                        }
                                if ( type == "Octahedron" || type == "O") {
                                    OctahedronRegular ( size/(sqrt(6)/3), position = "Face");
                                }
                                        if ( type == "Dodecahedron" || type == "D") {
                                            DodecahedronRegular ( size/(phi^2/sqrt(3-phi)), position = "Face");
                                        }
                                                if ( type == "Icosahedron" || type == "I") {
                                                    IcosahedronRegular ( size/(phi^2/sqrt(3)), position = "Face");
                                                }
     }
    if (accordingTo == "radioCircumscribed"){
                if ( type == "Tetrahedron" || type == "T"){
                    TetrahedronRegular ( size/(sqrt(6)/4), position = "Center");
                    color( "grey", 0.1 ) { sphere(size); }
                }
                        if ( type == "Cube" || type == "C") {
                            Cube (size/(sqrt(3)/2), position = "Center");
                            color ( "grey", 0.1 ) { sphere(size); }
                        }
                                if (type == "Octahedron" || type == "O") {
                                    OctahedronRegular ( size/(1/sqrt(2)), position = "Center");
                                    color ( "grey", 0.1 ) { sphere(size); }
                                }
                                        if ( type == "Dodecahedron" || type == "D") {
                                            DodecahedronRegular ( size/(sqrt(3)*phi/2), position = "Center");
                                            color ( "grey", 0.1 ) { sphere(size); }
                                        }
                                                if ( type == "Icosahedron" || type == "I") {
                                                    IcosahedronRegular ( size/(sqrt(phi*sqrt(5))/2), position ="Center" );
                                                    color ( "grey", 0.1 ) { sphere(size); }
                                                }
    }
    if ( accordingTo == "radioInscribed" ){
                if ( type == "Tetrahedron" || type == "T"){
                    sphere ( size);
                    color ( "orange", 0.4 ) { TetrahedronRegular ( size/(1/sqrt(24)), position = "Center");}                 
                }
                        if ( type == "Cube" || type == "C") {
                            sphere ( size);
                            color ( "orange", 0.4 ) { Cube (size/(1/2), position = "Center");}
                        }
                                if( type == "Octahedron" || type == "O") {
                                    sphere ( size);
                                    color ( "orange", 0.4 ) { OctahedronRegular ( size/(sqrt(6)/6), position = "Center");}
                                }
                                        if ( type == "Dodecahedron" || type == "D") {
                                            sphere ( size);
                                            color ( "orange", 0.4 ) { DodecahedronRegular ( size/(phi^2/(2*sqrt(3-phi))), position = "Center");}
                                        }
                                                if ( type == "Icosahedron" || type == "I") {
                                                    sphere ( size);
                                                    color ( "orange", 0.4 ) { IcosahedronRegular ( size/(phi^2/(2*sqrt(3))), position = "Center");}
                                                }
    }     
}
/* **RENDERING OF SOLIDS** */
matrix = 50;

translate([matrix*0,0,0])
    PlatonicSolids ( "T", size, accordingTo);
translate([matrix*1,0,0])
    PlatonicSolids ( "C", size, accordingTo);
translate([matrix*2,0,0])
    PlatonicSolids ( "O", size, accordingTo);
translate([matrix*3,0,0])
    PlatonicSolids ( "D", size, accordingTo);
translate([matrix*4,0,0])
    PlatonicSolids ( "I", size, accordingTo);
