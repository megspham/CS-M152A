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
	output wire clk_10,
	output wire clk_fst,
	output wire clk_11,
	output wire clk_12,
	output wire clk_13
    );
	 
	wire ten;
	wire fast;
	wire ele; 
	wire twe;
	wire thi;
	
clk_ten clk10 (
	.clk_in (clk_in),
	.rst(rst),
	.clk_ten(ten)
);

clk_fst clkf (
	.clk_in (clk_in),
	.rst(rst),
	.clk_fst(fast)
);

clk_ele clk11 (
	.clk_in (clk_in),
	.rst(rst),
	.clk_ele(ele)
);

clk_twe clk12 (
	.clk_in (clk_in),
	.rst(rst),
	.clk_twe(twe)
);

clk_thi clk13 (
	.clk_in (clk_in),
	.rst(rst),
	.clk_thi(thi)
);

assign clk_10 = ten;
assign clk_fst = fast; 
assign clk_11 = ele;
assign clk_12 = twe;
assign clk_13 = thi;
	
endmodule

// module clk_two(clk_in, rst, clk_two);
// 	input clk_in, rst;
// 	output reg clk_two;
	
// 	reg[24:0] count;
	
// 	always @ (posedge clk_in)
// 	begin
// 		if (rst) begin
// 			count <= 0;
// 			clk_two <= 0;
// 		end else if (count == 25'b1011111010111100000111111) begin
// 			count<=0;
// 			clk_two <= ~clk_two;
// 		end else begin
// 			count <= count + 1'b1;
// 		end
// 	end
// endmodule


module clk_ten(clk_in, rst, clk_ten);
	input clk_in, rst;
	output reg clk_ten;
	
	reg[23:0] count;
	
	always @ (posedge clk_in)
	begin
		if (rst) begin
			count <= 0;
			clk_ten <= 0;
		end else if (count == 24'b100110001001011010000000) begin
			count<=0;
			clk_ten <= ~clk_ten;
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


//9
module clk_ele(clk_in, rst, clk_ele);
	input clk_in, rst;
	output reg clk_ele;
	
	reg[23:0] count;
	
	always @ (posedge clk_in)
	begin
		if (rst) begin
			count <= 0;
			clk_ele <= 0;
		end else if (count == 24'b100010010101010001000000) begin
			count<=0;
			clk_ele <= ~clk_ele;
		end else begin
			count <= count + 1'b1;
		end
	end
endmodule

//10.2
module clk_twe(clk_in, rst, clk_twe);
	input clk_in, rst;
	output reg clk_twe;
	
	reg[24:0] count;
	
	always @ (posedge clk_in)
	begin
		if (rst) begin
			count <= 0;
			clk_twe <= 0;
		end else if (count == 25'b100110111010001111000000) begin
			count<=0;
			clk_twe <= ~clk_twe;
		end else begin
			count <= count + 1'b1;
		end
	end
endmodule

//11
module clk_thi(clk_in, rst, clk_thi);
	input clk_in, rst;
	output reg clk_thi;
	
	reg[24:0] count;
	
	always @ (posedge clk_in)
	begin
		if (rst) begin
			count <= 0;
			clk_thi <= 0;
		end else if (count == 25'b101001111101100011000000) begin
			count<=0;
			clk_thi <= ~clk_thi;
		end else begin
			count <= count + 1'b1;
		end
	end
endmodule
