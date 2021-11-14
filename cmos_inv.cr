*cmos inverter
.include 180nm_bsim3
mp vd vin vo vd P1 w=20u l=2u
mn vo vin 0 0 N1 w=10u l=2u
vdd vd 0 dc 1.8
CL vo 0 50f
vg vin 0 dc 1.8
.control
dc vg 0 1.8 0.05
run
plot v(vo) v(vin)
.endc
.end