//`include "Myfinal_32cla.v"
//`include "adder_32piped.v"
`include "adder_piped.v"
`include "Shifter.v"

module fadder(out,inpA,inpB,clk);
	output reg [31:0]out;
    input [31:0] inpA,inpB;
	input clk;
    wire [31:0] nu1,nu2,num1,num2;
	getlarge gl(nu1,nu2,inpA,inpB);

	dff df10[31:0](nu1,clk,1'b0,num1); //stage1
	dff df11[31:0](nu2,clk,1'b0,num2);

    wire s1,s2;				//signs
    wire [7:0] exp1,exp2;   //exponents
    wire [22:0] man1,man2;  //mantissas
    assign s1 = num1[31];
    assign exp1 = num1[30:23];
    assign man1 = num1[22:0];
    assign s2 = num2[31];
    assign exp2 = num2[30:23];
    assign man2 = num2[22:0];
    wire  [7:0]change;			//to store the shift needed
    assign change = exp1-exp2;
    wire [31:0] fullman1,fullman2,newfullman2;
    assign fullman1 = {|exp1,man1};   //to add 1, if all 0 in exp,then no 1 in begining 
    assign fullman2 = {|exp2,man2};   
    //shifter shift0(fullman2,change,newfullman2);
	thirtyTwoBitShifter shift0(newfullman2,fullman2,change[5:0]);    
	wire [31:0]finalfullman2;
	assign signcheck =s1^s2;
    assign finalfullman2 = {32{signcheck}}^newfullman2;

    wire [31:0] fullman1_1,finalfullman2_2;
	wire [7:0]exp1_2,exp1_3;
	wire signcheck_1,s1_1;	
    wire [31:0] num1_2,num2_2;    
	dff df20[31:0](fullman1,clk,1'b0,fullman1_1);				//stage2
	dff df21[31:0](finalfullman2,clk,1'b0,finalfullman2_2);
	dff df22[7:0](exp1,clk,1'b0,exp1_2);
	dff df23(signcheck,clk,1'b0,signcheck_1);
	dff df24(s1,clk,1'b0,s1_1);
	dff df25[31:0](num1,clk,1'b0,num1_2);
	dff df26[31:0](num2,clk,1'b0,num2_2);



	wire [31:0]mansum,mansum_1,num1_3,num2_3,num1_22,num2_22;
	wire [7:0] exp1_22;
    wire cout,s1_2,s1_11;
	thirtytwo_bit_Recursive_Carry_Adder adder(mansum,cout,signcheck_1,fullman1_1,finalfullman2_2,clk, exp1_22,s1_11,num1_22,num2_22,exp1_2,s1_1,num1_2,num2_2);       // Sending all to pass through the adder pipelines 




	dff df30[31:0](mansum,clk,1'b0,mansum_1);				//stage3
	dff df31[7:0](exp1_22,clk,1'b0,exp1_3);
	dff df32(s1_11,clk,1'b0,s1_2);
	dff df33[31:0](num1_22,clk,1'b0,num1_3);
	dff df34[31:0](num2_22,clk,1'b0,num2_3);

	reg [22:0] outman,tman;
    reg [7:0]outexp;
    integer c =0;
    always @(mansum_1)		//final adjstment of decimal point
    begin
		//$display("here :%d %b %b %b %b %b",$time,num1_3,num2_3,mansum,exp1_3,s1_2);
        if(mansum_1[24]==1)
        begin
        outman = mansum_1[23:1];
        outexp = exp1_3 + 1'b1;
        end
        else if(mansum_1[23]==0)
        begin
        c = 1;
        while(mansum_1[23-c] == 1'b0)
        begin
        c = c+1;
        end
        outexp = exp1_3 - c;
        tman = mansum_1[22:0];
        outman = tman<<c;
        end
        else
        begin
        outman = mansum_1[22:0];
        outexp = exp1_3;
        end
    end	

	wire [22:0] outman_1;
    wire [7:0]outexp_1;
	wire [31:0]mansum_2,num1_4,num2_4;
	wire s1_3;
	wire isnan,isinf;
	is_nan l1(isnan,num1_3,num2_3);
	is_inf l2(isinf,num1_3,num2_3,isnan);
	wire isnan_1,isinf_1;

	dff df42[31:0](mansum_1,clk,1'b0,mansum_2);
	dff df43(s1_2,clk,1'b0,s1_3);
	dff df44[31:0](num1_3,clk,1'b0,num1_4);
	dff df45[31:0](num2_3,clk,1'b0,num2_4);
	dff df46(isnan,clk,1'b0,isnan_1);
	dff df47(isinf,clk,1'b0,isinf_1);
	dff df40[22:0](outman,clk,1'b0,outman_1);			//stage 4
	dff df41[7:0](outexp,clk,1'b0,outexp_1);

	
    always @(outexp_1 or outman_1 )
    begin
		//$display("here2 :%d %b %b %b %b %b %b",$time,outexp_1,outman_1,s1_3,mansum_2,isnan,isinf);
    //out = {s1_3,{8{|mansum_2}} & outexp_1,outman_1};	
	out = isnan_1 ? 32'b01111111100000000000000000000001:(isinf_1 ? 32'b01111111100000000000000000000000 :({s1_3,{8{|mansum_2}} & outexp_1,outman_1}));    
	end
	
endmodule

module getlarge(
output reg [31:0] num1,num2,
input [31:0] inpA,inpB);
 	always @(inpA | inpB)					// To get greater magnitude number as num1
    begin
        if(inpA[30:0]>inpB[30:0])
        begin
        num1 = inpA;
        num2 = inpB;
        end
        else
        begin
        num2 = inpA;
        num1 = inpB;
        end
    end
endmodule

/*module dff(d,clk,clear,q); 
input d, clk, clear; 
output reg q; 
always@(posedge clk) 
begin
if(clear== 1)
q <= 0;
else 
q <= d; 
end 
endmodule

module shifter(input [31:0]inp,input [7:0]s,output [31:0]out);
assign out = inp>>s;
endmodule
*/

module is_nan (output out,input[31:0]a,input[31:0]b);
    assign out = ((&a[30:23] == 1'b1) && (|a[22:0] == 1'b1))||((&b[30:23] == 1'b1) && (|b[22:0] == 1'b1)) ? 1'b1 : 1'b0;
    
endmodule

module is_inf (output out,input[31:0]a,input[31:0] b,input isnan);
    assign out = ((&a[30:23] == 1'b1) && !isnan)||((&b[30:23] == 1'b1) && !isnan) ? 1'b1 : 1'b0;
endmodule



