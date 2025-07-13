include <common.scad>


ETS=HoriToVertScrewDistanceToEdge; // Edge to Screw center


module VP_ConnHoles(){
  translate([ConnThreadHoleLenght,0,VPH/2])
    rotate([0,-90,0])
      screw_hole(HoriToVertScrew, anchor=BOTTOM);
      //cylinder(ConnThreadHoleLenght, ConnThreadHoleDia/2, ConnThreadHoleDia/2);

    translate([ConnThreadHoleLenght,0,0])
    cuboid([ConnNutHoleDepth, ConnNutHoleWidth, VPH], anchor=LEFT+BOTTOM);

}
module VP_Half(){
  difference(){
    VP_Base();
    translate([0,ETS,0]) VP_ConnHoles();
    translate([0,VPW-ETS,0]) VP_ConnHoles();
  }

}

module VP_Full(){
  // hack to replicate holes
  intersection(){
    VP_Half();
    translate([VPD,0,0])
      mirror([1,0,0])
        VP_Half(); 
   }
}
//VP_Full();
