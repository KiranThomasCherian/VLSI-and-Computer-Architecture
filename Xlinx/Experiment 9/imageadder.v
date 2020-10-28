`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:34 10/28/2020 
// Design Name: 
// Module Name:    imageadder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module imageadder(
input clk,
input reset,
input [7:0] data1,
input [7:0] data2,
output [7:0] out1,
output [7:0] out2,
output [7:0] outfinal);

reg [5:0] addr;
reg [5:0] newadd;
	
blk_mem blk1(clk,1'b0,addr,data1,out1);
blk_mem blk2(clk,1'b0,addr,data2,out2);
blk_mem bout(clk,1'b1,newadd,out1+out2,outfinal);
always@(posedge clk)
	begin 
		if (reset == 1)
			begin
				addr =6'b0;
				newadd=6'b0;
			end	
		else
			begin
				addr = addr + 1;
				newadd = addr -1;
			end
	end

endmodule
