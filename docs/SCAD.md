# SCAD code

## Files

### [`common.scad`](./scad/common.scad)

- global dimension variables (all referenced to docs)

### [`horizontal.scad`](./scad/horizontal.scad) 

-> [DESIGN.md - Top/Bottom Plates](./DESIGN.md#topbottom-plates)

- `HP_Base` - module which is a simple cuboid with desired size
- `HVP_Screw` - define screw hole for flat-head M3 connecting vertical and horizontal plates
- `HP_ScrewPair` - define screw pair for each vertical plate, used to simplify translations
- `HP_Full` - base cuboid with subtracted horizontal/vertical screws and extra stacking screws
- `HP_Hollowed`
  - `HP_Full` with extra hole for extra airflow and saving material
  - this is the module to be rendered into 3D print


### [`vertical.scad`](./scad/vertical.scad)

-> [DESIGN.md - Virtual Vertical Plates](./DESIGN.md#virtual-vertical-plates)

- `VP_Base` - module which is a simple cuboid with desired size
- `VP_ConnHoles` - define positive horizontal/vertical connection holes (nut hole and cylinder for screw thread)
- `VP_Half` - full plate with only top connection holes subtracted
- `VP_Full` 
  - magic intersection of two `VP_Half` mirrored, hack not to rotate and translate `VP_ConnHoles`
  - this is the module used in `disk.scad` and `fan.scad`

### [`fan.scad`](./scad/fan.scad) 

-> [DESIGN.md - Fan Plates](./DESIGN.md#fan-plates)

- `FanScrewHole` - module generating screw holes for attaching fan, M4
- `FP_Base`
  - `VP_Base` with screw holes for fan and main airflow hole removed
  - this is the module to be rendered into 3D print

### [`disk.scad`](./scad/disk.scad) 

-> [DESIGN.md - Disk Plates](./DESIGN.md#disk-plates)

- `DP_Airflow_Side` - module for airflow holes from left/right side of disk enclosure 
- `DP_Base`
  - `VP_Base`with main disk hole and all extra airflow holes (including 2x `DP_Airflow_Side`) removed
  - this is the module to be rendered into 3D print

### [`render.scad`](./scad/render.scad) 

- code to render images for this documentation (ViewPort settings included) and STL files
- simple comment/uncomment is needed to select which object to render
