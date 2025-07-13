include <yz.scad>
include <fan.scad>
include <disk.scad>

HP_Hollowed();

translate([HPD-VPH,0,0]) rotate([0,90,0]) FP_Base();
translate([HPD-VPH-FanDepthBase-FanDepthExtra-VPH,0,0]) rotate([0,90,0]) FP_Base();



translate([0,0,0]) rotate([0,90,0]) DP_Base();
translate([DiskHangingMiddle+VPH,0,0]) rotate([0,90,0]) DP_Base();


translate([0,0,-VPD]) mirror([0,0,1])  HP_Hollowed();
