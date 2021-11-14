* level restoring circuit 
* INPUTS A,B OUTPUT O
*LEVR.cr

.include 180nm_bsim3

.subckt inv X O vdd gnd
m1 O X vdd gnd p1 w=1.5u l=0.25u
m2 O X gnd gnd n1 w=0.5u l=0.25u
.ends

mn A B X 0 n1 w=0.5 l=0.25u
mr Vdd O X 0 p1 w=1.5 l=0.25u
x1 X X_bar Vdd 0 inv

vd Vdd 0 dc 1.8
va A 0 dc 1.8
vb B 0 dc 1.8

.control
dc va 0 1.8 0.05
run

plot v(O) vs v(A)
.endc
.end