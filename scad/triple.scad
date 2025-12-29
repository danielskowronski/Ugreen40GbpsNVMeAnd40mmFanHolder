include <disk.scad>

FanToHolderScrew="M4,10"; // Screw connecting to fan
FanToHolderScrewDepth=10; // Depth of FanToHolderScrew
ScrewDist=105;            // Distance between scenters of screw holes in fan
HolderPlateThick=6.75;    // Thickness of the holder
DistBetweenDisk=10;       // Distance between stacked disks
Height=120;               // Fan height

HoldersOffset=VPD/2-VertPlateThick+DistBetweenDisk;
ScrewOffsetCen=Height/2-(Height-ScrewDist)/2;

module TH_Disks(){
  difference(){
    cuboid([Height, VPW, HolderPlateThick], anchor=FRONT+BOTTOM);
    translate([-VPD/2,0,0]) union(){
      translate([-HoldersOffset,0,0]) disk_all_holes();
      color("yellow") disk_all_holes();
      translate([HoldersOffset,0,0]) disk_all_holes();
    }
    translate([+ScrewOffsetCen,0,HolderPlateThick/2])   rotate([-90,0,0]){ screw_hole(FanToHolderScrew, thread=true, anchor=BOTTOM); }
    translate([-ScrewOffsetCen,0,HolderPlateThick/2])   rotate([-90,0,0]){ screw_hole(FanToHolderScrew, thread=true, anchor=BOTTOM); }
    
    translate([+ScrewOffsetCen,VPW,HolderPlateThick/2]) rotate([-90,0,0]){ screw_hole(FanToHolderScrew, thread=true, anchor=TOP); }
    translate([-ScrewOffsetCen,VPW,HolderPlateThick/2]) rotate([-90,0,0]){ screw_hole(FanToHolderScrew, thread=true, anchor=TOP); }
  }
}

TH_Disks(); 