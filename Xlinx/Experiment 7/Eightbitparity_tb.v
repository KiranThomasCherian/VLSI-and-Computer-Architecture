`include "Eightbitparity.v"
module parity_tb;
reg [7:0]in;
wire op,ep;
Eightbitparity ebp_tb(in,ep,op);
initial
begin
	in=8'b10101010;
#10 in=8'b10101011;
#10 in=8'b00000101;
#10 in=8'b01001100;

end
initial
	$monitor ($time, "  input = %b; oddp = %b; evenp = %b;", in,op,ep);
endmodule

