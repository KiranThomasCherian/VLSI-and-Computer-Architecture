
module and32(
output [31:0] and_ans,
input [31:0] a,b);
and g1[31:0](and_ans,a,b);
endmodule

module xor32(
output [31:0] xor_ans,
input [31:0] a,b);
xor g2[31:0](xor_ans,a,b);
endmodule

module nand32(
output [31:0] nand_ans,
input [31:0] a,b);
nand g3[31:0](nand_ans,a,b);
endmodule

module or32(
output [31:0] or_ans,
input [31:0] a,b);
or g4[31:0](or_ans,a,b);
endmodule

module not32(
output [31:0] not_ans,
input [31:0] a);
not g5[31:0](not_ans,a);
endmodule

module nor32(
output [31:0] nor_ans,
input [31:0] a,b);
nor g6[31:0](nor_ans,a,b);
endmodule

module ts32(
output [31:0] ts_ans,
input [31:0] a);
wire [31:0] os;
not g7[31:0](os,a);
assign ts_ans =os + 1'b1;
endmodule

module xnor32(
output [31:0] xnor_ans,
input [31:0] a,b);
xnor g8[31:0](xnor_ans,a,b);
endmodule
