`include "arraymultiplier.v"

module arraymul_tb;
reg [15:0] a,b;
wire [31:0] product;
//wire[15:0][15:0]p;

sixteenbitarraymultiplier mul(product[31:0],a[15:0],b[15:0]);

initial
begin
  $display("	ARRAY MULTIPLIER -16 BIT   ");
end

initial
begin
   a=16'b011111111111111; b=16'b0011111111111111;
 #30 a=16'd3  ; b=16'd4    ;
 #30 a=16'd44 ; b=16'd7258 ;
 #30 a=16'd345; b=16'd83   ;
 #30 a=16'd145; b=16'd853  ;
#30 a=16'b0011111111111111 ;b=16'b0001110001011010;
end

initial
begin
  $monitor(" %b * %b \n= %b \n (i.e %d * %d = %d)", a[15:0],b[15:0],product[31:0],a[15:0],b[15:0],product[31:0]);
end

endmodule
