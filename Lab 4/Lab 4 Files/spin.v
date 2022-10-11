`timescale 1ns/1ps
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module spin(
	//megan: removed score and scoer mode
	input wire rst,
	input wire clk_in,
	input wire clk_ten,
	input wire clk_ele,
	input wire clk_twe,
	input wire clk_thi,
	input wire play,

	output wire [3:0] l,
	output wire [3:0] lm,
	output wire [3:0] rm,
	output wire [3:0] r,
	output wire end1,
	output wire end2,
	output wire end3,
	output wire end4
    );

// wire clock;

//reg [5:0] counter = 0;
//wire [3:0] limit;

reg temp; 

reg [3:0] left;
reg [3:0] left_mid;
reg [3:0] right_mid;
reg [3:0] right;

 wire [3:0] tl;
 wire [3:0] tlm;
 wire [3:0] trm;
 wire [3:0] tr;

wire end11;
wire end22;
wire end33;
wire end44;

wire [5:0] state1;
wire [5:0] state2;
wire [5:0] state3; 
wire [5:0] state4;

next_state ns1 (
	.clk_in(clk_in),
	.initial_state(6'b001111),
	.play(play),
	.next_state(state1)
);

next_state ns2 (
	.clk_in(clk_in),
	.initial_state(6'b001100),
	.play(play),
	.next_state(state2)
);

next_state ns3 (
	.clk_in(clk_in),
	.initial_state(6'b001101),
	.play(play),
	.next_state(state3)
);

next_state ns4 (
	.clk_in(clk_in),
	.initial_state(6'b001011),
	.play(play),
	.next_state(state4)
);

random r1 (
	.out(tl),
	.clk(clk_ten),
	.limit(6'b100100),
	.stop(end11),
	.play(play),
	.reset(rst),
	.seed(state1)
);

random r2 (
	.out(tlm),
	.clk(clk_ele),
	.limit(6'b101011),
	.stop(end22),
	.play(play),
	.reset(rst),
	.seed(state2)
);

random r3 (
	.out(trm),
	.clk(clk_thi),
	.limit(6'b111111),
	.stop(end33),
	.play(play),
	.reset(rst),
	.seed(state3)
);

random r4 (
	.out(tr),
	.clk(clk_twe),
	.limit(6'b111111),
	.stop(end44),
	.play(play),
	.reset(rst),
	.seed(state4)
);


//added 
//always @(posedge clk_in or posedge rst)
//begin
//
//	if(rst) begin
//		l =0;
//		rm = 0;
//		lm =0;
//		l =0;
//	end
//	
//end
//


assign end1 = end11;
assign end2 = end22;
assign end3 = end33;
assign end4 = end44;

assign l = tl;
assign lm = tlm;
assign rm = trm;
assign r = tr;

endmodule



