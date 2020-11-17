
`include "sklansky16bit.v"
module cla_testbench;
reg [15:0] a, b;
reg cin;
wire [15:0] sum;
wire cout;

sixteenbit_sklansky_adder ssa(sum[15:0],cout,a[15:0],b[15:0]);
initial
begin
  $display("	a +	b	=	sum 	,	carryout");
end
    
initial
begin
      a='b1111111111111111; b='b1111111111111111;
  #30 a='b0000000000000000; b='b1111111111111111;
  #30 a='b1010101010101010; b='b0101010101010101;
  #30 a='b1100110011001100; b='b1100000000000110;
  #30 a='b1100110011001100; b='b0000000000000000; 
  #30 a='b1000000000000000; b='b1000000000000000;
  #30 a='b0000; b='b00111;

end

initial
begin
  $monitor(" %b + %b = %b cout= %b ", a[15:0],b[15:0],sum[15:0],cout);
end
endmodule
