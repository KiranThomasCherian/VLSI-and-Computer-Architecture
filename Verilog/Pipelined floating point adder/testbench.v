`include "float_adder.v"
module float_adder_tb;
reg [31:0] a;
reg [31:0] b;
reg clk;
wire [31:0] ans;

fadder fadd(ans[31:0],a[31:0],b[31:0],clk);

initial
begin
  $display("	Single precision floating point Adder \n");
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
    #0  a=32'b01000001000111000000000000000000; b=32'b00111111000100000000000000000000;	 //9.75 and 0.5625
	#2 a=32'b01000001010010000000000000000000; b=32'b11000000101100100000000000000000;  //12.5 and -5.5625
	#2 a=32'b11000000011000000000000000000000; b=32'b11000001000010000000000000000000;  //-3.5 and -8.5
	#2 a=32'b00111111111000000000000000000000; b=32'b01000001000010000000000000000000;  //1.75 and 8.5
	#2 a=32'b00000000000000000000000000000000; b=32'b01000011010010001100000000000000;  // 0 and 200.75
	#2 a=32'b01111111100000000000000000000000; b=32'b00111111100000000000010000000000;
	#2 a=32'b00000000000000000000000000000000; b=32'b00000000000000000000000000000000;
#100 $finish;
end

initial
begin
  $monitor("%d  -%b + %b = %b \n\n",$time, a[31:0],b[31:0],ans[31:0]);
end

endmodule





//	#100 a=32'b01000000111000000000000000000000; b=32'b11000001000100000000000000000000;  // 7 and -9