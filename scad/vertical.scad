include <common.scad>


ETS=HoriToVertScrewDistanceToEdge; // Edge to Screw center

module VP_Base(){
  cuboid([VPD, VPW, VPH], anchor=LEFT+FRONT+BOTTOM);
}
module VP_ConnHoles(){
  translate([ConnThreadHoleLenght,0,VPH/2])
    rotate([0,-90,0]){
      screw_hole(HoriToVertScrew, anchor=BOTTOM);
    }

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
  // trick to render full plate without rotating individual screw holes, see note in SCAD.md#vertical.scad
  intersection(){
    VP_Half();
    translate([VPD,0,0])
      mirror([1,0,0])
        VP_Half(); 
   }
}
//VP_Full();
