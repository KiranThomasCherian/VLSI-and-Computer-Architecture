/*`include "wallacemultiplier.v"

module wallance_tb;
reg [31:0] a,b;
wire [63:0] product;

thirty_two_wallace_multipiler wallace(product[63:0],a[31:0],b[31:0]);

initial
begin
  $display("	\t\t\t\t\tWALLANCE MULTIPLIER (32 BIT)\n\n   ");
end

initial
begin
      a=32'b00000000000000000000000000000000; b=32'b11111111111111111111111111111111;
  #30 a=32'b10101010101010101010101010101010; b=32'b01010101010101010101010101010101;
  #30 a=32'b00000000000000000000000100000000; b=32'b00000000000000000000000100000000;
  #30 a=32'b00001100110011001100110011001100; b=32'b11000000000001100000000000111101;
  #30 a=32'b11001100110011001100110011001100; b=32'b00000000000000000000111111111111; 

end

initial
begin
  $monitor(" %b * %b \n= %b \n\n (i.e %d * %d = %d) \n\n\n", a[31:0],b[31:0],product[63:0],a[31:0],b[31:0],product[63:0]);
end


endmodule*/

//`include "wallacemultiplier.v"
`include"wallacemultiplier_fullpiped.v"
module wallance_tb;
reg [31:0] a,b;
wire [63:0] product;
reg clk;

thirty_two_wallace_multipiler wallance(product[63:0],a[31:0],b[31:0],clk);

initial
begin
  $display("	WALLANCE MULTIPLIER -32 BIT   ");
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
      a=32'b00000000000000000000000000000000; b=32'b11111111111111111111111111111111;
  #2 a=32'b10101010101010101010101010101010; b=32'b01010101010101010101010101010101;
//  #2 a=32'b00001100110011001100110011001100; b=32'b11000000000001100000000000111101;
  #2 a=32'b11001100110011001100110011001100; b=32'b00000000000000000000111111111111; 
#100 $finish;
end

initial
begin
  $monitor("%d- %b * %b \n\t\t\t\t= %b \n\t\t\t\t (i.e %d * %d = %d) \n\n\n",$time, a[31:0],b[31:0],product[63:0],a[31:0],b[31:0],product[63:0]);
end

endmodule

