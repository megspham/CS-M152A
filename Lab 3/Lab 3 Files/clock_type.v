`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:21:39 01/23/2022 
// Design Name: 
// Module Name:    clock_type 
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
module clock_type(
	input clk_in,
	input clk_adj,
	input wire adj,
	input clk_one,
	output clock
    );

reg clk;
always @ (posedge clk_in) begin
	if (adj)
		clk <= clk_adj;
	else 
		clk <= clk_one;
end 

assign clock = clk;

endmodule
