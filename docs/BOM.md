# Printable and non-printable parts with their dimensions (Bill Of Materials)

## Fan

Standard 40x40x20mm PC fan ([example specification](https://noctua.at/en/products/fan/nf-a4x20-flx)). Extra grill is not required, inlet is protected by object layout.

Mounting holes are for M4 screws and their centres are spaced by 32mm. 

Depth is 20mm by specification, but an extra 0.65mm is required to accommodate anti-vibration material.

## Enclosure

UGREEN 40Gbps M.2 NVMe Enclosure has no official dimensions. Here it'll be used without rubber bumpers to enhance airflow.

Without tolerances, it's 46.1mm wide, 19.1mm tall and 118.2mm deep. Air outlet vent is 28.5mm wide and 4mm tall, centred vertically and placed around 1.5mm from the bottom. Air inlet and Thunderbolt connectors are placed similarly on the other side.

## Printable parts

6 individual parts in total (should be printable on one plate):

1. 2x render of `xy.scad` = top and the bottom plates
2. 2x render of `fan.scad` = 2x fan plate
3. 2x render of `disk.scad` = 2x disk plate 

It's very important to note that parts of disk plate will be touching the aluminium body of the enclosure and taking up the heat. While in theory neither UGREEN 40Gbps enclosure (especially with extra fan) or any other enclosure should externally to values around glass transition temperature of PLA (55-60°C), **it is very important to take this thermal properties of material used for disk plates into account**. One should measure temperature of enclosure without extra fan when stress-testing the disk for long period of time (e.g. 30 minutes) and compare it with specification of filament used. ABS is always safest (with enclosure externally at 100-110°C any drive would be long dead), PETG seems fine as well (it reaches glass transition at 80-85°C). Some extra idea is to use thermal insulation for parts of enclosure that touch disk plate, but then dimensions should be tweaked.

## Non-printable parts

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
  