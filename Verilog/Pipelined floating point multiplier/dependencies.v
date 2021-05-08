module check_inf_zero_non(
output reg i,z,n, 	
input [31:0] num1,		
input [31:0] num2);

always @(num1 or num2)
begin
if (((|num1)&(|num2)) ==1'b0)
z =1'b1;
else
z =1'b0;

if (((&num1[30:23])|(&num2[30:23])) ==1'b1)
i =1'b1;
else
i =1'b0;

if (((&num1[30:23] == 1'b1) && (|num1[22:0] == 1'b1))||((&num2[30:23] == 1'b1) && (|num2[22:0] == 1'b1)))
n =1'b1;
else
n =1'b0;

//$display("z i%d %b %b",$time,z,i);*/

//assign z=(((|num1)&(|num2)) ==1'b0)?1'b1:1'b0;
//assign i=(((&num1[30:23])|(&num2[30:23])) ==1'b1)?1'b1:1'b0;
//assign n=(((&num1[30:23] == 1'b1) && (|num1[22:0] == 1'b1))||((&num2[30:23] == 1'b1) && (|num2[22:0] == 1'b1)))?1'b1:1'b0;
end
endmodule


module final(
output reg [31:0] product,
input i,z,n,sign,
input [7:0]exp,
input [22:0]mantessa);

always @(sign or exp or mantessa)
begin
//$display("%d %b %b %b",$time,sign,exp,mantessa);
if(n==1'b1)
product ={sign,31'b1111111100000000000000000000001};
if(i==1'b1)
product ={sign,31'b1111111100000000000000000000000};
else if(z==1'b1)
product ={sign,31'b0};
else
product={sign,{8{|mantessa}} & exp,mantessa};
end
endmodule




