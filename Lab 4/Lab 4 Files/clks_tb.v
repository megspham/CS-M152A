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
	reg clk_10;
	reg clk_11;
	reg clk_12;
	reg clk_13;
	reg clk_fst;

	// Instantiate the Unit Under Test (UUT)
	clks uut (
		.clk_in(clk_in), 
		.rst(rst), 
		.clk_10(clk_10), 
		.clk_11(clk_11), 
		.clk_12(clk_12), 
		.clk_13(clk_13), 
		.clk_fst(clk_fst)
	);

	initial begin
		// Initialize Inputs
		clk_in = 0;
		clk_10=0;
		clk_11=0;
		clk_12=0;
		clk_13=0;
		rst = 0;
		clk_fst=0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end

	  always #5 clk_10 = ~clk_10;
	  always #10 clk_11 = ~clk_11;
	  always #10 clk_12 = ~clk_12;
	  always #10 clk_13 = ~clk_13;


endmodule

