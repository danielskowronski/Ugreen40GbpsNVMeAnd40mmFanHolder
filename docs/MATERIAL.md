# Important notes on material (filament)

## Filament type

It's very important to note that parts of disk plate will be touching the aluminium body of the enclosure and taking up the heat. 

While in theory neither UGREEN 40Gbps enclosure (especially with extra fan) or any other enclosure should externally to values around glass transition temperature of PLA (55-60°C), **it is critical to take this thermal properties of material used for disk plates into account**. 

One should measure temperature of enclosure without extra fan when stress-testing the disk for long period of time (e.g. 30 minutes) and compare it with specification of filament used, most notably **glass transition temperature**.

ABS is always safest (with enclosure externally at 100-110°C any drive would be long dead), PETG seems fine as well (it reaches glass transition at 80-85°C). Some extra idea is to use thermal insulation for parts of enclosure that touch disk plate, but then dimensions should be tweaked.

## My decision to use PLA-CF

I decided to use PLA with Carbon Fiber for all parts, including disk plates. Refer to [BOM - Filament type](./BOM.md#filament-type) before choosing material. 

My specific setup includes:

- WD RED SN700 connected over TB4, which in this enclosure provides 32/8 Gbps (R/W)
- 2 layers of Kapton tape 
- constant monitoring of internal disk temperature using S.M.A.R.T.
- regular manual checks using thermal-imaging camera
- both fans - Noctua NF-A4x20 FLX 5000 RPM 

Results from holder version `v0.2.0`:

- ambient: 25°C
- during stress-testing for 10 minutes:
  - internal disk probe: 60°C
  - exterior: 46°C
- normal use (backups):
  - internal disk probe: 46°C
  - exterior: 42°C
- idle:
  - internal disk probe: 43°C
  - exterior: 38°C
