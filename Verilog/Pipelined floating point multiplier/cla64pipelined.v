
module sixtyfour_bit_Recursive_Carry_Adder(
output [63:0] sum,
output cout,
input [63:0] a,b,
input clk,
input [19:0]ts6,
output [19:0]ts);
  


wire cin = 1'b0;
wire [63:0] c,g,p;

wire [19:0] ts7,ts8,ts9,ts10,ts11,ts12;
  
kgpchoose kgp[63:0](g, p, a, b);
wire [63:1] g2, p2;
buff buff_0(c[0], g[0]);
calcblock calc_1[63:1](g2[63:1], p2[63:1], g[63:1], p[63:1], g[62:0], p[62:0]);


wire [63:0] c_1,g_1,p_1,a_1,b_1;
wire [63:1] g2_1,p2_1;
dff df10[63:0](g,clk,1'b0,g_1);
dff df11[63:0](p,clk,1'b0,p_1);
//dff df12[63:0](a,clk,1'b0,a_1);
//dff df13[63:0](b,clk,1'b0,b_1);
dff df14[63:0](c,clk,1'b0,c_1);
dff df15[63:1](g2,clk,1'b0,g2_1);
dff df16[63:1](p2,clk,1'b0,p2_1);
wire cin_1;
dff df1(cin,clk,1'b0,cin_1);

	dff t7[19:0](ts6,clk,1'b0,ts7);

wire [63:2] g3, p3;
buff buff_1(c_1[1], g2_1[1]);
calcblock calc_2[63:2](g3[63:2], p3[63:2], g2_1[63:2], p2_1[63:2], {g2_1[61:1],g_1[0]}, {p2_1[61:1],p_1[0]});

wire [63:0] c_2,g_2,p_2,a_2,b_2;
wire [63:1] g2_2,p2_2;
wire [63:2] g3_2, p3_2;
dff df20[63:0](g_1,clk,1'b0,g_2);
dff df21[63:0](p_1,clk,1'b0,p_2);
//dff df22[63:0](a_1,clk,1'b0,a_2);
//dff df23[63:0](b_1,clk,1'b0,b_2);
dff df24[63:0](c_1,clk,1'b0,c_2);
dff df25[63:1](g2_1,clk,1'b0,g2_2);
dff df26[63:1](p2_1,clk,1'b0,p2_2);
dff df27[63:2](g3,clk,1'b0,g3_2);
dff df28[63:2](p3,clk,1'b0,p3_2);
wire cin_2;
dff df2(cin_1,clk,1'b0,cin_2);

	dff t8[19:0](ts7,clk,1'b0,ts8);

wire [63:4] g4, p4;
buff buff_2[3:2](c_2[3:2], g3_2[3:2]);
calcblock calc_3[63:4](g4[63:4], p4[63:4], g3_2[63:4], p3_2[63:4], {g3_2[59:2],g2_2[1],g_2[0]}, {p3_2[59:2],p2_2[1],p_2[0]});

wire [63:0] c_3,g_3,p_3,a_3,b_3;
wire [63:1] g2_3,p2_3;
wire [63:2] g3_3, p3_3;
wire [63:4] g4_3, p4_3;
dff df30[63:0](g_2,clk,1'b0,g_3);
dff df31[63:0](p_2,clk,1'b0,p_3);
//dff df32[63:0](a_2,clk,1'b0,a_3);
//dff df33[63:0](b_2,clk,1'b0,b_3);
dff df34[63:0](c_2,clk,1'b0,c_3);
dff df35[63:1](g2_2,clk,1'b0,g2_3);
dff df36[63:1](p2_2,clk,1'b0,p2_3);
dff df37[63:2](g3_2,clk,1'b0,g3_3);
dff df38[63:2](p3_2,clk,1'b0,p3_3);
dff df39[63:4](g4,clk,1'b0,g4_3);
dff df310[63:4](p4,clk,1'b0,p4_3);
wire cin_3;
dff df3(cin_2,clk,1'b0,cin_3);

	dff t9[19:0](ts8,clk,1'b0,ts9);

wire [63:8] g5, p5;
buff buff_3[7:4](c_3[7:4], g4_3[7:4]);
calcblock calc_4[63:8](g5[63:8], p5[63:8], g4_3[63:8], p4_3[63:8], {g4_3[55:4],g3_3[3:2],g2_3[1],g_3[0]}, {p4_3[55:4],p3_3[3:2],p2_3[1],p_3[0]});

wire [63:0] c_4,g_4,p_4,a_4,b_4;
wire [63:1] g2_4,p2_4;
wire [63:2] g3_4, p3_4;
wire [63:4] g4_4, p4_4;
wire [63:8] g5_4, p5_4;
dff df40[63:0](g_3,clk,1'b0,g_4);
dff df41[63:0](p_3,clk,1'b0,p_4);
//dff df42[63:0](a_3,clk,1'b0,a_4);
//dff df43[63:0](b_3,clk,1'b0,b_4);
dff df44[63:0](c_3,clk,1'b0,c_4);
dff df45[63:1](g2_3,clk,1'b0,g2_4);
dff df46[63:1](p2_3,clk,1'b0,p2_4);
dff df47[63:2](g3_3,clk,1'b0,g3_4);
dff df48[63:2](p3_3,clk,1'b0,p3_4);
dff df49[63:4](g4_3,clk,1'b0,g4_4);
dff df410[63:4](p4_3,clk,1'b0,p4_4);
dff df411[63:8](g5,clk,1'b0,g5_4);
dff df412[63:8](p5,clk,1'b0,p5_4);   
wire cin_4;
dff df4(cin_3,clk,1'b0,cin_4);

	dff t10[19:0](ts9,clk,1'b0,ts10);
     
wire [63:16] g6, p6;
buff buff_4[15:8](c_4[15:8], g5_4[15:8]);
calcblock calc_5[63:16](g6[63:16], p6[63:16], g5_4[63:16], p5_4[63:16], {g5_4[47:8],g4_4[7:4],g3_4[3:2],g2_4[1],g_4[0]}, {p5_4[47:8],p4_4[7:4],p3_4[3:2],p2_4[1],p_4[0]});

wire [63:0] c_5,g_5,p_5,a_5,b_5;
wire [63:1] g2_5,p2_5;
wire [63:2] g3_5, p3_5;
wire [63:4] g4_5, p4_5;
wire [63:8] g5_5, p5_5;
wire [63:16] g6_5, p6_5;
dff df50[63:0](g_4,clk,1'b0,g_5);
dff df51[63:0](p_4,clk,1'b0,p_5);
//dff df52[63:0](a_4,clk,1'b0,a_5);
//dff df53[63:0](b_4,clk,1'b0,b_5);
dff df54[63:0](c_4,clk,1'b0,c_5);
dff df55[63:1](g2_4,clk,1'b0,g2_5);
dff df56[63:1](p2_4,clk,1'b0,p2_5);
dff df57[63:2](g3_4,clk,1'b0,g3_5);
dff df58[63:2](p3_4,clk,1'b0,p3_5);
dff df59[63:4](g4_4,clk,1'b0,g4_5);
dff df510[63:4](p4_4,clk,1'b0,p4_5);
dff df511[63:8](g5_4,clk,1'b0,g5_5);
dff df512[63:8](p5_4,clk,1'b0,p5_5);
dff df513[63:16](g6,clk,1'b0,g6_5);
dff df514[63:16](p6,clk,1'b0,p6_5); 
wire cin_5;
dff df5(cin_4,clk,1'b0,cin_5);

	dff t11[19:0](ts10,clk,1'b0,ts11);

wire [63:32] g7, p7;
buff buff_5[31:16](c_5[31:16], g6_5[31:16]);
calcblock calc_6[63:32](g7[63:32], p7[63:32], g6_5[63:32], p6_5[63:32], {g6_5[31:16],g5_5[15:8],g4_5[7:4],g3_5[3:2],g2_5[1],g_5[0]}, {p6_5[31:16],p5_5[15:8],p4_5[7:4],p3_5[3:2],p2_5[1],p_5[0]});

wire [63:0] c_6,g_6,p_6,a_6,b_6;
wire [63:1] g2_6,p2_6;
wire [63:2] g3_6, p3_6;
wire [63:4] g4_6, p4_6;
wire [63:8] g5_6, p5_6;
wire [63:16] g6_6, p6_6;
wire [63:32] g7_6, p7_6;
dff df60[63:0](g_5,clk,1'b0,g_6);
dff df61[63:0](p_5,clk,1'b0,p_6);
//dff df62[63:0](a_5,clk,1'b0,a_6);
//dff df63[63:0](b_5,clk,1'b0,b_6);
dff df64[63:0](c_5,clk,1'b0,c_6);
dff df65[63:1](g2_5,clk,1'b0,g2_6);
dff df66[63:1](p2_5,clk,1'b0,p2_6);
dff df67[63:2](g3_5,clk,1'b0,g3_6);
dff df68[63:2](p3_5,clk,1'b0,p3_6);
dff df69[63:4](g4_5,clk,1'b0,g4_6);
dff df610[63:4](p4_5,clk,1'b0,p4_6);
dff df611[63:8](g5_5,clk,1'b0,g5_6);
dff df612[63:8](p5_5,clk,1'b0,p5_6);
dff df613[63:16](g6_5,clk,1'b0,g6_6);
dff df614[63:16](p6_5,clk,1'b0,p6_6);
dff df615[63:32](g7,clk,1'b0,g7_6);
dff df616[63:32](p7,clk,1'b0,p7_6); 
wire cin_6;
dff df6(cin_5,clk,1'b0,cin_6);
	dff t12[19:0](ts11,clk,1'b0,ts12);

buff buff_6[63:32](c_6[63:32], g7_6[63:32]);
finaladder adder_0(sum[0],p_6[0],cin_6);
finaladder addr_1[63:1](sum[63:1],p_6[63:1], c_6[62:0]);
buf(cout, c_6[63]);
assign ts=ts12;
 

 


endmodule



module kgpchoose(
output G, P,
input Ai, Bi);
and(G, Ai, Bi);
xor(P, Ai, Bi);
endmodule

module finaladder(
output Si,
input Pi, Ci);
xor(Si, Pi, Ci);
endmodule

module finaladderr(
output Si,
input ai,bi,Ci);
wire w;
xor(w,ai,bi);
xor(Si,w,Ci);
endmodule

module buff(
output Ci,
input Gi);
//buf(Ci, Gi);
assign Ci=Gi;
endmodule

module calcblock(output G, P, input Gi, Pi, Gip, Pip);
wire w;
and(w, Pi, Gip);
or(G, w, Gi);
and(P, Pi, Pip);
endmodule

module dff(d,clk,clear,q); 
input d, clk, clear; 
output reg q; 
always@(posedge clk) 
begin
if(clear== 1)
q <= 0;
else 
q <= d;
//$display("%d\n",$time);  
end 
endmodule
