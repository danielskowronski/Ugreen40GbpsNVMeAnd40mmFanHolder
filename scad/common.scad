include <BOSL2/std.scad>
include <BOSL2/screws.scad>
$fn=32;

// Objective Dimensiosns - Fan
FanWidth=40;         // Width of the fan
FanHeight=40;        // Height of the fan
FanScrewDist=32;     // Distance between fan screws
FanScrewDia=4.0;     // Diameter of fan screws
FanDepthBase=20;     // Thickness of fan - base
FanDepthExtra=0.65;  // Extra thickness of antivibration material

// Objective Dimensiosns - Disk enclosure (withour rubber bumper)
DiskWidth=46.1;      // Width of the disk enclosure
DiskHeight=19.1;     // Height of the disk enclosure
DiskDepth=118.2;     // Depth/length of the disk enclosure

// Objective Dimensions - Other
TapeWidth=20;        // Width of adhesive tape to keep safe margins

// Parametric Dimensions
FanHoleDia=38;        // Hole for airflow // TODO: validate
DiskPadding=0.2;      // Extra margins for the disk enclosure to fit in the holder // TODO: validate
VertPlateMargin=3.0;  // Minimum amount of solid material between holes and edges of fan/disk (vertical) plate
HoriPlateThick=3.0;   // Thickness of the top/bottom (horizontal) plate
VertPlateThick=6.75;   // Thickness of the fan/disk (vertical) plate // TODO: for now it's extra thick to accomodate M3 screw head
FanToDiskMargin=5;    // Extra space between fan and disk enclosure // TODO: validate
DiskHangingMargin=10; // Distance fron ensosure edge to disk plate edge (to ensure disk does not fall off the plate)
HoriToVertScrew="M3,12"; // Screw connecting horizontal and vertical plates
HoriToVertScrewDistanceToEdge=VertPlateMargin+3; // Distnace from edge of horizontal plate to center of screw

ConnNutHoleWidth=6;
ConnNutHoleDepth=3;
ConnThreadHoleLenght=3;

// Core structural dimensions - autocalculated, described in context of assembled holder
DiskHangingMiddle=DiskDepth-2*(DiskHangingMargin+VertPlateThick);               // Length of disk between both disk plates
VPW=max(DiskWidth, FanWidth)  +2*HoriToVertScrewDistanceToEdge;                               // Width of the vertical plate
VPD=max(DiskHeight, FanHeight)+2*HoriToVertScrewDistanceToEdge;                               // Height of the vertical plate
VPH=VertPlateThick;                                                             // Height of the vertical plate
HPW=VPW;                                                                        // Width of the horizontal plate
HPH=HoriPlateThick;                                                             // Height of the horizontal plate
HPD=
  VPH+                     // 1st fan plate
  FanDepthBase+            // Fan depth
  FanDepthExtra+           // Extra antivibration material
  VPH+                     // 2nd fan plate
  FanToDiskMargin+         // Extra space between fan and disk enclosure
  DiskHangingMargin+       // Distance from enclosure edge to disk plate edge
  VPH+                     // 1st disk plate
  DiskHangingMiddle+       // Length of disk between both disk plates
  VPH+                     // 2nd disk plate
  0;                       // No extra space at the end

module HP_Base() {
  cuboid([HPD, HPW, HPH], anchor=LEFT+FRONT+BOTTOM);
}
module VP_Base(){
  cuboid([VPD, VPW, VPH], anchor=LEFT+FRONT+BOTTOM);
}
module HVP_Screw(){
  screw_hole(HoriToVertScrew, head="flat", anchor=TOP);
}
