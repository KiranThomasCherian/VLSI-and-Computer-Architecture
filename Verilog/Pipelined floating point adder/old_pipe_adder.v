
module thirtytwo_bit_Recursive_Carry_Adder(
output [31:0] sum,
output cout,
input cin,
input [31:0] a,b,
input clk);
  
//wire cin = 1'b0;
wire [31:0] c,g,p;
  
kgpchoose kgp[31:0](g, p, a, b);
wire [31:1] g2, p2;
buff buff_0(c[0], g[0]);
calcblock calc_1[31:1](g2[31:1], p2[31:1], g[31:1], p[31:1], g[30:0], p[30:0]);


wire [31:0] c_1,g_1,p_1,a_1,b_1;
wire [31:1] g2_1,p2_1;
dff df10[31:0](g,clk,1'b0,g_1);
dff df11[31:0](p,clk,1'b0,p_1);
//dff df12[31:0](a,clk,1'b0,a_1);
//dff df13[31:0](b,clk,1'b0,b_1);
dff df14[31:0](c,clk,1'b0,c_1);
dff df15[31:1](g2,clk,1'b0,g2_1);
dff df16[31:1](p2,clk,1'b0,p2_1);
wire cin_1;
dff df1(cin,clk,1'b0,cin_1);

wire [31:2] g3, p3;
buff buff_1(c_1[1], g2_1[1]);
calcblock calc_2[31:2](g3[31:2], p3[31:2], g2_1[31:2], p2_1[31:2], {g2_1[29:1],g_1[0]}, {p2_1[29:1],p_1[0]});

wire [31:0] c_2,g_2,p_2,a_2,b_2;
wire [31:1] g2_2,p2_2;
wire [31:2] g3_2, p3_2;
dff df20[31:0](g_1,clk,1'b0,g_2);
dff df21[31:0](p_1,clk,1'b0,p_2);
//dff df22[31:0](a_1,clk,1'b0,a_2);
//dff df23[31:0](b_1,clk,1'b0,b_2);
dff df24[31:0](c_1,clk,1'b0,c_2);
dff df25[31:1](g2_1,clk,1'b0,g2_2);
dff df26[31:1](p2_1,clk,1'b0,p2_2);
dff df27[31:2](g3,clk,1'b0,g3_2);
dff df28[31:2](p3,clk,1'b0,p3_2);
wire cin_2;
dff df2(cin_1,clk,1'b0,cin_2);

wire [31:4] g4, p4;
buff buff_2[3:2](c_2[3:2], g3_2[3:2]);
calcblock calc_3[31:4](g4[31:4], p4[31:4], g3_2[31:4], p3_2[31:4], {g3_2[27:2],g2_2[1],g_2[0]}, {p3_2[27:2],p2_2[1],p_2[0]});

wire [31:0] c_3,g_3,p_3,a_3,b_3;
wire [31:1] g2_3,p2_3;
wire [31:2] g3_3, p3_3;
wire [31:4] g4_3, p4_3;
dff df30[31:0](g_2,clk,1'b0,g_3);
dff df31[31:0](p_2,clk,1'b0,p_3);
//dff df32[31:0](a_2,clk,1'b0,a_3);
//dff df33[31:0](b_2,clk,1'b0,b_3);
dff df34[31:0](c_2,clk,1'b0,c_3);
dff df35[31:1](g2_2,clk,1'b0,g2_3);
dff df36[31:1](p2_2,clk,1'b0,p2_3);
dff df37[31:2](g3_2,clk,1'b0,g3_3);
dff df38[31:2](p3_2,clk,1'b0,p3_3);
dff df39[31:4](g4,clk,1'b0,g4_3);
dff df310[31:4](p4,clk,1'b0,p4_3);
wire cin_3;
dff df3(cin_2,clk,1'b0,cin_3);

wire [31:8] g5, p5;
buff buff_3[7:4](c_3[7:4], g4_3[7:4]);
calcblock calc_4[31:8](g5[31:8], p5[31:8], g4_3[31:8], p4_3[31:8], {g4_3[23:4],g3_3[3:2],g2_3[1],g_3[0]}, {p4_3[23:4],p3_3[3:2],p2_3[1],p_3[0]});

wire [31:0] c_4,g_4,p_4,a_4,b_4;
wire [31:1] g2_4,p2_4;
wire [31:2] g3_4, p3_4;
wire [31:4] g4_4, p4_4;
wire [31:8] g5_4, p5_4;
dff df40[31:0](g_3,clk,1'b0,g_4);
dff df41[31:0](p_3,clk,1'b0,p_4);
//dff df42[31:0](a_3,clk,1'b0,a_4);
//dff df43[31:0](b_3,clk,1'b0,b_4);
dff df44[31:0](c_3,clk,1'b0,c_4);
dff df45[31:1](g2_3,clk,1'b0,g2_4);
dff df46[31:1](p2_3,clk,1'b0,p2_4);
dff df47[31:2](g3_3,clk,1'b0,g3_4);
dff df48[31:2](p3_3,clk,1'b0,p3_4);
dff df49[31:4](g4_3,clk,1'b0,g4_4);
dff df410[31:4](p4_3,clk,1'b0,p4_4);
dff df411[31:8](g5,clk,1'b0,g5_4);
dff df412[31:8](p5,clk,1'b0,p5_4);   
wire cin_4;
dff df4(cin_3,clk,1'b0,cin_4);
     
wire [31:16] g6, p6;
buff buff_4[15:8](c_4[15:8], g5_4[15:8]);
calcblock calc_5[31:16](g6[31:16], p6[31:16], g5_4[31:16], p5_4[31:16], {g5_4[15:8],g4_4[7:4],g3_4[3:2],g2_4[1],g_4[0]}, {p5_4[15:8],p4_4[7:4],p3_4[3:2],p2_4[1],p_4[0]});

wire [31:0] c_5,g_5,p_5,a_5,b_5;
wire [31:1] g2_5,p2_5;
wire [31:2] g3_5, p3_5;
wire [31:4] g4_5, p4_5;
wire [31:8] g5_5, p5_5;
wire [31:16] g6_5, p6_5;
dff df50[31:0](g_4,clk,1'b0,g_5);
dff df51[31:0](p_4,clk,1'b0,p_5);
//dff df52[31:0](a_4,clk,1'b0,a_5);
//dff df53[31:0](b_4,clk,1'b0,b_5);
dff df54[31:0](c_4,clk,1'b0,c_5);
dff df55[31:1](g2_4,clk,1'b0,g2_5);
dff df56[31:1](p2_4,clk,1'b0,p2_5);
dff df57[31:2](g3_4,clk,1'b0,g3_5);
dff df58[31:2](p3_4,clk,1'b0,p3_5);
dff df59[31:4](g4_4,clk,1'b0,g4_5);
dff df510[31:4](p4_4,clk,1'b0,p4_5);
dff df511[31:8](g5_4,clk,1'b0,g5_5);
dff df512[31:8](p5_4,clk,1'b0,p5_5);
dff df513[31:16](g6,clk,1'b0,g6_5);
dff df514[31:16](p6,clk,1'b0,p6_5); 
wire cin_5;
dff df5(cin_4,clk,1'b0,cin_5);

 
buff buff_5[31:16](c_5[31:16], g6_5[31:16]);
finaladder adder_0(sum[0],p_5[0],cin_5);
finaladder addr_1[31:1](sum[31:1],p_5[31:1], c_5[30:0]);
buf(cout, c_5[31]);
 


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
