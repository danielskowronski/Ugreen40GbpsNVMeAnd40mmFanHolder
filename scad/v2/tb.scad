include <common.scad> 

render_element=true;

d=LargeFanDepth+VPW;
w=LargeFanHeight;
t=TBThickness;

module TH_TB(){
  difference(){
    color("lightgreen") translate([0,-LargeFanDepth,0]) cuboid([w,d,t], anchor=FRONT+BOTTOM);
    // screws for attaching triple disk plate to top/bottom
    color("darkgreen") translate([0,0,TBThickness+TBToHolderScrewHEadOffset]){
      translate([+LargeFanHeight/2-LargeFanScrewOffsetSide,TBScrewOffsetEdge,0])     screw_hole(TBToHolderScrew, head="flat", thread=true, anchor="top");
      translate([+LargeFanHeight/2-LargeFanScrewOffsetSide,VPW-TBScrewOffsetEdge,0]) screw_hole(TBToHolderScrew, head="flat", thread=true, anchor="top");
      translate([-LargeFanHeight/2+LargeFanScrewOffsetSide,TBScrewOffsetEdge,0])     screw_hole(TBToHolderScrew, head="flat", thread=true, anchor="top");
      translate([-LargeFanHeight/2+LargeFanScrewOffsetSide,VPW-TBScrewOffsetEdge,0]) screw_hole(TBToHolderScrew, head="flat", thread=true, anchor="top");
    }
  }
}

if (render_element) TH_TB();
