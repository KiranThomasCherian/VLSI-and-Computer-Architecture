`include "fulladder.v"
module top;
reg  a,b;
reg c;
wire sum;
wire carry;
fulladder fa_0 (a, b, c, sum, carry);
initial
begin
	a = 1'b0;
	#5 b = 1'b0;
	#5 c = 1'b0;
	#5 a=1'b1;
	#5 b=1'b1;
	#5 c=1'b1;
	#5 a=1'b0;
    #5 b=1'b0;
end
initial
	$monitor ($time, "  a = %b; b = %b; c = %b; sum = %b; carry = %b", a, b, c, sum, carry);

endmodule

