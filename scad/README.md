# SCAD conventions

## Common/Base

when describing part dimensions, always referring to them laying flat on print bed: 

- H = height is Z dimension
- W = width is Y dimension
- D = depth is X dimension

keeping width of part as width of assembled object is preferred (TODO: explain rotation)

when referencing plate height in context of assembled object it may be described as thickness

part short names (derived from assembled object):

- HP - Horizontal Plate - top/bottom
- VP - Vertical Plate - fan/disk
  - FP - Fan Plate
  - DP - Disk Plate

`[HVFD]P[HWD]` dimension variable describes horizontal/vertical/fan/disk plate height/width/depth according to part dimensions

**work in progress**
