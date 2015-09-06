// Shapes v.03
// (C) @oblomobka - 2015.08
// GPL3

include <constants_oblomobka.scad>
include <functions_oblomobka.scad>
include <functions_ext.scad>

// Definición de un trapecio isosceles
module trapezium (	p1=20,		// longitud de una de las líneas paralelas del trapecio
					p2=10,		// longitud de la otra línea paralela del trapecio
					h=15        // altura - distancia entre líneas paralelas
					){

POINTS=[    [p1/2,-h/2],
            [p2/2,h/2],
            [-p2/2,h/2],
            [-p1/2,-h/2]];

PATHS=[[0,1,2,3]];

polygon (points=POINTS, paths=PATHS);
}



module rounded_ngon (   side,           // lado del polígono
                        n,              // numero de lados del polígono
                        rounded=0       // radio de redondeo de las esquinas
                        ){     
    $fn=50;
    rotate([0,0,90+180/n])
    offset(r = rounded) 
        polygon([for (a=[0:360/n:360]) r_side (side-2*rounded*tan(360/(2*n)),n)*[cos(a),sin(a)]]);
}


// Ejemplos
translate([50,0,0])
    rounded_ngon (side=46, n=4, rounded=10);

trapezium (20,10,20);