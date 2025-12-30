include <../disk.scad>

FanToHolderScrew="M4,10";      // Screw connecting to fan
FanToHolderScrewDepth=10;      // Depth of FanToHolderScrew
ScrewDist=105;                 // Distance between scenters of screw holes in fan
HolderPlateThick=6.75;         // Thickness of the holder
DistBetweenDisk=10;            // Distance between stacked disks
LargeFanHeight=120;            // 120mm Fan height
LargeFanDepth=25+2.5;          // 120mm Fan depth with extra for grill
LargeFanInternalScrew="M4,40"; // Screw spec for fan model - used only for tests; this should be mod for FanToHolderScrew
LargeFanInternalScrewOffset=5; // Screw offset for fan model - used only for tests;

TBScrewOffsetEdge=14;          // Distance from edge to screw hole in top/bottom plate; must not collide with FanToHolderScrew
TBToHolderScrew="M3,6";        // Screw connecting to fan
TBToHolderScrewDepth=6;        // Depth of FanToHolderScrew
TBToHolderScrewHEadOffset=0;   // Depth offset of screw head hole - may not be needed
TBThickness=2;                 // Thickness of top/bottom plate

HoldersOffset=VPD/2-VertPlateThick+DistBetweenDisk;
LargeFanScrewOffsetCen=LargeFanHeight/2-(LargeFanHeight-ScrewDist)/2;
LargeFanScrewOffsetSide=(LargeFanHeight-ScrewDist)/2;

module LargeFanScrew(){
  color("#551805")
    translate([0,LargeFanInternalScrewOffset,0])
      rotate([-90,0,0])
        screw_hole(LargeFanInternalScrew, thread=true, anchor=TOP);
}

module LargeFan(){
   difference(){
    color("#decdbb")
      translate([0,-LargeFanDepth,0])
        cuboid([LargeFanHeight,LargeFanDepth,LargeFanHeight], anchor=FRONT+TOP);
    
    translate([-LargeFanScrewOffsetCen,0,-LargeFanScrewOffsetSide]) LargeFanScrew();
    translate([+LargeFanScrewOffsetCen,0,-LargeFanScrewOffsetSide]) LargeFanScrew();
    translate([-LargeFanScrewOffsetCen,0,-LargeFanHeight+LargeFanScrewOffsetSide]) LargeFanScrew();
    translate([+LargeFanScrewOffsetCen,0,-LargeFanHeight+LargeFanScrewOffsetSide]) LargeFanScrew();  
  }
} 

// LargeFan();
