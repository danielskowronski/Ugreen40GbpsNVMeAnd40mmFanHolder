include <xy.scad>
//include <fan.scad>

module DP_Base(){
  color("blue")
  difference(){
    VP_Full();
    
    // main disk edges
    translate([(VPD-DiskHeight-DiskPadding)/2,(VPW-DiskWidth-DiskPadding)/2,0])
    cuboid([DiskHeight+DiskPadding,DiskWidth+DiskPadding,2*VPH], anchor=LEFT+FRONT);
    
    
    
    translate([(VPD-DiskHeight+DiskPadding)/2+DiskFrameEdge,VertPlateMargin,0]) color("red") cuboid([DiskHeight+DiskPadding-DiskFrameEdge*2,DiskFrameEdge*2, VPH*2], anchor=LEFT+FRONT);
    
    translate([(VPD-DiskHeight+DiskPadding)/2+DiskFrameEdge,VPW-VertPlateMargin-DiskFrameEdge*2,0]) color("red") cuboid([DiskHeight+DiskPadding-DiskFrameEdge*2,DiskFrameEdge*2, VPH*2], anchor=LEFT+FRONT);
    
    
    translate([ConnThreadHoleLenght+ConnNutHoleDepth+ConnThreadHoleLenght,(VPW-DiskWidth-DiskPadding)/2+DiskFrameEdge,0]) color("red") cuboid([VPD-2*(ConnThreadHoleLenght+ConnNutHoleDepth+ConnThreadHoleLenght),VPW-2*((VPW-DiskWidth-DiskPadding)/2+DiskFrameEdge), VPH*2], anchor=LEFT+FRONT);
    
    translate([VertPlateMargin,HoriToVertScrewDistanceToEdge*2,0]) color("red") cuboid([VPD-2*VertPlateMargin,VPW-4*HoriToVertScrewDistanceToEdge, VPH*2], anchor=LEFT+FRONT);
    
    //translate([VPD/2,VPW/2,0]) cylinder(VPH*2, d=AirflowHoleDia, center=true); // Fan airflow
  }
    
    
  
}

//color("pink") DP_Base();