include <../disk.scad>

FanToHolderScrew="M4,10"; // Screw connecting to fan
FanToHolderScrewDepth=10; // Depth of FanToHolderScrew
ScrewDist=105;            // Distance between scenters of screw holes in fan
HolderPlateThick=6.75;    // Thickness of the holder
DistBetweenDisk=10;       // Distance between stacked disks
LargeFanHeight=120;       // 120mm Fan height
LargeFanDepth=25+2.5;     // 120mm Fan depth with extra for grill

TBScrewOffsetEdge=14;
TBToHolderScrew="M3,6";   // Screw connecting to fan
TBToHolderScrewDepth=6;   // Depth of FanToHolderScrew
TBToHolderScrewHEadOffset=0.5;
TBThickness=2;

HoldersOffset=VPD/2-VertPlateThick+DistBetweenDisk;
LargeFanScrewOffsetCen=LargeFanHeight/2-(LargeFanHeight-ScrewDist)/2;
LargeFanScrewOffsetSide=(LargeFanHeight-ScrewDist)/2;

module LargeFan(){
   difference(){
    color("#decdbb")
      translate([0,-LargeFanDepth,0]) cuboid([LargeFanHeight,LargeFanDepth,LargeFanHeight], anchor=FRONT+TOP);
    color("#551805"){
      translate([-LargeFanScrewOffsetCen,5,-LargeFanScrewOffsetSide]) rotate([-90,0,0]){ screw_hole("M4,40", thread=true, anchor=TOP); }
      translate([+LargeFanScrewOffsetCen,5,-LargeFanScrewOffsetSide]) rotate([-90,0,0]){ screw_hole("M4,40", thread=true, anchor=TOP); }
      translate([-LargeFanScrewOffsetCen,5,-LargeFanHeight+LargeFanScrewOffsetSide]) rotate([-90,0,0]){ screw_hole("M4,40", thread=true, anchor=TOP); }
      translate([+LargeFanScrewOffsetCen,5,-LargeFanHeight+LargeFanScrewOffsetSide]) rotate([-90,0,0]){ screw_hole("M4,40", thread=true, anchor=TOP); }
    }
  }
} 

// LargeFan();
