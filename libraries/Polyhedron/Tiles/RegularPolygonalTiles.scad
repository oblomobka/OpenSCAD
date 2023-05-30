// Regular Polygonal Tiles v.01
// (C) @oblomobka - 2023.03
// GPL license

phi = (1+sqrt(5))/2; // Golden ratio = 1,618...

module RegularTiles (Polygon = 3, side = 20, h = 1, Bevel = 1){
    

    }
    
module TriangleTile (side = 40, h = 0.35, Bevel =1){
    
    a = (side * 0.5) / cos (30);
    // Definition of points and faces
    Tpoints=[
        [ 0, a, 0], [ a * +cos(30), -a * sin(30), 0], [ -a * cos(30), -a * sin(30), 0],
        [ 0, a, h], [ a * +cos(30), -a * sin(30), h], [ -a * cos(30), -a * sin(30), h],
        ];
       
    Tfaces=[
        [ 0, 1, 2], [ 3, 5, 4],                         // Floor & Roof                                             
        [ 0, 3, 4, 1], [ 1, 4, 5, 2], [ 2, 5, 3, 0]     // Walls        
    ];
    
    polyhedron(Tpoints,Tfaces);
}

module SquareTile (side = 40, h = 0.35, Bevel =1){
    
    a = side * 0.5 ;
    
    // Definition of points and faces
    Sqpoints=[
        [ +a, +a, 0], [ +a, -a, 0], [ -a, +a, 0], [ -a, -a, 0],
        [ +a, +a, h], [ +a, -a, h], [ -a, +a, h], [ -a, -a, h]
        ];
       
    Sqfaces=[
        [ 0, 2, 3, 1], [ 4, 5, 7, 6],   // Floor & Roof
        // Walls
        [ 0, 4, 5, 1], [ 1, 5, 7, 3],
        [ 3, 7, 6, 2], [ 2, 6, 4, 0]
    ];
    
    polyhedron(Sqpoints,Sqfaces);
}

module PentagonTile (side = 40, h = 0.35, Bevel =1){
    
    a = (side * 0.5) / cos (54);
    
    // Definition of points and faces
    Ppoints=[
        // Floor points
        [ 0, a, 0],
        [a * +cos (18), a * +sin (18), 0], [a * -cos (18), a * +sin (18), 0],
        [a * +sin (36), a * -cos (36), 0], [a * -sin (36), a * -cos (36), 0],
    
        // Roof points
        [ 0, a, h],
        [a * +cos (18), a * +sin (18), h], [a * -cos (18), a * +sin (18), h],
        [a * +sin (36), a * -cos (36), h], [a * -sin (36), a * -cos (36), h],
        ];
       
    Pfaces=[
        [ 0, 1, 3, 4, 2], [ 5, 7, 9, 8, 6],          // Floor & Roof
        // Walls
        [ 0, 5, 6, 1], [ 1, 6, 8, 3],
        [ 3, 8, 9, 4], [ 4, 9, 7, 2 ],
        [ 2, 7, 5, 0]
        ];
    
    polyhedron(Ppoints,Pfaces);
}

module HexagonTile (side = 40, h = 0.35, Bevel =1){
    
    a = side;
    
    // Definition of points and faces
    Ppoints=[
        // Floor points
        [ +a, 0, 0], [ -a, 0, 0],
        [ +a * cos (60), +a * sin (60), 0], [ -a * cos (60), +a * sin (60), 0],
        [ +a * cos (60), -a * sin (60), 0], [ -a * cos (60), -a * sin (60), 0],
    
        // Roof points
        [ +a, 0, h], [ -a, 0, h],
        [ +a * cos (60), +a * sin (60), h], [ -a * cos (60), +a * sin (60), h],
        [ +a * cos (60), -a * sin (60), h], [ -a * cos (60), -a * sin (60), h],
        ];
       
    Pfaces=[
        [ 0, 4, 5, 1, 3, 2], [ 6, 8, 9, 7, 11, 10],          // Floor & Roof
        // Walls
        [  0,  6, 10,  4], [  4, 10, 11,  5], [  5, 11,  7,  1],
        [  1,  7,  9,  3], [  3,  9,  8,  2], [  2,  8,  6,  0]
        ];
    
    polyhedron(Ppoints,Pfaces);
}


PentagonTile();