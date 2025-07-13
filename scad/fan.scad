include <xy.scad>

module FanScrewHole(){
  translate([VPD/2,VPW/2,0])
    cylinder(VPH*2, d=FanScrewDia, center=true);
}

module FP_Base(){
  color("green")
  difference(){
    VP_Full();
    
    translate([-FanScrewDist/2, -FanScrewDist/2, 0]) FanScrewHole(); // Fan screw - top-left
    translate([-FanScrewDist/2, +FanScrewDist/2, 0]) FanScrewHole(); // Fan screw - top-right
    translate([+FanScrewDist/2, -FanScrewDist/2, 0]) FanScrewHole(); // Fan screw - bottom-left
    translate([+FanScrewDist/2, +FanScrewDist/2, 0]) FanScrewHole(); // Fan screw - bottom-right
    
    translate([VPD/2,VPW/2,0]) cylinder(VPH*2, d=FanHoleDia, center=true); // Fan airflow
  }
}

// no space to hollow more

//FP_Base();