loading history file ... 8 events added
Running IRSIM Console Functions
Warning: irsim command 'time' use fully-qualified name '::irsim::time'
Warning: irsim command 'clear' use fully-qualified name '::irsim::clear'
Warning: irsim command 'exit' use fully-qualified name '::irsim::exit'
Starting irsim under Tcl interpreter
IRSIM 9.7.101 compiled on Thu, 20 Dec 2018 10:40:53 +0100
Warning: Aliasing nodes 'vdd' and 'Vdd'
Warning: Aliasing nodes 'gnd' and 'Gnd'
ced18i028.sim: Ignoring lumped-resistance ('R' construct)

Read ced18i028.sim lambda:1.00u format:MIT
4 nodes; transistors: n-channel=1 p-channel=1
parallel txtors:none
Main console display active (Tcl8.6.9 / Tk8.6.9)
(Lab1_invertor) 9 % stepsize10
invalid command name "stepsize10"
(Lab1_invertor) 10 % stepsize 10
(Lab1_invertor) 11 % w A Y
(Lab1_invertor) 12 % d
Y=X A=X 
time = 0.000ns
(Lab1_invertor) 13 % h A
(Lab1_invertor) 14 % s
Y=0 A=1 
time = 10.000ns
(Lab1_invertor) 15 % l A
(Lab1_invertor) 16 % s
Y=1 A=0 
time = 20.000ns
(Lab1_invertor) 17 % analyzer A Y
(Lab1_invertor) 18 % 