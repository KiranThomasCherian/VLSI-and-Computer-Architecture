loading history file ... 17 events added
Running IRSIM Console Functions
Warning: irsim command 'time' use fully-qualified name '::irsim::time'
Warning: irsim command 'clear' use fully-qualified name '::irsim::clear'
Warning: irsim command 'exit' use fully-qualified name '::irsim::exit'
Starting irsim under Tcl interpreter
IRSIM 9.7.101 compiled on Thu, 20 Dec 2018 10:40:53 +0100
Warning: Aliasing nodes 'vdd' and 'Vdd'
Warning: Aliasing nodes 'gnd' and 'Gnd'
nor1.sim: Ignoring lumped-resistance ('R' construct)

Read nor1.sim lambda:1.00u format:MIT
6 nodes; transistors: n-channel=2 p-channel=2
parallel txtors:none
Main console display active (Tcl8.6.9 / Tk8.6.9)
(Lab2_nor) 18 % stepsize 10
(Lab2_nor) 19 % w A B Y
(Lab2_nor) 20 % d
Y=X B=X A=X 
time = 0.000ns
(Lab2_nor) 21 % h A
(Lab2_nor) 22 % s
Y=0 B=X A=1 
time = 10.000ns
(Lab2_nor) 23 % l B
(Lab2_nor) 24 % s
Y=0 B=0 A=1 
time = 20.000ns
(Lab2_nor) 25 % l A
(Lab2_nor) 26 % s
Y=1 B=0 A=0 
time = 30.000ns
(Lab2_nor) 27 % h B
(Lab2_nor) 28 % s
Y=0 B=1 A=0 
time = 40.000ns
(Lab2_nor) 29 % h A
(Lab2_nor) 30 % s
Y=0 B=1 A=1 
time = 50.000ns
(Lab2_nor) 31 % analyzer A B Y
(Lab2_nor) 32 % 