


module threeleveladder(
	input [63:0]x,
	input [63:0]y,
	input [63:0]z,
	output [63:0]s,
	output [63:0]c);
assign s = x^y^z;
assign c[0] = 1'b0;
assign c[63:1] = (x[63:0]&y[63:0]) | (y[63:0]&z[63:0]) | (z[63:0]&x[63:0]);

endmodule










module partialmulti(
	output reg[31:0][63:0] p,
	input [31:0]a,
	input [31:0]b);
	integer i;
	always @(a or b)
	begin
		for(i=0; i<32; i=i+1)
		begin
			if(b[i] === 1)
			begin
				p[i] <= (a << i);
			end
			else
			 p[i] = 64'b0000000000000000000000000000000000000000000000000000000000000000;
		end
	end
endmodule



