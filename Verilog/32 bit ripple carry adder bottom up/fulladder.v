module fulladder(a,b,c,sum,carry);
input a,b,c;
output sum,carry;
wire w1,w2,w3,w4,w5;
xor xor_0 (w1,a,b);
xor xor_1(sum,w1,c);
and and_0(w2,a,b);
and and_1 (w3,a,c);
and and_2 (w4,b,c);
or  or_0 (w5,w2,w3);
or  or_1 (carry,w4,w5);

endmodule


