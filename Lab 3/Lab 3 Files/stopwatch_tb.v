`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:28:47 02/14/2022
// Design Name:   stopwatch
// Module Name:   C:/Users/Student/Xilinx/lab2_p2g4/stopwatch_tb.v
// Project Name:  lab2_p2g4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: stopwatch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module stopwatch_tb;

	// Inputs
	reg rst;
	reg clk_in;
	reg select;
	reg pause;
	reg adjust;

	// Outputs
	wire [7:0] seven_segment;
	wire [3:0] anode_reg;

	// Instantiate the Unit Under Test (UUT)
	stopwatch uut (
		.rst(rst), 
		.clk_in(clk_in), 
		.select(select), 
		.pause(pause), 
		.adjust(adjust), 
		.seven_segment(seven_segment), 
		.anode_reg(anode_reg)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		clk_in = 0;
		select = 0;
		pause = 0;
		adjust = 0;

		// Wait 100 ns for global reset to finish
		#100;
		clk_in=1;
		rst = 0;
	
        
	end
     //test regular clock
     always #10 clk_in = ~clk_in;
     

     initial begin
	
	//change adj, test minutes
	adjust =1;
	select =0;

	#100
	
	//change adj, test seconds
	adjust =1;
	select =1; 

	#100

	adjust =0; 

	#100

	pause =1;
	#100

	pause=0; 
	rst =1; 

	#100
	rst=0; 
	adjust=0;
	select =0; 
	
   end
     
endmodule

