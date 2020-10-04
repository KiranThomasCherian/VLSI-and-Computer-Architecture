`include "fulladder.v"

module fourbitadder(a,b,c,sum,carry);
input [3:0] a,b;
input c;
output [3:0] sum;
output carry;
wire c1, c2, c3;
fulladder fa_0 (a[0], b[0], c, sum[0], c1);
fulladder fa_1 (a[1], b[1], c1, sum[1], c2);
fulladder fa_2 (a[2], b[2], c2, sum[2], c3);
fulladder fa_3 (a[3], b[3], c3, sum[3], carry);

endmodule

