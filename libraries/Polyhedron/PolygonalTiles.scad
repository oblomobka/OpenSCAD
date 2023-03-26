// Polygonal Tiles v.01
// (C) @oblomobka - 2023.03
// GPL license

module RegularTiles (Polygon = 3, edge = 20, h = 1, Bevel = 1){
    

    }
    
module TriangleTile (edge = 40, h = 0.35, Bevel =1){
    
    a = (edge * 0.5) / cos (30);
    // Definition of points and faces
    Tpoints=[
        [ 0, a, 0], [ a * +cos(30), a * (-sin(30)), 0], [ a * -cos(30), a * (-sin(30)), 0],
        [ 0, a, h], [ a * +cos(30), a * (-sin(30)), h], [ a * -cos(30), a * (-sin(30)), h],
    ];
       
    Tfaces=[
        [ 0, 1, 2],
        [ 3, 5, 4],
        [ 0, 3, 4, 1],
        [ 1, 4, 5, 2],
        [ 2, 5, 3, 0]
    ];
    
    polyhedron(Tpoints,Tfaces);
}

TriangleTile(edge = 40, h = 0.35);