`include "fourbit_usr.v"
module eightbit_usr(
input clk,
input sinr,
input sinl,
input clr,
input [1:0]op,
input [7:0]inp,
output [7:0]pout,
output soutr,
output soutl);
wire sout1;
wire sout2;

fourbit_usr f1(clk,sout2,sinl,clr,op,inp[3:0],pout[3:0],soutr,sout1);
fourbit_usr f2(clk,sinr,sout1,clr,op,inp[7:4],pout[7:4],sout2,soutl);
endmodule
