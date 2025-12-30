include <tb.scad>
include <triple.scad>

render_element=false;

// top
TH_TB();

// right
translate([-LargeFanHeight/2+LargeFanScrewOffsetSide-HolderPlateThick/2,0,-LargeFanHeight/2]) rotate([0,90,0]) TH_Disks();

// left
translate([+LargeFanHeight/2-LargeFanScrewOffsetSide-HolderPlateThick/2,0,-LargeFanHeight/2]) rotate([0,90,0]) TH_Disks();

// fan (back)
LargeFan();

// bottom
translate([0,0,-LargeFanHeight]) rotate([0,180,0]) TH_TB();
