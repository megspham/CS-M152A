`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:30:09 02/28/2022 
// Design Name: 
// Module Name:    blinkLeds
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
module blinkLeds(	
	input wire clk_in, 
	input wire rst,
	//input wire dir,
	output [7:0] Led //there are 8
    );

reg [30:0] count;

always @(posedge clk_in or posedge rst) begin
	if (rst == 1)
		count<=0; 
	else if (count == 31'b1111111111111111111111111111111)
		count<=0;
	else 
		count <=count +1;
end 

	assign Led[0] = count[30];
	assign Led[1] = count[29];
	assign Led[2] = count[28];
	assign Led[3] = count[27];
	assign Led[4] = count[26];
	assign Led[5] = count[25];
	assign Led[6] = count[24];
	assign Led[7] = count[23];

endmodule
