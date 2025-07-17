# Assembly

## Printing

My setup for printing on Creality K1C:

- *Hyper PLA-CF* -> see [MATERIAL.md](./MATERIAL.md) !!!
- 0.16mm layers
- 2 wall loops
- 10% cross-hatch in-fill
- approx 46g of filament for full holder

## Assembly instructions

### Preparation

Holes for the fan may be too tight, especially if you use 3D-printed screw (e.g. when you don't have such long screw at hand). If so, take a short metal M4 screw and screw it in, then out. A power drill may be helpful.

Useful tools:

- screwdrivers for screws
- small, flat-blade screwdriver for keeping M3 nut in place in vertical plates
- tweezers

### Steps

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
11. Insert NVMe enclosure without rubber bumper from the back: Thunderbolt connector should not face fan, but no observable differences whether it's on top or bottom (i.e. enclosure can be positioned naturally or upside-down)
12. Position enclosure depth, so there are a few millimetres between it and fan plate
13. Attach optional adhesives to top/bottom plate that will be touching the desk/bench/shelf
14. Connect fan and ensure it blows outside - air from around enclosure should be sucked outside
15. Connect enclosure to computer, generate some load on disk, then disconnect fan and double check that enclosure fan blows in the same direction as fan; otherwise extra fan will be fighting built-in fan and may lead to overheating

Hint: fan should be active even when disk (and host computer) is not, to cool it down after use. Use external power supply or ensure that you use always-powered USB port on computer.

Alternatively, fan-related parts can be assembled first: 

1. Hold in place: fan plate - fan - fan plate 
2. Screw using M4 screws and nut
3. Attach to top and then bottom plate like you'd work with individual fan plates
