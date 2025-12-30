include <tb.scad>
include <triple.scad>

render_element=false;

TH_TB();
translate([-w/2+LargeFanScrewOffsetSide-HolderPlateThick/2,0,-LargeFanHeight/2]) rotate([0,90,0]) TH_Disks();
translate([+w/2-LargeFanScrewOffsetSide-HolderPlateThick/2,0,-LargeFanHeight/2]) rotate([0,90,0]) TH_Disks();
LargeFan();
translate([0,0,-LargeFanHeight]) rotate([0,180,0]) TH_TB();
