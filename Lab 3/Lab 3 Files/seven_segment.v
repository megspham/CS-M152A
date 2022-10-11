`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:35:16 02/09/2022 
// Design Name: 
// Module Name:    seven_segment 
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

	
	
module seven_segment(
	input clk_in,
	input [3:0] dig,
	output [7:0] num
    );
	 
reg [7:0] cathode;

always @ (posedge clk_in) begin
	
	case (dig)
	0: cathode = 8'b00000011;
	1: cathode = 8'b10011111;
	2: cathode = 8'b00100101;
	3: cathode = 8'b00001101;
	4: cathode = 8'b10011001;
	5: cathode = 8'b01001001;
	6: cathode = 8'b01000001;
	7: cathode = 8'b00011111;
	8: cathode = 8'b00000001;
	9: cathode = 8'b00001001;
	default: cathode = 8'b11111111;
	endcase 
end

assign num = cathode; 

endmodule
