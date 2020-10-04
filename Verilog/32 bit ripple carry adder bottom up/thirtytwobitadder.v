`include "sixteenbitadder.v"

module thirtytwobitadder (a, b, c, sum, carry);
input [31:0] a, b;
input c;
output [31:0] sum;
output carry;
wire c1;
sixteenbitadder sa_0(a[15:0], b[15:0], c, sum[15:0], c1);
sixteenbitadder sa_1(a[31:16], b[31:16], c1, sum[31:16], carry);

endmodule