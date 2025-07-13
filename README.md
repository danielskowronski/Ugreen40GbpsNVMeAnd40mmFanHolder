# UGREEN 40Gbps M.2 NVMe Enclosure and 40mm Fan Holder - 3D Parametric Model

**Work in progress**

3D Parametric Model (OpenSCAD) of holder for [UGREEN 40Gbps M.2 NVMe Enclosure](https://web.archive.org/web/20250118234648/https://www.ugreen.com/products/ugreen-40gbps-m-2-nvme-enclosure-with-cooling-fan) and standard 40mm PC fan. 

## Objective

Main objective is keeping drive in natural position (largest plane parallel to surface) with proper airflow and adding backup/support 40mm fan next to exhaust of built-in one. The holder is designed to be either placed on top of desk/bench/shelf or attached underneath desk/bench/shelf. Additionally, it's designed to be stackable vertically (screwable) and placed horizontally (no interferences on surfaces).

3D model is designed in such a way that print should use as little material as possible, which will not limit access to ambient air. Another goal is to have print as simple and quick as possible, for example by eliminating supports.

## Project status tracker


- [x] objective, limitations and general idea described
- [x] design and layout of parts described, BOM prepared
- [x] all fixed parts measured, initial dimensions of parametric parts planned
- [ ] structure of SCAD code, base variables set, primitive initial version of top/bottom and virtual vertical plates
- [ ] sync of SCAD dimensions variables and design docs, including full explanation for each of them, replace `to be determined` in this doc
- [ ] working version of top/bottom plate - code, test print, dimensions fitting
- [ ] working version of disk plate - code, test print, dimensions fitting
- [ ] working version of fan plate - code, test print, dimensions fitting
- [ ] docs updated with images explaining complex text descriptions of 3D objects (based on prototype renders)
- [ ] assembly of all parts, testing connections and fit to external objects
- [ ] final object code improvements
- [ ] final print, finalization of print settings and materials
- [ ] photos and model publication on Printables.com

## Repository structure

1. This `README.md` contains design docs, "architecture" of 3D object, objective dimensions and part list
2. [`scad`](./scad/) directory with OpenSCAD source code that uses [BOSL2](https://github.com/BelfrySCAD/BOSL2) library:
   1. [`common.scad`](./scad/common.scad) with global dimension variables and modules for base cuboids used by top/bottom and fan/disk plates
   2. [`xy.scad`](./scad/xy.scad) with module for top/bottom plate, relevant helper variables and modules; it also renders top/bottom plate
   3. [`yz.scad`](./scad/yz.scad) with virtual vertical plate module
   4. [`fan.scad`](./scad/fan.scad) with module for fan plates, relevant helper variables and modules; it also renders fan plate
   4. [`disk.scad`](./scad/disk.scad) with module for disk plates, relevant helper variables and modules; it also renders disk plate
3. Printables.com model with parts rendered into STL, printer settings and photos of assembled holder.

---

## Design

### Intro

Holder is split into 6 parts, but there are only 3 different sub-objects and each appears twice:

1. top/bottom plate (XY plane)  
2. fan holder plate (YZ plane)
3. disk holder plate (YZ plane)

Each part type will be described as it lies flat on the print bed. This means that top/bottom plate stays laying on XY plane as when assembled, but fan and disk plates are rotated - assembled YZ plane becomes XY plane when printed and described.

When looking from XZ side of the assembled holder, there are the following objects parallel to the Z axis:

1. first fan plate
2. fan itself
3. second fan plate
4. free space between fan and disk
5. YZ front side of disk (with air outlet) starts
6. first part of disk before first disk plate
7. first disk plate; distance between 2nd fan plate and 1st disk plate is sum of 4th, 5th and 6th elements here
8. central part of the disk between 1st and 2nd disk plate (approx 67mm, but this is auto-calculated)
9. second disk plate (3mm)
10. final part of the disk, ending with YZ back side of enclosure with air inlet and Thunderbolt connector (very likely equal to 6th element)

Disk plates are not aligned with edges of the enclosure to provide safe tolerations and ensure the disk does not fall off them. 

This means that in current design, part of the disk hangs outside the holder. Rejected alternatives are:

1. extending length of top/bottom plates only, but this provides no benefits, and it's unclear if extension should cover enclosure body with or without Thunderbolt cable
2. extending length of top/bottom plates and adding extra disk plate on very end of holder, but this does not solve issue with cable and adds plastic that doesn't improve holder strength

Strain relief for cable is purposefully left outside the scope of this project, as cables shipped with enclosure are too short and other ones vary too much.

### Top/bottom plates

Top/bottom plates are flat cuboids with flat screw holes for perpendicularly attaching fan+disk plates and non-flat screw holes for vertical stacking. Both types are M3. Flat-head screws are used for smooth external sides, while fall-back to non-flat head is dictated by the fact this connection is made internally in stack and need to simplify model (that way top and bottom plates are identical; otherwise one plate would require conical indentation for screw head and other plate would have no extra cone as it is place for washer + nut).

Additionally, top/bottom plates are hollowed out in a way that keeps the plate rigid and keeps space for pieces of self-adhesive Velcro to allow mounting of the whole holder to a flat surface (widely available tape from TESA is 20mm wide, which also matches the depth of fan).

Height / thickness is around 3mm.

### Virtual vertical plates

Fan and disk holder plates are based of same "virtual vertical plate" model (*virtual* as in C++ virtual function). Here the base model will be described, it'll not be rendered for printing, but fan and disk plates will use it as base for adding their holes. It is also a flat cuboid, but only has 4 sets of holes. Each hole set is placed around the corner of the plate and consists of:

1. rectangular hole from top to bottom
   - place for nut matching flat-head screw holes in top/bottom plate
   - nut aligned for screw parallel to X axis
   - approximately 6mm in Y and 3mm in X
2. cylindrical hole laying on side (bottom of cylinder is on YZ)
   - place for screw matching flat-head screw holes in top/bottom plate
   - placed in a way that centre of cylinder base is centre of YZ plane of the other hole
   - diameter determined by M3 thread with some extra margins needed because no supports can be inserted for this overhang

Height / thickness is around 3mm.

### Fan plates

Fan plate has the following cutouts:

1. circular hole for airflow placed in the centre of plate, diameter around 38mm
2. 4 mounting holes for M4 screws, placed on edges of virtual 32x32mm square
3. extra cutouts on left and right side of fan hole
4. theoretical cutouts above and below fan

### Disk plates

The disk plate has the following cutouts:

1. main hole for YZ side of NVMe enclosure
   - base size is 46.1x19.1mm, but we need extra 0.1-0.4 (**to be determined**) to push enclosure without too much friction
   - on Y axis it's centred
   - on X axis, it's off-centre to properly align airflow with outlet on enclosure; this distance is **to be determined**
2. extra cutout above and below enclosure hole, one maybe non-existent if it's too close to edge
3. no extra cutouts on left/right side of enclosure hole, as there's nothing wider than enclosure hole

Additionally, it has markings from near the main hole (from both sides of hole and plate) that indicate where the bottom of the drive should be inserted. The exact position is **to be determined** based on X axis alignment requirement.

## Non-printable parts and their dimensions (Bill Of Materials)

### Fan

Standard 40x40x20mm PC fan ([example specification](https://noctua.at/en/products/fan/nf-a4x20-flx)). Extra grill is not required, inlet is protected by object layout.

Mounting holes are for M4 screws and their centres are spaced by 32mm. 

Depth is 20mm by specification, but an extra 0.65mm is required to accommodate anti-vibration material.

### Enclosure

UGREEN 40Gbps M.2 NVMe Enclosure has no official dimensions. Here it'll be used without rubber bumpers to enhance airflow.

Without tolerances, it's 46.1mm wide, 19.1mm tall and 118.2mm deep. Air outlet vent is 28.5mm wide and 4mm tall, centred vertically and placed around 1.5mm from the bottom. Air inlet and Thunderbolt connectors are placed similarly on the other side.

### Printable parts

6 individual parts in total (should be printable on one plate):

1. 2x render of `xy.scad` = top and the bottom plates
2. 2x render of `fan.scad` = 2x fan plate
3. 2x render of `disk.scad` = 2x disk plate 

It's very important to note that parts of disk plate will be touching the aluminium body of the enclosure and taking up the heat. While in theory neither UGREEN 40Gbps enclosure (especially with extra fan) or any other enclosure should externally to values around glass transition temperature of PLA (55-60°C), **it is very important to take this thermal properties of material used for disk plates into account**. One should measure temperature of enclosure without extra fan when stress-testing the disk for long period of time (e.g. 30 minutes) and compare it with specification of filament used. ABS is always safest (with enclosure externally at 100-110°C any drive would be long dead), PETG seems fine as well (it reaches glass transition at 80-85°C). Some extra idea is to use thermal insulation for parts of enclosure that touch disk plate, but then dimensions should be tweaked.

### Non-printable parts

For mounting fan to two fan plates:

1. 4x M4x30 screw, non-flat head (flat head is nicer but requires changing one of fan plates)
2. 4x M4 washer
3. 4x M4 nut

For connecting all the four plates (2x fan and 2x disk plates) to top and bottom plates:

1. 16x M3x12mm screw with flat head
2. 16x M3 nut

Optionally, for vertical stacking (between each instance):

1. 3x M3x12mm screw with non-flat head
2. 3x M3 nut
3. 3x M3 washer

Options for placing on flat surfaces:

- self-adhesive Velcro, for example 20mm wide tape from TESA, requires 2 strip pairs of length **to be determined**
- self-adhesive strips, for example 2x medium 3M Command should fit
- 4x self-adhesive rubber feet

## Assembly

While top and bottom plates are identical, here one will be elected as top.

1. Select one of top/bottom plates to be the top one
2. Screw first vertical plate to top plate - it can be any of two fan and two disk plates, but it should be easiest to start with first fan plate:
   1. insert nut into first rectangular hole (on vertical plate)
   2. while keeping nut in place by finger, align edge of vertical plate that has nut inserted and screw hole of inner side of top plate - that is one on which you can't see conical indent for screw head
   3. insert flat-head M3 screw from external side of top plate and tighten it
   4. ensure that vertical plate is parallel to shorter edge of top plate
3. Screw the second screw of first plate 
4. In a same way, attach remaining three plates (two screws per plate) in correct order
5. Align bottom plate on vertical plates in a way that screw holes align and conical indents are on outside
6. Attach bottom plate to vertical plates using eight M3 screws and nuts, repeating same procedure as for top plate
7. Insert fan between fan plates from side and align screw holes; ensure that airflow direction (that should be marked on fan itself) matches airflow direction of enclosure (inlet is near Thunderbolt connector, outlet is facing fan plates)
8. Insert four M4 screws into fan plates and fan, starting from side of object
9. Place M4 washers and nuts inside (between fan and disk plate - this may require large tweezers or long nose pliers)
10. Tighten fan screws
11. Insert NVMe enclosure without rubber bumper from the back keeping bottom of it (air outlet and Thunderbolt connector are on bottom) aligned with markings on disk plate; ensure you insert it straight so it fits both disk plates
12. Position enclosure depth, so there are a few millimetres between it and fan plate
13. Attach optional adhesives to top/bottom plate that will be touching the desk/bench/shelf
14. Connect fan and ensure it blows outside - air from around enclosure should be sucked outside
15. Connect enclosure to computer, generate some load on disk, then disconnect fan and double check that enclosure fan blows in the same direction as fan; otherwise extra fan will be fighting built-in fan and may lead to overheating

Hint: fan should be active even when disk (and host computer) is not, to cool it down after use. Use external power supply or ensure that you use always-powered USB port on computer.

---

## Known limitations

1. Airflow is very simplistic; holder was designed to add extra fan as support for built-in one and slightly pull hot air radiating from bottom surface (the one that acts as heat sink for NVMe disk); since this enclosure seems to keep temperatures within my disk ranges (although on higher end) and I don't have knowledge in fluid mechanics I'm not implementing any extra parts yet
2. As mentioned in intro to design, strain relief for Thunderbolt cable is outside of scope of this project; for non-stacked holder placed on top of a surface there shouldn't be any problems even with thick cables, but when stacking or using upside-down some self-adhesive cable guides should be used
3. There's no explicit path for fan cable, but one can use cutouts in disk plates to keep the fan connector around the disk connector
4. In current form, only fixed speed fans make sense, as there's no holder for thermal probe and fan controller in 3D object; moreover, it makes more sense to have one multichannel controller for stackable disk array than to duplicate it and incorporate in every holder
5. Fan power is outside the scope of this project, USB to 3pin / 4pin PWM fan power supplies are widely available (mind the voltage as some fans are 5V and some are 12V, but their connectors are the same)
6. This holder only ensures extra space is kept between enclosure and any adjacent objects (like desk surfaces) and adds fan for stronger airflow; it does not enhance actual heat dissipation - this could be achieved by attaching extra radiators on top and bottom surfaces of enclosure (e.g. using double-sided thermal tape), but it could require tweaking positions of disk plates
