
module dff( output reg q,input d,input clk,input clr);
	always @ (posedge clk or posedge clr)
       if (clr)
          q <= 1'b0;
       else
          q <= d;
endmodule

module mux(mout,mop,s4,s3,s2,s1);
input s1,s2,s3,s4;
input [1:0]mop;
output mout;
assign mout = mop[1] ? (mop[0] ? s4 : s3) : (mop[0] ? s2 : s1);
endmodule
