`include "fourbitadder.v"
module top;
reg [3:0] a,b;
reg c;
wire [3:0] sum;
wire carry;
fourbitadder fa_0 (a, b, c, sum, carry);
initial
begin
	a = 4'b0000;
	#5 b = 4'b0000;
	#5 c = 1'b0;
	#5 a=4'b1111;
	#5 b=4'b1111;
	#5 c=1'b1;
	#5 a=4'b1010;
end
initial
	$monitor ($time, "  a = %b; b = %b; c = %b; sum = %b; carry = %b", a, b, c, sum, carry);

endmodule

