include <xy.scad>
//include <fan.scad>

module DP_Base(){
  color("blue")
  difference(){
    VP_Full();
    
    // TODO: for now it's fixed in center - probably not ideal
    translate([(VPD-DiskHeight-DiskPadding)/2,(VPW-DiskWidth-DiskPadding)/2,0])
    cuboid([DiskHeight+DiskPadding,DiskWidth+DiskPadding,2*VPH], anchor=LEFT+FRONT);
    
  }
}


//color("pink") DP_Base();