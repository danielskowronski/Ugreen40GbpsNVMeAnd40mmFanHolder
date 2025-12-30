include <common.scad> 

render_element=true;

module TB_ScrewHole(){
  color("darkgreen")
    screw_hole(TBToHolderScrew, head="flat", thread=true, anchor="top");
}

module TH_TB(){
  difference(){
    color("lightgreen")
      translate([0,-LargeFanDepth,0])
        cuboid([LargeFanHeight,LargeFanDepth+VPW,TBThickness], anchor=FRONT+BOTTOM);
    // screws for attaching triple disk plate to top/bottom
    translate([0,0,TBThickness+TBToHolderScrewHEadOffset]){
      translate([+LargeFanHeight/2-LargeFanScrewOffsetSide,TBScrewOffsetEdge,0])     TB_ScrewHole();
      translate([+LargeFanHeight/2-LargeFanScrewOffsetSide,VPW-TBScrewOffsetEdge,0]) TB_ScrewHole();
      translate([-LargeFanHeight/2+LargeFanScrewOffsetSide,TBScrewOffsetEdge,0])     TB_ScrewHole();
      translate([-LargeFanHeight/2+LargeFanScrewOffsetSide,VPW-TBScrewOffsetEdge,0]) TB_ScrewHole();
    }
  }
}

if (render_element) TH_TB();
