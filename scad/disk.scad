include <vertical.scad>

module DP_Airflow_Side(){
  cuboid([DiskHeight+DiskPadding-DiskFrameEdge*2,DiskFrameEdge*2, VPH*2], anchor=LEFT+FRONT);
}

MarginToHolesX=ConnThreadHoleLenght+ConnNutHoleDepth+ConnThreadHoleLenght; // similar to VertPlateMargin but including HoriToVertScrew
MarginToDiskY=(VPW-DiskWidth-DiskPadding)/2; // width between edge of plate and disk sides (left/right) 

module disk_edges(vpd=VPD){
  // main disk edges
  translate([(vpd-DiskHeight-DiskPadding)/2,MarginToDiskY,0]){
    cuboid([DiskHeight+DiskPadding,DiskWidth+DiskPadding,2*VPH], anchor=LEFT+FRONT);
  }
}
module airflow_holes_sides(){
  // holes for airflow between disk and left/right edges of frame
  translate([(VPD-DiskHeight+DiskPadding)/2+DiskFrameEdge,0,0]){
    // left 
    translate([0,VertPlateMargin,0])  DP_Airflow_Side();
    
    // right
    translate([0,VPW-VertPlateMargin-DiskFrameEdge*2,0]) DP_Airflow_Side();
  }
}
module airflow_hole_vert_widest(){
  // hole for airflow above and below disk - widest one, squezed under and abobe HoriToVertScrew 
  translate([MarginToHolesX,MarginToDiskY+DiskFrameEdge,0]) {
    cuboid([VPD-2*(MarginToHolesX),VPW-2*(MarginToDiskY+DiskFrameEdge), VPH*2], anchor=LEFT+FRONT);
  }
}
module airflow_hole_vert_tallest(){
  // hole for airflow above and below disk - highest one, between left and right HoriToVertScrew
  translate([VertPlateMargin,HoriToVertScrewDistanceToEdge*2,0]) {
    cuboid([VPD-2*VertPlateMargin,VPW-4*HoriToVertScrewDistanceToEdge, VPH*2], anchor=LEFT+FRONT);
  }
}
module disk_all_holes(){
  union(){
    disk_edges();
    
    airflow_holes_sides();
    
    airflow_hole_vert_widest();
    
    airflow_hole_vert_tallest();
  }
}


module DP_Base(){
  color("lightblue")
  difference(){
    // TODO: everything here would benefit in readability from CENTER achoring
    VP_Full();
    disk_all_holes();
  }
}

// DP_Base();