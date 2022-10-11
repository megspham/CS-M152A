 `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:30:09 02/28/2022 
// Design Name: 
// Module Name:    random 
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


module random(
    input clk,
	input [5:0] limit,
	input [5:0] seed,
	input play,
	input reset,
	output reg stop,
    output reg [3:0] out
); 

	reg [19:0] counter;
	reg [12:0] p = 13'b1111000010011;
	reg [12:0] q = 13'b1111010001111;
	reg [12:0] num;
	
	initial begin
		counter = 0;
		out = 0;
		num = 13'b1110110100101;
	end
	
	always @(posedge clk or posedge play or posedge reset) begin
		if (reset) begin
			stop <= 0;
			out = 0;
			end else
		if (play) begin
			counter <= 0;
			stop <= 0;
			out = 0;
			end else
		if (counter == limit) begin
			stop <= 1;
		end else begin
			counter <= counter + 1'b1;
			num = num*p%q + seed;
			out = num%9 + 1;
		end
	end

endmodule 
