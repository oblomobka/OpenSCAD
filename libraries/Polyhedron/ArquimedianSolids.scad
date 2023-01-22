// ArquimedianSolids v.01
// (C) @oblomobka - 2023.01
// GPL license

/* **CUSTOMIZER VARIABLES** */
// Edge of truncatedTetrahedron (h ****)
tT_Edge=48; //[10:100]
// Center of the solid or stand over a face
Position = "Face"; //["Center", "Face"]
// Distance between solids in the rendering
Matrix = 70; //[50:200]

/* **MODULES** */
module truncatedTetrahedron(edge=20, position="Face"){ //tT (Conway notation)
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

    
    // tT stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        //translate([0,0,edge*(hTetrahedron-rCirTetrahedron)])
            rotate([0, 90-diAngle_tT/2, 0])
                rotate([0, 0, 45])
                    polyhedron(tTpoints,tTfaces);}
    else if(position=="Center") {
        polyhedron(tTpoints,tTfaces);}
    }
    
/* **RENDERING OF SOLIDS** */ 
truncatedTetrahedron(edge=tT_Edge, position=Position);
