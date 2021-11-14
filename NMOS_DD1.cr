*NMOS CHARACTERISTICS
Vdd 3 0 dc 5V
vdummy 3 2 dc 0V
vgs 1 0 dc 2V
M1 2 1 0 0 nmosff w=100u l=10u
.model nmosff nmos Vto=5V kp=200u
.dc Vdd 0 5  1
.control 
 run 
 plot i(vdummy)
 .endc
 .end
 