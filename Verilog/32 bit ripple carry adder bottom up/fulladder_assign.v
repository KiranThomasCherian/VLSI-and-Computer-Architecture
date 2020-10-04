module fullAdder(a, b, c, sum, carry);
input a, b, c;
output sum, carry;
assign sum = a ^ b ^ c;
assign carry = (a & b) | (a & c) | (b & c);

endmodule
