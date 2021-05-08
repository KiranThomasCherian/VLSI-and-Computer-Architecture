`include "modules.v"

module lud(
output reg [31:0] ans,
input [2:0]opt,
input [31:0] a,b);
/*
 bitwise AND
2) bitwise XOR
3) bitwise NAND
4) bitwise OR
5) bitwise NOT
6) bitwise NOR
7) 2's Complement
8) bitwise XNOR
*/
wire [31:0] and_ans,xor_ans,nand_ans,or_ans,not_ans,nor_ans,ts_ans,xnor_ans;

and32 g1(and_ans[31:0],a[31:0],b[31:0]);
xor32 g2(xor_ans[31:0],a[31:0],b[31:0]);
nand32 g3(nand_ans[31:0],a[31:0],b[31:0]);
or32 g4(or_ans[31:0],a[31:0],b[31:0]);
not32 g5(not_ans[31:0],b[31:0]);
nor32 g6(nor_ans[31:0],a[31:0],b[31:0]);
ts32 g7(ts_ans[31:0],b[31:0]);
xnor32 g8(xnor_ans[31:0],a[31:0],b[31:0]);

always @ (a or b or opt)
begin
if (opt == 3'b000)
assign ans = and_ans;
else if (opt ==3'b001)
assign ans = xor_ans;
else if (opt ==3'b010)
assign ans = nand_ans;
else if (opt ==3'b011)
assign ans = or_ans;
else if (opt ==3'b100)
assign ans = not_ans;
else if (opt ==3'b101)
assign ans = nor_ans;
else if (opt ==3'b110)
assign ans = ts_ans;
else if (opt ==3'b111)
assign ans = xnor_ans;
else
assign ans = 32'bx;
end

endmodule
