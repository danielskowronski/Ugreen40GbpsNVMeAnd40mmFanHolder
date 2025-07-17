# Printable and non-printable parts with their dimensions (Bill Of Materials)

## Fan

Standard 40x40x20mm PC fan ([example specification](https://noctua.at/en/products/fan/nf-a4x20-flx)). Size in code is `FanWidth`x`FanHeight`x`FanDepthBase` Extra grill is not required, inlet is protected by object layout.

Mounting holes are for M4 (`FanScrewDia`) screws and their centres are spaced by 32mm (`FanScrewDist`). 

Depth is 20mm (`FanDepthBase`) by specification, but an extra 0.65mm (`FanDepthExtra`) is required to accommodate anti-vibration material.

Diameter of fan airflow (blades) is 38mm (`FanHoleDia`).

## Enclosure

UGREEN 40Gbps M.2 NVMe Enclosure has no official dimensions. Here it'll be used without rubber bumpers to enhance airflow.

Without tolerances, it's 46.1mm wide (`DiskWidth`), 19.1mm tall (`DiskHeight`) and 118.2mm deep (`DiskDepth`). 

Air outlet vent is 28.5mm wide and 4mm tall, centred vertically and placed around 1.5mm from the bottom. Air inlet and Thunderbolt connectors are placed similarly on the other side. This is irrelevant to the current version of holder.

## Printable parts

6 individual parts in total (should be printable on one plate):

1. 2x render of `xy.scad` = top and the bottom plates
2. 2x render of `fan.scad` = 2x fan plate
3. 2x render of `disk.scad` = 2x disk plate 

See [MATERIAL.md](./MATERIAL.md) for important note related to material used.

## Non-printable parts

For mounting fan to two fan plates:

1. 4x M4x38 or M4x40 screw, non-flat head (flat head is nicer but requires changing one of fan plates)
2. 4x M4 nut

For connecting all the four plates (2x fan and 2x disk plates) to top and bottom plates:

1. 16x M3x8 or M3x10 screw with flat head
2. 16x M3 nut

Optionally, for vertical stacking (between each instance):

1. 3x M3x12mm screw with non-flat head
2. 3x M3 nut
3. 6x M3 washer

Options for placing on flat surfaces:

- self-adhesive Velcro, for example 20mm (`TapeWidth`) wide tape from TESA, requires 2 strip pairs 57mm in length (`VPW`)
- self-adhesive strips, for example 2x medium 3M Command should fit
- 4x self-adhesive rubber feet

Optionally:

- Kapton tape to wrap around enclosure on contact point to make it sit tightly
