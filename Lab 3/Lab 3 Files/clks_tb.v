`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:50:20 02/23/2022
// Design Name:   clks
// Module Name:   C:/Users/Student/Xilinx/lab2_p2g4/clks_tb.v
// Project Name:  lab2_p2g4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: clks
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clks_tb;

	// Inputs
	reg clk_in;
	reg rst;

	// Outputs
	reg clk_1;
	reg clk_2;
	reg clk_f;
	reg clk_b;

	// Instantiate the Unit Under Test (UUT)
	clks uut (
		.clk_in(clk_in), 
		.rst(rst), 
		.clk_1(clk_1), 
		.clk_2(clk_2), 
		.clk_f(clk_f), 
		.clk_b(clk_b)
	);

	initial begin
		// Initialize Inputs
		clk_in = 0;
		clk_2=0;
		rst = 0;
		clk_1=0;
		clk_f=0;
		clk_b=0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end

	  always #5 clk_2 = ~clk_2;
	  always #10 clk_1 = ~clk_1;


endmodule

