`include "thirtytwobitadder.v"
module top;
reg [31:0] a,b;
reg c;
wire [31:0] sum;
wire carry;
thirtytwobitadder sa_0 (a, b, c, sum, carry);
initial
begin
	a = 32'b00000000000000000000000000000000;
	#5 b = 32'b00000000000000000000000000000000;
	#5 c = 1'b0;
	#5 a=32'b11111111111111111111111111111111;
	#5 b=32'b11111111111111111111111111111111;
	#5 c=1'b1;
	#5 a=32'b10101010101010101010101010101010;
    #5 b=32'b01010101010101010101010101010101;
end
initial
	$monitor ($time, "  a = %b; b = %b; c = %b; sum = %b; carry = %b", a, b, c, sum, carry);

endmodule

