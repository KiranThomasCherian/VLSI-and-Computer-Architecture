`include "fourbitadder.v"

module eightbitadder (a, b, c, sum, carry);
input [7:0] a, b;
input c;
output [7:0] sum;
output carry;
wire c1;
fourbitadder ffa_0 (a[3:0],b[3:0],c,sum[3:0],c1);
fourbitadder ffa_1(a[7:4],b[7:4],c1,sum[7:4],carry);

endmodule


