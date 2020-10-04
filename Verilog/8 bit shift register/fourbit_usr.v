`include "mux_dflipflop.v"
module fourbit_usr(
input clk,
input sinr,
input sinl,
input clr,
input [1:0]op,
input [3:0]inp,
output [3:0]pout,
output soutr,
output soutl);
wire [3:0]w ;

assign soutl = op[1] ? (op[0] ? soutl : pout[3]) : (op[0] ? soutl : soutl);
assign soutr = op[1] ? (op[0] ? soutr : soutr) : (op[0] ? pout[0] : soutr);

mux m1(w[0],op,inp[0],sinl,pout[1],pout[0]);
mux m2(w[1],op,inp[1],pout[0],pout[2],pout[1]);
mux m3(w[2],op,inp[2],pout[1],pout[3],pout[2]);
mux m4(w[3],op,inp[3],pout[2],sinr,pout[3]);

dff d1(pout[0],w[0],clk,clr);
dff d2(pout[1],w[1],clk,clr);
dff d3(pout[2],w[2],clk,clr);
dff d4(pout[3],w[3],clk,clr);



endmodule

