
`include "adder_32piped.v"
module cla_testbench;
reg [31:0] a, b;
reg cin;
reg clk;
wire [31:0] sum;
wire cout;

thirtytwo_bit_Recursive_Carry_Adder adder(sum[31:0],cout,a[31:0],b[31:0],clk);
initial
begin
  $display("\t\t\t\t	a +	b	=	sum 	,	carryout");
end

initial 
begin
		clk = 1;
		forever begin
			#1 clk = ~clk;
		end
end
    
initial
begin
      a='b10101010101010101010101010101010; b='b01010101010101010101010101010101;
  #2 a='b11111111111111111111111111111111; b='b11111111111111111111111111111111;
  #2 a='b00000000000000000000000000000000; b='b11111111111111111111111111111111;
  #2 a='b11001100110011001100110011001100; b='b11000000000001100000000000111101; 
#50 $finish;

end

initial
begin
  $monitor("%d - %b + %b = %b cout= %b ",$time, a[31:0],b[31:0],sum[31:0],cout);
end
endmodule
