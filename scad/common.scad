include <BOSL2/std.scad>
include <BOSL2/screws.scad>
$fn=32;

// Objective Dimensions - Fan
FanWidth=40;         // Width of the fan; docs -> BOM.md#fan
FanHeight=40;        // Height of the fan; docs -> BOM.md#fan
FanScrewDist=32;     // Distance between fan screws; docs -> BOM.md#fan
FanScrewDia=4.0;     // Diameter of fan screws; docs -> BOM.md#fan
FanDepthBase=20;     // Thickness of fan - base; docs -> BOM.md#fan
FanDepthExtra=0.65;  // Extra thickness of antivibration material; docs -> BOM.md#fan
FanHoleDia=38;        // Hole for airflow; docs -> BOM.md#fan

// Objective Dimensions - Disk enclosure (withour rubber bumper)
DiskWidth=46.1;      // Width of the disk enclosure; docs -> BOM.md#enclosure
DiskHeight=19.1;     // Height of the disk enclosure; docs -> BOM.md#enclosure
DiskDepth=118.2;     // Depth/length of the disk enclosure; docs -> BOM.md#enclosure

// Objective Dimensions - Other
TapeWidth=20;        // Width of adhesive tape to keep safe margins; docs -> BOM.md#non-printable-parts

// Parametric Dimensions
DiskPadding=0.2;         // Extra margins for the disk enclosure to fit in the holder; docs -> DESIGN.md#disk-plates
VertPlateMargin=3.0;     // Minimum amount of solid material between holes and edges of fan/disk (vertical) plate; docs -> DESIGN.md#virtual-vertical-plates
HoriPlateThick=3.0;      // Thickness of the top/bottom (horizontal) plate; docs -> DESIGN.md#topbottom-plates
VertPlateThick=6.75;     // Thickness of the fan/disk (vertical) plate; docs -> DESIGN.md#virtual-vertical-plates
FanToDiskMargin=5;       // Extra space between fan and disk enclosure; docs -> DESIGN.md#intro
DiskHangingMargin=10;    // Distance fron ensosure edge to disk plate edge (to ensure disk does not fall off the plate); docs -> DESIGN.md#intro
HoriToVertScrew="M3,10"; // Screw connecting horizontal and vertical plates; docs -> DESIGN.md#intro and DESIGN.md#virtual-vertical-plates
DiskFrameEdge=2;         // how long should be supports for disk (v0.1.0 would be DiskWidth+DiskPadding) ;docs -> DESIGN.md#disk-plates
ConnNutHoleWidth=6;      // vertical plate nut hole width; docs -> DESIGN.md#virtual-vertical-plates
ConnNutHoleDepth=3;      // vertical plate nut hole depth; docs -> DESIGN.md#virtual-vertical-plates

// Core structural dimensions - autocalculated, described in context of assembled holder
ConnThreadHoleLenght=VertPlateMargin;                                           // This controls nut hole, it shouldn't break minimum distance between edges of the plate and holes; just alias
HoriToVertScrewDistanceToEdge=VertPlateMargin+3;                                // Distnace from edge of horizontal plate to center of screw; just alias
DiskHangingMiddle=DiskDepth-2*(DiskHangingMargin+VertPlateThick);               // Length of disk between both disk plates; docs -> DESIGN.md#intro
VPW=max(DiskWidth, FanWidth)  +2*HoriToVertScrewDistanceToEdge;                 // Width of the vertical plate; docs -> DESIGN.md#virtual-vertical-plates
VPD=max(DiskHeight, FanHeight)+2*HoriToVertScrewDistanceToEdge;                 // Height of the vertical plate; docs -> DESIGN.md#virtual-vertical-plates
VPH=VertPlateThick;                                                             // Height of the vertical plate; docs -> DESIGN.md#virtual-vertical-plates
HPW=VPW;                                                                        // Width of the horizontal plate; docs -> DESIGN.md#topbottom-plates
HPH=HoriPlateThick;                                                             // Height of the horizontal plate; docs -> DESIGN.md#topbottom-plates
HPD=                                                                            // Depth of the horizontal plate; docs -> DESIGN.md#topbottom-plates
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
