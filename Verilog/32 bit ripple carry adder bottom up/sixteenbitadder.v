`include "eightbitadder.v"

module sixteenbitadder (a, b, c, sum, carry);
input [15:0] a, b;
input c;
output [15:0] sum;
output carry;
wire c1;
eightbitadder ea_0 (a[7:0], b[7:0], c, sum[7:0], c1);
eightbitadder ea_1 (a[15:8], b[15:8], c1, sum[15:8], carry);

endmodule