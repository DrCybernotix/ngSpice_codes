 * AND gate using PTL(Past traansistor logic)
 * INPUTS A,B OUTPUT F
 * ANDPTL.cr
 
.include 180nm_bsim3

.subckt inv p q vdd gnd
mp q p vdd gnd p1 w=1.5u l=0.25u
mn q p gnd gnd n1 w=0.5u l=0.25u
.ends

m1 A B F 0 n1 w=0.5 l=0.25u
m2 0 B_bar F 0 n1 w=0.5 l=0.25u
x1 B B_bar Vdd 0 inv

vd Vdd 0 dc 1.8

va A 0 dc 1.8
vb B 0 dc 1.8

.control
dc va 0 1.8 0.05
run

plot v(F) vs v(A)
.endc

.control
dc vb 0 1.8 0.05
run
plot v(F) vs v(B)
.endc

.end