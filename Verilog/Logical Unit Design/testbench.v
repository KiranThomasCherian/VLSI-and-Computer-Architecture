
`include "lud.v" 

module lu_tb;
reg [31:0] a;
reg [31:0] b;
reg [2:0] opt;
wire [31:0] ans;

lud g1(ans[31:0],opt,a[31:0],b[31:0]);
initial
begin
  $display("	Logic Unit Design \n");
end

initial
begin
    #0  a=32'b01000001000111000000000000000000; b=32'b00111111000100000000000000000000 ; opt =3'b000;	 
  	#10	opt =3'b001;
  	#10	opt =3'b010;
  	#10	opt =3'b011;
  	#10	opt =3'b100;
  	#10	opt =3'b101;
  	#10	opt =3'b110;
  	#10	opt =3'b111;

	#10 a=32'b00111111111000000000000000000000; b=32'b01000001000010000000000000000000; opt =3'b000;
  	#10	opt =3'b001;
  	#10	opt =3'b010;
  	#10	opt =3'b011;
  	#10	opt =3'b100;
  	#10	opt =3'b101;
  	#10	opt =3'b110;
  	#10	opt =3'b111;

//	#20 a=32'b01000001010010000000000000000000; b=32'b11000000101100100000000000000000;
#50 $finish;
end

initial
begin
  $monitor("  %b opt\n  %b \n= %b  operation = %b\n\n", a[31:0],b[31:0],ans[31:0],opt[2:0]);
end

endmodule





//	#100 a=32'b01000000111000000000000000000000; b=32'b11000001000100000000000000000000;  // 7 and -9
