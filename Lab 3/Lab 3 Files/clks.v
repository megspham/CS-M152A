`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:10 01/23/2022 
// Design Name: 
// Module Name:    clks 
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
module clks(
	input clk_in,
	input rst,
	output wire clk_1,
	output wire clk_2,
	output wire clk_f, 
	output wire clk_b
	
    );
	 
	wire one;
	wire two;
	wire fast;
	wire blink;
	 
clk_one clk1 (
	.clk_in(clk_in),
	.rst(rst),
	.clk_one(one)
	);
	
clk_two clk2 (
	.clk_in (clk_in),
	.rst(rst),
	.clk_two(two)
);

clk_fst clkf (
	.clk_in (clk_in),
	.rst(rst),
	.clk_fst(fast)
);

clk_blk clkb (
	.clk_in (clk_in),
	.rst(rst),
	.clk_blk(blink)
);

assign clk_1 = one ;
assign clk_2 = two;
assign clk_f = fast;
assign clk_b = blink; 
	
endmodule


module clk_one(clk_in, rst, clk_one);
	input clk_in, rst;
	output reg clk_one;
	
	reg[25:0] count;
	
	always @ (posedge clk_in)
	begin
		if (rst) begin
			count <= 0;
			clk_one <= 0;
		end else if (count == 26'b10111110101111000001111111) begin
			count<=0;
			clk_one <= ~clk_one;
		end else begin
			count <= count + 1'b1;
		end
	end
endmodule

module clk_two(clk_in, rst, clk_two);
	input clk_in, rst;
	output reg clk_two;
	
	reg[24:0] count;
	
	always @ (posedge clk_in)
	begin
		if (rst) begin
			count <= 0;
			clk_two <= 0;
		end else if (count == 25'b1011111010111100000111111) begin
			count<=0;
			clk_two <= ~clk_two;
		end else begin
			count <= count + 1'b1;
		end
	end
endmodule

// clk_500hz 
module clk_fst(clk_in, rst, clk_fst);
	input clk_in, rst;
	output reg clk_fst;
	
	reg[16:0] count;
	
	always @ (posedge clk_in)
	begin
		if (rst) begin
			count <= 0;
			clk_fst <= 0;
		end else if (count == 17'b11000011010100000) begin
			count<=0;
			clk_fst <= ~clk_fst;
		end else 
			count <= count + 1'b1;
	end
endmodule

//1.8hz
module clk_blk(clk_in, rst, clk_blk);
	input clk_in, rst;
	output reg clk_blk;
	
	reg[24:0] count;
	
	always @ (posedge clk_in)
	begin
		if (rst) begin
			count <= 0;
			clk_blk <= 0;
		end else if (count == 25'b1101001111101101011110001) begin
			count<=0;
			clk_blk <= ~clk_blk;
		end else 
			count <= count + 1'b1;	
	end
endmodule