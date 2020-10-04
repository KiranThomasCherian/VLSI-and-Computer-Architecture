module fullAdder (a, b, c, sum, carry);
input a, b, c;
output sum, carry;
reg sum, carry;
always @(a or b or c)
begin
	sum = a ^ b ^ c;
	carry = (a & b) | (a & c) | (b & c);
end
endmodule
