
module sixtyfour_bit_Recursive_Carry_Adder(
output [63:0] sum,
output cout,
input [63:0] a,b);
  
wire cin = 1'b0;
wire [63:0] c,g,p;
  
kgpchoose kgp[63:0](g, p, a, b);
wire [63:1] g2, p2;
buff buff_0(c[0], g[0]);
calcblock calc_0[63:1](g2[63:1], p2[63:1], g[63:1], p[63:1], g[62:0], p[62:0]);

wire [63:2] g3, p3;
buff buff_1(c[1], g2[1]);
calcblock calc_1[63:2](g3[63:2], p3[63:2], g2[63:2], p2[63:2], {g2[61:1],g[0]}, {p2[61:1],p[0]});

wire [63:4] g4, p4;
buff buff_2[3:2](c[3:2], g3[3:2]);
calcblock calc_2[63:4](g4[63:4], p4[63:4], g3[63:4], p3[63:4], {g3[59:2],g2[1],g[0]}, {p3[59:2],p2[1],p[0]});

wire [63:8] g5, p5;
buff buff_3[7:4](c[7:4], g4[7:4]);
calcblock calc_3[63:8](g5[63:8], p5[63:8], g4[63:8], p4[63:8], {g4[55:4],g3[3:2],g2[1],g[0]}, {p4[55:4],p3[3:2],p2[1],p[0]});
        
wire [63:16] g6, p6;
buff buff_4[15:8](c[15:8], g5[15:8]);
calcblock calc_4[63:16](g6[63:16], p6[63:16], g5[63:16], p5[63:16], {g5[47:8],g4[7:4],g3[3:2],g2[1],g[0]}, {p5[47:8],p4[7:4],p3[3:2],p2[1],p[0]});
  
wire [63:32] g7, p7;
buff buff_5[31:16](c[31:16], g6[31:16]);
calcblock calc_5[63:32](g7[63:32], p7[63:32], g6[63:32], p6[63:32], {g6[31:16],g5[15:8],g4[7:4],g3[3:2],g2[1],g[0]}, {p6[31:16],p5[15:8],p4[7:4],p3[3:2],p2[1],p[0]});



buff buff_6[63:32](c[63:32], g6[63:32]);
finaladder adder_0(sum[0],p[0],cin);
finaladder addr_1[63:1](sum[63:1],p[63:1], c[62:0]);
buf(cout, c[63]);
 


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
