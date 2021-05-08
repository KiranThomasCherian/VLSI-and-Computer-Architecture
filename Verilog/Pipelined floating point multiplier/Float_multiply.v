`include "wallacemultiplier_fullpiped.v"
`include "dependencies.v"
//`include "cla8bit.v"

module fmultiplier(
//output [7:0] e,
output [31:0] product, 	
input [31:0] num1,		
input [31:0] num2,
input clk);

wire i,z,n,i2,z2,n2,i3,z3,n3,i33,z33,n33,i4,z4,n4;				//infinity,zero
//check_inf_zero_non iz(i,z,n,num1,num2);


//always @ (z or i )
//$display("1 %d %b %b ",$time,z,i);

wire s1,s2,s1_2,s2_2;				//signs
wire [7:0] exp1,exp2,exp1_2,exp2_2,exp1_3,exp2_3,exp1_33,exp2_33,exp1_4,exp2_4;   //exponents
wire [22:0] man1,man2,man1_2,man2_2;  //mantissas
assign s1 = num1[31];
assign exp1 = num1[30:23];
assign man1 = num1[22:0];
assign s2 = num2[31];
assign exp2 = num2[30:23];
assign man2 = num2[22:0];
assign z=((|num1 &|num2) ==1'b0)?1'b1:1'b0;
assign i=(((&num1[30:23])|(&num2[30:23])) ==1'b1)?1'b1:1'b0;
assign n=(((&num1[30:23] == 1'b1) && (|num1[22:0] == 1'b1))||((&num2[30:23] == 1'b1) && (|num2[22:0] == 1'b1)))?1'b1:1'b0;

    dff df11(s1,clk,1'b0,s1_2);
    dff df12(s2,clk,1'b0,s2_2);
    dff df13[7:0](exp1,clk,1'b0,exp1_2);
    dff df14[7:0](exp2,clk,1'b0,exp2_2);
    dff df15[22:0](man1,clk,1'b0,man1_2);
    dff df16[22:0](man2,clk,1'b0,man2_2);
    dff df17(i,clk,1'b0,i2);
    dff df18(z,clk,1'b0,z2);
    dff df19(n,clk,1'b0,n2);

//always @ (z2 or i2 )
//$display("2 %d %b %b ",$time,z2,i2);

wire [23:0] fullman1,fullman2,newfullman2,fm1,fm2;
assign fullman1 = {|exp1_2,man1_2};   //to add 1, if all 0 in exp,then no 1 in begining 
assign fullman2 = {|exp2_2,man2_2};  
wire sign,sign_2,sign_22,sign_3;
assign sign =s1_2^s2_2;
wire [63:0]manproduct,manproduct1;

    dff df21[23:0](fullman1,clk,1'b0,fm1);
    dff df22[23:0](fullman2,clk,1'b0,fm2);
    dff df23(sign,clk,1'b0,sign_2);
    dff df24[7:0](exp1_2,clk,1'b0,exp1_3);
    dff df25[7:0](exp2_2,clk,1'b0,exp2_3);
    dff df27(i2,clk,1'b0,i3);
    dff df28(z2,clk,1'b0,z3);
    dff df29(n2,clk,1'b0,n3);

	wire [19:0] tempstore,ts,tss;
	assign tempstore={i3,z3,n3,sign_2,exp1_3,exp2_3};

//always @ (tempstore)
//$display("%d %b %b %b",$time,z3,tempstore,sign_2);

thirty_two_wallace_multipiler mul(manproduct,{fm1},{fm2},clk,tempstore ,tss);
wire [47:0]reqproduct,reqproduct2;

//always @ tss
//$display("%d %b %b ",$time,manproduct,tss);

    dff df221[63:0](manproduct,clk,1'b0,manproduct1);
    dff df222[19:0](tss,clk,1'b0,ts);

//always @ (manproduct1 or ts) 
//$display("ts%d %b %b ",$time,manproduct1,ts);

assign reqproduct=manproduct1[47:0];
assign i33=ts[19];
assign z33=ts[18];
assign n33=ts[17];
assign sign_22=ts[16];
assign exp1_33=ts[15:8];
assign exp2_33=ts[7:0];

//always @ reqproduct
//$display("%d %b %b %b",$time,reqproduct,i33,sign_22);
	


    dff df31[7:0](exp1_33,clk,1'b0,exp1_4);
    dff df32[7:0](exp2_33,clk,1'b0,exp2_4);
    dff df33[47:0](reqproduct,clk,1'b0,reqproduct2);
    dff df34(i33,clk,1'b0,i4);
    dff df35(z33,clk,1'b0,z4);
    dff df36(n33,clk,1'b0,n4);
    dff df37(sign_22,clk,1'b0,sign_3);

	
	wire [31:0]pro;
	wire [22:0]mantessa;
	wire [7:0]outexp;
	//always @ reqproduct2
	//begin
    assign outexp = reqproduct2[47] ? exp1_4 + exp2_4 - 126 : exp1_4 + exp2_4 - 127;
    assign mantessa = reqproduct2[47] ? reqproduct2[46:24] : reqproduct2[45:23];
	//end

//	final f(product,i4,z4,n4,sign_3 & 1'b1,outexp,mantessa);
/*always @(sign_3 or outexp or mantessa)
begin
//$display("%d %b %b %b",$time,sign_3,outexp,mantessa);
if(n4==1'b1)
pro ={sign_3,31'b1111111100000000000000000000001};
else if(i4==1'b1)
pro ={sign_3,31'b1111111100000000000000000000000};
else if(z4==1'b1)
pro ={sign_3,31'b0};
else
pro={sign_3,{8{|mantessa}} & outexp,mantessa};
end*/

assign pro = n4 ? 32'b01111111100000000000000000000001:(i4 ? 32'b01111111100000000000000000000000: (z4 ? 32'b0 : {sign_3,outexp,mantessa}));

//always @pro
//$display("p%d %b %b %b",$time,sign_3,outexp,mantessa);
//    dff df41[31:0](pro,clk,1'b0,product);
assign product=pro;

endmodule
