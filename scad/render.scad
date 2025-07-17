include <horizontal.scad>
include <fan.scad>
include <disk.scad>

module all() {

  HP_Hollowed();

  translate([HPD-VPH,0,0]) rotate([0,90,0]) FP_Base();
  translate([HPD-VPH-FanDepthBase-FanDepthExtra-VPH,0,0]) rotate([0,90,0]) FP_Base();



  translate([0,0,0]) rotate([0,90,0]) DP_Base();
  translate([DiskHangingMiddle+VPH,0,0]) rotate([0,90,0]) DP_Base();


  translate([0,0,-VPD]) mirror([0,0,1])  HP_Hollowed();
}




/*

settings for rendering - global

- aspect: 2560x1440 px locked
- translation: 70,20,-40
- rotation: 30,0,120
- dist: 500
- fov: 20

*/


/* render-full-top.png */
all();


/* render-full-side.png

- rotation: 75 ,0,150

*/
//all();

/* render-top.png */
//HP_Hollowed();

/* render-fan.png 

- translation: 0,20,-40
- distance: 300

*/
//FP_Base();


/* render-disk.png 

- translation: 0,20,-40
- distance: 300

*/
//DP_Base();
