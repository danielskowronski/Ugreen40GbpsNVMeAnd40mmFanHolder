include <common.scad>

render_element=true;

module TH_Disks(){
  difference(){
    color("lightblue") cuboid([LargeFanHeight, VPW, HolderPlateThick], anchor=FRONT+BOTTOM);
    translate([-VPD/2,0,0]) union(){
      translate([-HoldersOffset,0,0]) disk_all_holes();
      color("yellow") disk_all_holes();
      translate([HoldersOffset,0,0]) disk_all_holes();
    }
    
    // screws for attaching triple disk plate to fan
    color("brown"){
      translate([+LargeFanScrewOffsetCen,0,HolderPlateThick/2])   rotate([-90,0,0]){ screw_hole(FanToHolderScrew, thread=true, anchor=BOTTOM); }
      translate([-LargeFanScrewOffsetCen,0,HolderPlateThick/2])   rotate([-90,0,0]){ screw_hole(FanToHolderScrew, thread=true, anchor=BOTTOM); }
      translate([+LargeFanScrewOffsetCen,VPW,HolderPlateThick/2]) rotate([-90,0,0]){ screw_hole(FanToHolderScrew, thread=true, anchor=TOP); }
      translate([-LargeFanScrewOffsetCen,VPW,HolderPlateThick/2]) rotate([-90,0,0]){ screw_hole(FanToHolderScrew, thread=true, anchor=TOP); }
    }
    
    // screws for attaching triple disk plate to top/bottom
    color("teal"){
      translate([+LargeFanHeight/2,TBScrewOffsetEdge,HolderPlateThick/2])     rotate([0,-90,0]){ screw_hole(TBToHolderScrew, thread=true, anchor=BOTTOM); }
      translate([+LargeFanHeight/2,VPW-TBScrewOffsetEdge,HolderPlateThick/2]) rotate([0,-90,0]){ screw_hole(TBToHolderScrew, thread=true, anchor=BOTTOM); }
      translate([-LargeFanHeight/2,TBScrewOffsetEdge,HolderPlateThick/2])     rotate([0,-90,0]){ screw_hole(TBToHolderScrew, thread=true, anchor=TOP); }
      translate([-LargeFanHeight/2,VPW-TBScrewOffsetEdge,HolderPlateThick/2]) rotate([0,-90,0]){ screw_hole(TBToHolderScrew, thread=true, anchor=TOP); }
    }
  }
}

if (render_element) TH_Disks();
