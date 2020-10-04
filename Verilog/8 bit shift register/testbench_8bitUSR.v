/*
op: 00-no change
	01-right shift
	10-left shift
	11-load

soutl,soutr -stores next to be emitted
*/


`include "eightbit_usr.v"
module usr_testbench;
reg[7:0]inp;
reg clk;
reg clr;
reg [1:0]op;
reg sinr;
reg sinl;

wire [7:0]pout;
wire soutl;
wire soutr;

eightbit_usr usr(clk,sinr,sinl,clr,op,inp,pout,soutr,soutl);
  always #50 clk = ~clk;

initial 
begin
clk=1'b1;
clr=1'b0;
sinr=1'b0;
sinl=1'b0;
op=2'b11;
#100;
inp=8'b11110101;
#100;
op=2'b01;
#500;
op=2'b10;
#200;
op=2'b00;
#50;
clr=1'b1;
#100;
clr=1'b0;
op=2'b11;
inp=8'b01100110;
#100;
op=2'b01;
#200;
op=2'b10;
#200;
op=2'b00;
end
initial
	$monitor ($time, " clk = %b; clr = %b; next op = %d; pin = %b; pout = %b ",clk,clr,op,inp,pout);
initial
#1500 $finish;
endmodule
