* NMOSFET I-V
.include 180nm_bsim3

m1 d g 0 0 N1 w=20u l=2u
vd dum 0 dc 1.8
vdum dum d dc 0
vg g 0 dc 1.8

.control
dc vg 0 1.8 0.05 vd 0 1.8 0.2 
run
plot vdum#branch vs v(g)

dc vd 0 1.8 0.05 vg 0 1.8 0.2 
run
plot vdum#branch vs v(d)


.endc