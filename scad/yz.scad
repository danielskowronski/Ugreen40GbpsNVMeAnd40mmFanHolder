include <common.scad>

ETS=HoriToVertScrewDistanceToEdge; // Edge to Screw center

module HP_ScrewPair(distToBack){

      translate([distToBack,0,0]){ 
        translate([0,ETS,0]) HVP_Screw();
        translate([0,HPW-ETS,0]) HVP_Screw();
      }
}

module HP_Full(){
  difference(){
    HP_Base();
    
    // connections to vertical plates
    translate([0,0,HPH]){
      distTo2ndDiskPlate=VPH/2;
      HP_ScrewPair(distTo2ndDiskPlate); // 2nd disk plate
      
      distTo1stDiskPlate=distTo2ndDiskPlate+VPH+DiskHangingMiddle;
      HP_ScrewPair(distTo1stDiskPlate); // 1st disk plate
      
      distTo2ndFanPlate=distTo1stDiskPlate+VPH+DiskHangingMargin+FanToDiskMargin;
      HP_ScrewPair(distTo2ndFanPlate); // 2nd fan plate
      
      distTo1stFanPlate=distTo2ndFanPlate+VPH+FanDepthBase+FanDepthExtra;
      HP_ScrewPair(distTo1stFanPlate); // 1st fan plate
    }
    
    // connections to stackable module
    translate([0,HPW/2,HPH*2]){
      translate([VPH+ETS,0,0]) HVP_Screw(); // 1st stacking screw
      translate([HPD-ETS-2*VPH-FanDepthBase-FanDepthExtra,0,0]) HVP_Screw(); // 2nd stacking screw
      translate([HPD-ETS-VPH,0,0]) HVP_Screw(); // 3rd stacking screw
    }
  }
}
module HP_Hollowed(){
  difference(){
    HP_Full();
    translate([TapeWidth, 1*ETS, 0]) cuboid([DiskHangingMiddle-TapeWidth, HPW-2*ETS, 2*HPH], anchor=LEFT+FRONT);
  }
}

//HP_Hollowed();
