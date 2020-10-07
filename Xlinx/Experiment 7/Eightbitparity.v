`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:03 10/07/2020 
// Design Name: 
// Module Name:    Eightbitparity 
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
module Eightbitparity(
    input [7:0] inputbits,
    output evenp,
    output oddp
    );
assign evenp=^inputbits;
not(oddp,evenp);
endmodule
