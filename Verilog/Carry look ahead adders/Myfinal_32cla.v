
module thirtytwo_bit_Recursive_Carry_Adder(
output [31:0] sum,
output cout,
input [31:0] a,b);
  
wire cin = 1'b0;
wire [31:0] c,g,p;
  
kgpchoose kgp[31:0](g, p, a, b);
wire [31:1] g2, p2;
buff buff_0(c[0], g[0]);
calcblock calc_0[31:1](g2[31:1], p2[31:1], g[31:1], p[31:1], g[30:0], p[30:0]);

wire [31:2] g3, p3;
buff buff_1(c[1], g2[1]);
calcblock calc_1[31:2](g3[31:2], p3[31:2], g2[31:2], p2[31:2], {g2[29:1],g[0]}, {p2[29:1],p[0]});

wire [31:4] g4, p4;
buff buff_2[3:2](c[3:2], g3[3:2]);
calcblock calc_2[31:4](g4[31:4], p4[31:4], g3[31:4], p3[31:4], {g3[27:2],g2[1],g[0]}, {p3[27:2],p2[1],p[0]});

wire [31:8] g5, p5;
buff buff_3[7:4](c[7:4], g4[7:4]);
calcblock calc_3[31:8](g5[31:8], p5[31:8], g4[31:8], p4[31:8], {g4[23:4],g3[3:2],g2[1],g[0]}, {p4[23:4],p3[3:2],p2[1],p[0]});
        
wire [31:16] g6, p6;
buff buff_4[15:8](c[15:8], g5[15:8]);
calcblock calc_4[31:16](g6[31:16], p6[31:16], g5[31:16], p5[31:16], {g5[15:8],g4[7:4],g3[3:2],g2[1],g[0]}, {p5[15:8],p4[7:4],p3[3:2],p2[1],p[0]});
  
buff buff_5[31:16](c[31:16], g6[31:16]);
finaladder adder_0(sum[0],p[0],cin);
finaladder addr_1[31:1](sum[31:1],p[31:1], c[30:0]);
buf(cout, c[31]);
 


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
