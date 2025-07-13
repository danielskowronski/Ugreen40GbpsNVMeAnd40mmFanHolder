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
- [x] structure of SCAD code, base variables set, primitive initial version of top/bottom and virtual vertical plates
- [ ] sync of SCAD dimensions variables and design docs, including full explanation for each of them, replace `to be determined` in this doc
- [.] working version of top/bottom plate - code, test print, dimensions fitting
- [.] working version of disk plate - code, test print, dimensions fitting
- [.] working version of fan plate - code, test print, dimensions fitting
- [ ] docs updated with images explaining complex text descriptions of 3D objects (based on prototype renders)
- [ ] assembly of all parts, testing connections and fit to external objects
- [ ] final object code improvements
- [ ] final print, finalization of print settings and materials
- [ ] photos and model publication on Printables.com

## Repository structure

1. Documentation:
   1. [Design](./docs/DESIGN.md) - introduction to general "architecture" and description of parts, known limitations
   2. [BOM](./docs/BOM.md) - printable and non-printable parts with their dimensions (Bill Of Materials)
   3. [Printing and assembly](./docs/ASSEMBLY.md)
2. [`scad`](./scad/) directory with OpenSCAD source code that uses [BOSL2](https://github.com/BelfrySCAD/BOSL2) library:
   1. [`common.scad`](./scad/common.scad) with global dimension variables and modules for base cuboids used by top/bottom and fan/disk plates
   2. [`xy.scad`](./scad/xy.scad) with module for top/bottom plate, relevant helper variables and modules; it also renders top/bottom plate
   3. [`yz.scad`](./scad/yz.scad) with virtual vertical plate module
   4. [`fan.scad`](./scad/fan.scad) with module for fan plates, relevant helper variables and modules; it also renders fan plate
   5. [`disk.scad`](./scad/disk.scad) with module for disk plates, relevant helper variables and modules; it also renders disk plate
3. Printables.com model with parts rendered into STL, printer settings and photos of assembled holder.
