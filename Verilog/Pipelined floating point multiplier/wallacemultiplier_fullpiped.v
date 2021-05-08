`include "wallacedependencies.v"
//`include "Myfinal_64cla.v"
`include "cla64pipelined.v"
module thirty_two_wallace_multipiler(
output [63:0] mulproduct, 	
input [23:0] aorg,		
input [23:0] borg,
input clk,
input [19:0]tempstore,
output [19:0]ts);

wire [19:0] ts1,ts2,ts3,ts4,ts5,ts6,ts7,ts8,ts9,ts10,ts11,ts12;

reg [31:0] a,b;
always @ (aorg or borg)
begin
a={8'b0,aorg};
b={8'b0,borg};
end

wire [31:0][63:0]pps;		//partial products
	partialmulti partialmultiplications(pps,a,b);


//always @ a
//$display("-a %d %b %b",$time,a,b);
//always @ tempstore
//$display("-ts %d %b %b %b",$time,a,b,tempstore);

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

wire [63:0] s1_11,s1_12,s1_13,s1_14,s1_15,s1_16,s1_17,s1_18,s1_19,s1_110,c1_11,c1_12,c1_13,c1_14,c1_15,c1_16,c1_17,c1_18,c1_19,c1_110 ,pps_11,pps12;
dff df11[63:0](s11,clk,1'b0,s1_11);
dff df12[63:0](s12,clk,1'b0,s1_12);
dff df13[63:0](s13,clk,1'b0,s1_13);
dff df14[63:0](s14,clk,1'b0,s1_14);
dff df15[63:0](s15,clk,1'b0,s1_15);
dff df16[63:0](s16,clk,1'b0,s1_16);
dff df17[63:0](s17,clk,1'b0,s1_17);
dff df18[63:0](s18,clk,1'b0,s1_18);
dff df19[63:0](s19,clk,1'b0,s1_19);
dff df110[63:0](s110,clk,1'b0,s1_110);
dff df111[63:0](c11,clk,1'b0,c1_11);
dff df112[63:0](c12,clk,1'b0,c1_12);
dff df113[63:0](c13,clk,1'b0,c1_13);
dff df114[63:0](c14,clk,1'b0,c1_14);
dff df115[63:0](c15,clk,1'b0,c1_15);
dff df116[63:0](c16,clk,1'b0,c1_16);
dff df117[63:0](c17,clk,1'b0,c1_17);
dff df118[63:0](c18,clk,1'b0,c1_18);
dff df119[63:0](c19,clk,1'b0,c1_19);
dff df120[63:0](c110,clk,1'b0,c1_110);
dff df121[63:0](pps[30],clk,1'b0,pps_11);
dff df122[63:0](pps[31],clk,1'b0,pps_12);

	dff t1[19:0](tempstore,clk,1'b0,ts1);

//always @ pps_12
//$display("t %d %d",$time,pps_12,ts1);

wire [63:0] s21,s22,s23,s24,s25,s26,s27,c21,c22,c23,c24,c25,c26,c27;

	threeleveladder add21(s1_11[63:0],c1_11[63:0],s1_12[63:0],s21[63:0],c21[63:0]);
	threeleveladder add22(c1_12[63:0],s1_13[63:0],c1_13[63:0],s22[63:0],c22[63:0]);
	threeleveladder add23(s1_14[63:0],c1_14[63:0],s1_15[63:0],s23[63:0],c23[63:0]);
	threeleveladder add24(c1_15[63:0],s1_16[63:0],c1_16[63:0],s24[63:0],c24[63:0]);
	threeleveladder add25(s1_17[63:0],c1_17[63:0],s1_18[63:0],s25[63:0],c25[63:0]);
	threeleveladder add26(c1_18[63:0],s1_19[63:0],c1_19[63:0],s26[63:0],c26[63:0]);
	threeleveladder add27(s1_110[63:0],c1_110[63:0],pps_11[63:0],s27[63:0],c27[63:0]);
	
	
wire [63:0] s2_21,s2_22,s2_23,s2_24,s2_25,s2_26,s2_27,c2_21,c2_22,c2_23,c2_24,c2_25,c2_26,c2_27 ,pps_21;
dff df21[63:0](s21,clk,1'b0,s2_21);
dff df22[63:0](s22,clk,1'b0,s2_22);
dff df23[63:0](s23,clk,1'b0,s2_23);
dff df24[63:0](s24,clk,1'b0,s2_24);
dff df25[63:0](s25,clk,1'b0,s2_25);
dff df26[63:0](s26,clk,1'b0,s2_26);
dff df27[63:0](s27,clk,1'b0,s2_27);
dff df28[63:0](c21,clk,1'b0,c2_21);
dff df29[63:0](c22,clk,1'b0,c2_22);
dff df210[63:0](c23,clk,1'b0,c2_23);
dff df211[63:0](c24,clk,1'b0,c2_24);
dff df212[63:0](c25,clk,1'b0,c2_25);
dff df213[63:0](c26,clk,1'b0,c2_26);
dff df214[63:0](c27,clk,1'b0,c2_27);
dff df215[63:0](pps_12,clk,1'b0,pps_21);
	dff t2[19:0](ts1,clk,1'b0,ts2);

wire [63:0] s31,s32,s33,s34,s35,c31,c32,c33,c34,c35;

	threeleveladder add31(s2_21[63:0],c2_21[63:0],s2_22[63:0],s31[63:0],c31[63:0]);
	threeleveladder add32(c2_22[63:0],s2_23[63:0],c2_23[63:0],s32[63:0],c32[63:0]);
	threeleveladder add33(s2_24[63:0],c2_24[63:0],s2_25[63:0],s33[63:0],c33[63:0]);
	threeleveladder add34(c2_25[63:0],s2_26[63:0],c2_26[63:0],s34[63:0],c34[63:0]);
	threeleveladder add35(s2_27[63:0],c2_27[63:0],pps_21[63:0],s35[63:0],c35[63:0]);
	
wire [63:0] s3_31,s3_32,s3_33,s3_34,s3_35,c3_31,c3_32,c3_33,c3_34,c3_35;
dff df31[63:0](s31,clk,1'b0,s3_31);
dff df32[63:0](s32,clk,1'b0,s3_32);
dff df33[63:0](s33,clk,1'b0,s3_33);
dff df34[63:0](s34,clk,1'b0,s3_34);
dff df35[63:0](s35,clk,1'b0,s3_35);
dff df36[63:0](c31,clk,1'b0,c3_31);
dff df37[63:0](c32,clk,1'b0,c3_32);
dff df38[63:0](c33,clk,1'b0,c3_33);
dff df39[63:0](c34,clk,1'b0,c3_34);
dff df310[63:0](c35,clk,1'b0,c3_35);

	dff t3[19:0](ts2,clk,1'b0,ts3);

wire [63:0] s41,s42,s43,c41,c42,c43;

	threeleveladder add41(s3_31[63:0],c3_31[63:0],s3_32[63:0],s41[63:0],c41[63:0]);
	threeleveladder add42(c3_32[63:0],s3_33[63:0],c3_33[63:0],s42[63:0],c42[63:0]);
	threeleveladder add43(s3_34[63:0],c3_34[63:0],s3_35[63:0],s43[63:0],c43[63:0]);

wire [63:0] s4_41,s4_42,s4_43,c4_41,c4_42,c4_43  ,c4_35;
dff df41[63:0](s41,clk,1'b0,s4_41);
dff df42[63:0](s42,clk,1'b0,s4_42);
dff df43[63:0](s43,clk,1'b0,s4_43);
dff df44[63:0](c41,clk,1'b0,c4_41);
dff df45[63:0](c42,clk,1'b0,c4_42);
dff df46[63:0](c43,clk,1'b0,c4_43);
dff df47[63:0](c3_35,clk,1'b0,c4_35);

	dff t4[19:0](ts3,clk,1'b0,ts4);

wire [63:0] s51,s52,c51,c52;

	threeleveladder add51(s4_41[63:0],c4_41[63:0],s4_42[63:0],s51[63:0],c51[63:0]);
	threeleveladder add52(c4_42[63:0],s4_43[63:0],c4_43[63:0],s52[63:0],c52[63:0]);

wire [63:0] s5_51,s5_52,c5_51,c5_52  ,c5_35;
dff df51[63:0](s51,clk,1'b0,s5_51);
dff df52[63:0](s52,clk,1'b0,s5_52);
dff df53[63:0](c51,clk,1'b0,c5_51);
dff df54[63:0](c52,clk,1'b0,c5_52);
dff df55[63:0](c4_35,clk,1'b0,c5_35);

	dff t5[19:0](ts4,clk,1'b0,ts5);

wire [63:0] s61,c61;

	threeleveladder add61(s5_51[63:0],c5_51[63:0],s5_52[63:0],s61[63:0],c61[63:0]);

wire [63:0] s71,c71;

	threeleveladder add71(s61[63:0],c61[63:0],c5_52[63:0],s71[63:0],c71[63:0]);

wire [63:0] s81,c81;

	threeleveladder add81(s71[63:0],c71[63:0],c5_35[63:0],s81[63:0],c81[63:0]);

wire [63:0] s8_81,c8_81;
dff df61[63:0](s81,clk,1'b0,s8_81);
dff df62[63:0](c81,clk,1'b0,c8_81);

	dff t6[19:0](ts5,clk,1'b0,ts6);

//always @ c8_81
//$display("%d %b %b %b",$time,c8_81,s8_81,ts6);
wire cout;
sixtyfour_bit_Recursive_Carry_Adder cla(mulproduct,cout,s8_81,c8_81,clk , ts6 ,ts);


endmodule
/*
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
*/
