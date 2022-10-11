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
	input clk_2,
	input clk_10,
	input clk_30,
	input wire speed,
	output clock
    );

reg clk;

always @ (posedge clk_in) begin
	case (speed)
		2: clk <= clk_2;
		10: clk <= clk_10;
		30: clk <= clk_30;
		default: clk <= clk_2;
	endcase
end 

assign clock = clk;

endmodule
