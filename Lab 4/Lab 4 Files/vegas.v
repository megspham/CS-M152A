`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:11:32 03/01/2022 
// Design Name: 
// Module Name:    vegas 
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
module vegas(
    input rst,
    input clk_in,
    input play,
    input score_mode,
    input direction,
    output [7:0] Led,
    output [7:0] seven_segment,
    output [3:0] anode_reg,
	output [7:0] scoreSeven_segment,
    output [3:0] scoreAnode_reg

    );

    wire rst_state;
    wire play_state;

	
    debouncer rst_butt(.clk_in(clk_in), .butt(rst), .state(rst_state));
    debouncer play_butt(.clk_in(clk_in), .butt(play), .state(play_state));

	reg p = 0;
	always @(posedge play_state) begin
		p <= ~p;
	end

    wire [3:0] matches = 9;

    blinkLeds blink(.clk_in(clk_in), .rst(rst), .Led(Led));
	//blinkWinningLed blink (.clk_in(clk_in), .rst(rst), .matches(matches), .Led(Led)); 

    wire ten_clock;
	wire ele_clock;
	wire twe_clock;
	wire thi_clock;
	wire fast_clock;

    clks clocks(.clk_in(clk_in), .rst(rst), .clk_10(ten_clock), .clk_fst(fast_clock), .clk_11(ele_clock), .clk_12(twe_clock), .clk_13(thi_clock));
	wire [10:0] score; 
	
    wire [3:0] left;
    wire [3:0] left_mid;
    wire [3:0] right_mid;
    wire [3:0] right;
	 
	wire [3:0] sleft;
    wire [3:0] sleft_mid;
    wire [3:0] sright_mid;
    wire [3:0] sright;


	wire end1;
	wire end2;
	wire end3;
	wire end4;
  
    //megan: removed score and score mode
	spin wee (.rst(rst), .clk_in(clk_in), .clk_ten(ten_clock), .clk_ele(ele_clock), .clk_twe(twe_clock), .clk_thi(thi_clock), .play(p), .l(left), .lm(left_mid), .rm(right_mid), .r(right), .end1(end1), .end2(end2), .end3(end3), .end4(end4));
 
	wire [7:0] seven_seg_min_0;
    wire [7:0] seven_seg_min_1;
    wire [7:0] seven_seg_sec_0;
    wire [7:0] seven_seg_sec_1;

    //megan: added score seven seg
    wire [7:0] seven_seg_sMin_0;
    wire [7:0] seven_seg_sMin_1;
    wire [7:0] seven_seg_sSec_0;
    wire [7:0] seven_seg_sSec_1;
    
	
    //megan: changed ordering, added score
    jackpot jillpot (.clk_in(clk_in), .rst(rst), .res1(left), .res2(left_mid), .res3(right_mid), .res4(right), .enda(end1), .endb(end2), .endc(end3), .endd(end4), .Led(Led), .score(score));

	
	score final (.clk_in(clk_in), .rst(rst), .score(score), .score_mode(score_mode), .sl(sleft), .slm(sleft_mid), .srm(sright_mid), .sr(sright));
    seven_segment min0(.clk_in(clk_in), .dig(left_mid), .num(seven_seg_min_0));
    seven_segment min1(.clk_in(clk_in), .dig(left), .num(seven_seg_min_1));
    seven_segment sec0(.clk_in(clk_in), .dig(right), .num(seven_seg_sec_0));
    seven_segment sec1(.clk_in(clk_in), .dig(right_mid), .num(seven_seg_sec_1));
	 
	 
    seven_segment smin0(.clk_in(clk_in), .dig(sleft_mid), .num(seven_seg_sMin_0));
    seven_segment smin1(.clk_in(clk_in), .dig(sleft), .num(seven_seg_sMin_1));
    seven_segment ssec0(.clk_in(clk_in), .dig(sright), .num(seven_seg_sSec_0));
    seven_segment ssec1(.clk_in(clk_in), .dig(sright_mid), .num(seven_seg_sSec_1));


    //megan: added score digits
    show_segments woo(.rst(rst), .fast_clock(fast_clock), .min1(seven_seg_min_1), .min0(seven_seg_min_0), .sec1(seven_seg_sec_1), .sec0(seven_seg_sec_0), .sMin1(seven_seg_sMin_1), .sMin0(seven_seg_sMin_0), .sSec1(seven_seg_sSec_1), .sSec0(seven_seg_sSec_0), .score_mode(score_mode), .anode_final(anode_reg), .cathode_final(seven_segment));

   
	


endmodule
