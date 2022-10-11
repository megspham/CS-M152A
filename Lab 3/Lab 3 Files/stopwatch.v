`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:11:32 02/09/2022 
// Design Name: 
// Module Name:    stopwatch 
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
module stopwatch(
    input rst,
    input clk_in,
    input select,
    input pause,
    input adjust,
    output [7:0] seven_segment,
    output [3:0] anode_reg
    );

wire rst_state;
 wire pause_state;

debouncer rst_butt(.clk_in(clk_in), .butt(rst), .state(rst_state));
debouncer pause_butt(.clk_in(clk_in), .butt(pause), .state(pause_state));

wire one_clock;
wire two_clock;
wire fast_clock;
wire blink_clock;

clks clocks(.clk_in(clk_in), .rst(rst), .clk_1(one_clock), .clk_2(two_clock), .clk_f(fast_clock), .clk_b(blink_clock));

reg p=0;
always @ (posedge pause_state) begin
//	if (pause) begin
		p <= ~p;
	//end
end

wire [3:0] min_0;
wire [3:0] min_1;
wire [3:0] sec_0;
wire [3:0] sec_1;

digits deez(.rst(rst), .clk_in(clk_in), .clk_one(one_clock), .clk_adj(two_clock), .adjust(adjust), .pause(p), .select(select), .min0(min_0), .min1(min_1), .sec0(sec_0), .sec1(sec_1));

wire [7:0] seven_seg_min_0;
wire [7:0] seven_seg_min_1;
wire [7:0] seven_seg_sec_0;
wire [7:0] seven_seg_sec_1;

seven_segment min0(.clk_in(clk_in), .dig(min_0), .num(seven_seg_min_0));
seven_segment min1(.clk_in(clk_in), .dig(min_1), .num(seven_seg_min_1));
seven_segment sec0(.clk_in(clk_in), .dig(sec_0), .num(seven_seg_sec_0));
seven_segment sec1(.clk_in(clk_in), .dig(sec_1), .num(seven_seg_sec_1));

show_segments nuts(.fast_clock(fast_clock), .blink_clock(blink_clock), .select(select), .adjust(adjust), .min1(seven_seg_min_1), .min0(seven_seg_min_0), .sec1(seven_seg_sec_1), .sec0(seven_seg_sec_0), .anode_final(anode_reg), .cathode_final(seven_segment));

endmodule
