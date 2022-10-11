`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:40 02/09/2022 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(
	input clk_in,
	input butt,
	output state
    );


reg butt_state = 0;

reg [15:0] butt_reg;

always @ (posedge clk_in) begin
	if (butt == 0) begin
		butt_state <= 0;
	end
	else begin 
		butt_reg <= butt_reg + 1'b1;
		if (butt_reg == 16'b1111111111111111) begin
			butt_state <= ~butt_state;
			butt_reg <= 0;
		end
	end
end	

assign state = butt_state;

endmodule
