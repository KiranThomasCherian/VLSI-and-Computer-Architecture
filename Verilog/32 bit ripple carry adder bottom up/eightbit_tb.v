`include "eightbitadder.v"
module top;
reg [7:0] a,b;
reg c;
wire [7:0] sum;
wire carry;
eightbitadder ea_0 (a, b, c, sum, carry);
initial
begin
	a = 8'b00000000;
	#5 b = 8'b00000000;
	#5 c = 1'b0;
	#5 a=8'b11111111;
	#5 b=8'b11111111;
	#5 c=1'b1;
	#5 a=8'b10101010;
end
initial
	$monitor ($time, "  a = %b; b = %b; c = %b; sum = %b; carry = %b", a, b, c, sum, carry);

endmodule

