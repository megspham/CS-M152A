 `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:30:09 02/28/2022 
// Design Name: 
// Module Name:    next_state 
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


module next_state(
    input clk_in,
	input [5:0] initial_state,
	input play,
    output [5:0] next_state
    );
	 
	 reg [5:0] buffer;
	 reg [5:0] temp_state;
	 
	 initial
	 begin
		buffer <= initial_state;
		temp_state <= initial_state;
	 end
	 
	 always @(posedge clk_in)
	 begin
		buffer = buffer + initial_state;
		if(play == 1)
			temp_state = buffer;
	 end
	 assign next_state = temp_state;
	
endmodule