`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:50:05 03/10/2022
// Design Name:   vegas
// Module Name:   C:/Xilinx/14.7/vegassim/vegasTB.v
// Project Name:  vegassim
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vegas
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vegasTB;

	// Inputs
	reg rst;
	reg clk_in;
	reg play;
	reg score_mode;
	reg direction;

	// Outputs
	wire [7:0] Led;
	wire [7:0] seven_segment;
	wire [3:0] anode_reg;
	wire [7:0] scoreSeven_segment;
	wire [3:0] scoreAnode_reg;

	// Instantiate the Unit Under Test (UUT)
	vegas uut (
		.rst(rst), 
		.clk_in(clk_in), 
		.play(play), 
		.score_mode(score_mode), 
		.direction(direction), 
		.Led(Led), 
		.seven_segment(seven_segment), 
		.anode_reg(anode_reg), 
		.scoreSeven_segment(scoreSeven_segment), 
		.scoreAnode_reg(scoreAnode_reg)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		clk_in = 0;
		play = 0;
		score_mode = 0;
		direction = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		clk_in =1;
		rst=0;
        
		// Add stimulus here

	end
		always clk_in = #5 ~clk_in;
      
endmodule

