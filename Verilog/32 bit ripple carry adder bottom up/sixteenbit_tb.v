`include "sixteenbitadder.v"
module top;
reg [15:0] a,b;
reg c;
wire [15:0] sum;
wire carry;
sixteenbitadder sa_0 (a, b, c, sum, carry);
initial
begin
	a = 16'b0000000000000000;
	#5 b = 16'b0000000000000000;
	#5 c = 1'b0;
	#5 a=16'b1111111111111111;
	#5 b=16'b1111111111111111;
	#5 c=1'b1;
	#5 a=16'b1010101010101010;
end
initial
	$monitor ($time, "  a = %b; b = %b; c = %b; sum = %b; carry = %b", a, b, c, sum, carry);

endmodule

