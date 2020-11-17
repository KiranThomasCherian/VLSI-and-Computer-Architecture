
module sixteenbit_sklansky_adder(
output [15:0] sum,
output cout,
input [15:0] a,b);
  
wire cin = 1'b0;
wire [15:0] c,g,p;
  
kgpchoose kgp[15:0](g, p, a, b);


//level 1
wire g1[15:0],p1[15:0];
 //g11,g12,g13,g14,g15,g16,g17,g18,g19,g110,g111,g112,g113,g114,g15,p11,p12,p13,p14,p15,p16,p17,p18,p19,p110,p111,p112,p113,p114,p115;
buff b10(g1[0],p1[0],g[0],p[0]);
greyblock b11(g1[1],p1[1],g[1],p[1],g[0],p[0]);
buff b12(g1[2],p1[2],g[2],p[2]);
blackblock b13(g1[3],p1[3],g[3],p[3],g[2],p[2]);
buff b14(g1[4],p1[4],g[4],p[4]);
blackblock b15(g1[5],p1[5],g[5],p[5],g[4],p[4]);
buff b16(g1[6],p1[6],g[6],p[6]);
blackblock b17(g1[7],p1[7],g[7],p[7],g[6],p[6]);
buff b18(g1[8],p1[8],g[8],p[8]);
blackblock b19(g1[9],p1[9],g[9],p[9],g[8],p[8]);
buff b110(g1[10],p1[10],g[10],p[10]);
blackblock b111(g1[11],p1[11],g[11],p[11],g[10],p[10]);
buff b112(g1[12],p1[12],g[12],p[12]);
blackblock b113(g1[13],p1[13],g[13],p[13],g[12],p[12]);
buff b114(g1[14],p1[14],g[14],p[14]);
blackblock b115(g1[15],p1[15],g[15],p[15],g[14],p[14]);

assign c[0]=g1[0];

//level 2

wire g2[15:1],p2[15:1];
//g21,g22,g23,g24,g25,g26,g27,g28,g29,g210,g211,g212,g213,g214,g215,p21,p22,p23,p24,p25,p26,p27,p28,p29,p210,p211,p212,p213,p214,p215;
buff b20(g2[1],p2[1],g1[1],p1[1]);
greyblock b21(g2[2],p2[2],g1[2],p1[2],g1[1],p1[1]);
greyblock b22(g2[3],p2[3],g1[3],p1[3],g1[1],p1[1]);
assign g2[4]=g1[4];
assign p2[4]=p1[4]; //as same wire is needed
buff b23(g2[5],p2[5],g1[5],p1[5]);
blackblock b24(g2[6],p2[6],g1[6],p1[6],g1[5],p1[5]);
blackblock b25(g2[7],p2[7],g1[7],p1[7],g1[5],p1[5]);
assign g2[8]=g1[8]; 
assign p2[8]=p1[8]; //as same wire is needed
buff b26(g2[9],p2[9],g1[9],p1[9]);
blackblock b27(g2[10],p2[10],g1[10],p1[10],g1[9],p1[9]);
blackblock b28(g2[11],p2[11],g1[11],p1[11],g1[9],p1[9]);
assign g2[12]=g1[12]; 
assign p2[12]=p1[12]; //as same wire is needed
buff b29(g2[13],p2[13],g1[13],p1[13]);
blackblock b210(g2[14],p2[14],g1[14],p1[14],g1[13],p1[13]);
blackblock b211(g2[15],p2[15],g1[15],p1[15],g1[13],p1[13]);

assign c[1]=g2[1];

//level 3
wire g3[15:2],p3[15:2];
buff b30(g3[2],p3[2],g2[2],p2[2]);
buff b31(g3[3],p3[3],g2[3],p2[3]);
greyblock b32(g3[4],p3[4],g2[4],p2[4],g2[3],p2[3]);
greyblock b33(g3[5],p3[5],g2[5],p2[5],g2[3],p2[3]);
greyblock b34(g3[6],p3[6],g2[6],p2[6],g2[3],p2[3]);
greyblock b35(g3[7],p3[7],g2[7],p2[7],g2[3],p2[3]);
assign g3[8]=g2[8]; 
assign p3[8]=p2[8]; 
assign g3[9]=g2[9]; 
assign p3[9]=p2[9]; //as same wire is needed
buff b36(g3[10],p3[10],g2[10],p2[10]);
buff b37(g3[11],p3[11],g2[11],p2[11]);
blackblock b38(g3[12],p3[12],g2[12],p2[12],g2[11],p2[11]);
blackblock b39(g3[13],p3[13],g2[13],p2[13],g2[11],p2[11]);
blackblock b310(g3[14],p3[14],g2[14],p2[14],g2[11],p2[11]);
blackblock b311(g3[15],p3[15],g2[15],p2[15],g2[11],p2[11]);
assign c[2]=g3[2];
assign c[3]=g3[3];

//level 4
wire g4[15:4],p4[15:4];
buff b40(g4[4],p4[4],g3[4],p3[4]);
buff b41(g4[5],p4[5],g3[5],p3[5]);
buff b42(g4[6],p4[6],g3[6],p3[6]);
buff b43(g4[7],p4[7],g3[7],p3[7]);
greyblock b45(g4[8],p4[8],g3[8],p3[8],g3[7],p3[7]);
greyblock b46(g4[9],p4[9],g3[9],p3[9],g3[7],p3[7]);
greyblock b47(g4[10],p4[10],g3[10],p3[10],g3[7],p3[7]);
greyblock b48(g4[11],p4[11],g3[11],p3[11],g3[7],p3[7]);
greyblock b49(g4[12],p4[12],g3[12],p3[12],g3[7],p3[7]);
greyblock b410(g4[13],p4[13],g3[13],p3[13],g3[7],p3[7]);
greyblock b411(g4[14],p4[14],g3[14],p3[14],g3[7],p3[7]);
greyblock b412(g4[15],p4[15],g3[15],p3[15],g3[7],p3[7]);

assign c[4]=g4[4];
assign c[5]=g4[5];
assign c[6]=g4[6];
assign c[7]=g4[7];
assign c[8]=g4[8];
assign c[9]=g4[9];
assign c[10]=g4[10];
assign c[11]=g4[11];
assign c[12]=g4[12];
assign c[13]=g4[13];
assign c[14]=g4[14];
assign c[15]=g4[15];


finaladder adder_0(sum[0],p[0],cin);
finaladder addr_1[15:1](sum[15:1],p[15:1],c[14:0]);
buf(cout,c[15]);
 


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


module buff(		//triangle
output Ci,Di,
input Gi,Pi);
//buf(Ci, Gi);
assign Ci=Gi;
assign Di=Pi;
endmodule

module greyblock(output G, P, input Gi, Pi, Gip, Pip);
wire w;
and(w, Pi, Gip);
or(G, w, Gi);
endmodule

module blackblock(output G, P, input Gi, Pi, Gip, Pip);
wire w;
and(w, Pi, Gip);
or(G, w, Gi);
and(P, Pi, Pip);
endmodule
