 *2:4 decoder using mos
 * Inputs : a,b   Outputs : d(1-2).

.include 180nm_bsim3

.subckt inv a b vdd gnd
mp b a vdd gnd p1 w=1.5u l=0.25u
mn b a gnd gnd n1 w=0.5u l=0.25u
.ends

.subckt nand Vdd c d e Vss
mp1 e c Vdd Vdd P1 w=20u l=5u
mp2 e d Vdd Vdd P1 w=20u l=5u
mn1 e c x Vss N1 w=20u l=5u
mn2 e d Vss Vss N1 w=10u l=5u
.ends

x2 b b_bar Vdd 0 inv
x1 a a_bar Vdd 0 inv

xl1 Vdd a_bar b_bar p Vss nand
xl2 Vdd a b_bar q Vss nand
xl4 Vdd a b r Vss nand
xl3 Vdd a_bar b s Vss nand

xd1 p l1_bar Vdd 0 inv
xd2 q l2_bar Vdd 0 inv
xd3 r l3_bar Vdd 0 inv
xd4 s l4_bar Vdd 0 inv

vgnd Vss 0 dc 0
vd Vdd Vss dc 1.8

vIo a Vss pulse(0 1.8 0 10n 10n 10u 20u)
vI1 b Vss pulse(0 1.8 0 10n 10n 20u 40u)

*defining the run-time control functions
.control

*transient analysis for 20ms, step size 0.02ms
tran 1u 100u



run

plot v(a) v(b)+2 v(l1_bar)+3 v(l2_bar)+4 v(l3_bar)+5 v(l4_bar)+6

.endc

.end




