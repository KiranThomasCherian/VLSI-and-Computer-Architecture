`include "wallacedependencies.v"
`include "Myfinal_64cla.v"

module thirty_two_wallace_multipiler(
output [63:0] product, 	
input [31:0] a,		
input [31:0] b);


wire [31:0][63:0]pps;		//partial products
	partialmulti partialmultiplications(pps,a,b);


wire [63:0] s11,s12,s13,s14,s15,s16,s17,s18,s19,s110,c11,c12,c13,c14,c15,c16,c17,c18,c19,c110;

	threeleveladder add11(pps[0][63:0],pps[1][63:0],pps[2][63:0],s11[63:0],c11[63:0]);
	threeleveladder add12(pps[3][63:0],pps[4][63:0],pps[5][63:0],s12[63:0],c12[63:0]);
	threeleveladder add13(pps[6][63:0],pps[7][63:0],pps[8][63:0],s13[63:0],c13[63:0]);
	threeleveladder add14(pps[9][63:0],pps[10][63:0],pps[11][63:0],s14[63:0],c14[63:0]);
	threeleveladder add15(pps[12][63:0],pps[13][63:0],pps[14][63:0],s15[63:0],c15[63:0]);
	threeleveladder add16(pps[15][63:0],pps[16][63:0],pps[17][63:0],s16[63:0],c16[63:0]);
	threeleveladder add17(pps[18][63:0],pps[19][63:0],pps[20][63:0],s17[63:0],c17[63:0]);
	threeleveladder add18(pps[21][63:0],pps[22][63:0],pps[23][63:0],s18[63:0],c18[63:0]);
	threeleveladder add19(pps[24][63:0],pps[25][63:0],pps[26][63:0],s19[63:0],c19[63:0]);
	threeleveladder add110(pps[27][63:0],pps[28][63:0],pps[29][63:0],s110[63:0],c110[63:0]);

wire [63:0] s21,s22,s23,s24,s25,s26,s27,c21,c22,c23,c24,c25,c26,c27;

	threeleveladder add21(s11[63:0],c11[63:0],s12[63:0],s21[63:0],c21[63:0]);
	threeleveladder add22(c12[63:0],s13[63:0],c13[63:0],s22[63:0],c22[63:0]);
	threeleveladder add23(s14[63:0],c14[63:0],s15[63:0],s23[63:0],c23[63:0]);
	threeleveladder add24(c15[63:0],s16[63:0],c16[63:0],s24[63:0],c24[63:0]);
	threeleveladder add25(s17[63:0],c17[63:0],s18[63:0],s25[63:0],c25[63:0]);
	threeleveladder add26(c18[63:0],s19[63:0],c19[63:0],s26[63:0],c26[63:0]);
	threeleveladder add27(s110[63:0],c110[63:0],pps[30][63:0],s27[63:0],c27[63:0]);

wire [63:0] s31,s32,s33,s34,s35,c31,c32,c33,c34,c35;

	threeleveladder add31(s21[63:0],c21[63:0],s22[63:0],s31[63:0],c31[63:0]);
	threeleveladder add32(c22[63:0],s23[63:0],c23[63:0],s32[63:0],c32[63:0]);
	threeleveladder add33(s24[63:0],c24[63:0],s25[63:0],s33[63:0],c33[63:0]);
	threeleveladder add34(c25[63:0],s26[63:0],c26[63:0],s34[63:0],c34[63:0]);
	threeleveladder add35(s27[63:0],c27[63:0],pps[31][63:0],s35[63:0],c35[63:0]);

wire [63:0] s41,s42,s43,c41,c42,c43;

	threeleveladder add41(s31[63:0],c31[63:0],s32[63:0],s41[63:0],c41[63:0]);
	threeleveladder add42(c32[63:0],s33[63:0],c33[63:0],s42[63:0],c42[63:0]);
	threeleveladder add43(s34[63:0],c34[63:0],s35[63:0],s43[63:0],c43[63:0]);

wire [63:0] s51,s52,c51,c52;

	threeleveladder add51(s41[63:0],c41[63:0],s42[63:0],s51[63:0],c51[63:0]);
	threeleveladder add52(c42[63:0],s43[63:0],c43[63:0],s52[63:0],c52[63:0]);

wire [63:0] s61,c61;

	threeleveladder add61(s51[63:0],c51[63:0],s52[63:0],s61[63:0],c61[63:0]);

wire [63:0] s71,c71;

	threeleveladder add71(s61[63:0],c61[63:0],c52[63:0],s71[63:0],c71[63:0]);

wire [63:0] s81,c81;

	threeleveladder add81(s71[63:0],c71[63:0],c35[63:0],s81[63:0],c81[63:0]);

wire cout;
sixtyfour_bit_Recursive_Carry_Adder cla(product,cout,s81,c81);


endmodule

