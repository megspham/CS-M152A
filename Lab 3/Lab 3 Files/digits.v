// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module digits(
	input wire rst,
	input wire clk_in,
	input wire clk_adj, 
	input wire adjust,
	input wire pause,
	input wire select,
	input wire clk_one,

	output wire [3:0] min0,
	output wire [3:0] min1,
	output wire [3:0] sec0,
	output wire [3:0] sec1
    );

wire clock;

reg [3:0] min_0;
reg [3:0] min_1;
reg [3:0] sec_0;
reg [3:0] sec_1;
//reg pause_state;

clock_type clktype (
	.clk_in(clk_in),
	.clk_adj(clk_adj),
	.adj(adjust),
	.clk_one(clk_one),
	.clock(clock)
);




always @ (posedge clock or posedge rst) begin
	if (rst) begin
		min_0 <= 4'b0000;
		min_1 <= 4'b0000;
		sec_0 <= 4'b0000;
		sec_1 <= 4'b0000;
	end 
	else if (adjust == 0 && pause==0)
	begin
		if (sec_0 ==4'b1001 && sec_1 == 4'b0101)
		begin
			sec_0 <=0 ;
			sec_1 <=0; 
			if (min_0 ==4'b1001 && min_1 == 4'b0101)
				begin
					min_0 <= 0;
					min_1 <=0;
				end
			else if (min_0 == 4'b1001)
				begin
				min_0 <=0;
				min_1 <= 1'b1 + min_1;
			end
			else 
				min_0<= 1'b1 + min_0;
		end
		else if (sec_0 == 4'b1001)
		begin
			sec_0 <= 0;
			sec_1 <= 1'b1 + sec_1;
		end
		else 
			sec_0 <= 1'b1 + sec_0;
	end
	// adjust seconds
	else if (adjust == 1 && pause==0 && select == 1) begin
		if (sec_0 ==4'b1001 && sec_1 == 4'b0101)
		begin
			sec_0 <=0 ;
			sec_1 <=0; 
		end
		else if (sec_0 == 4'b1001)
		begin
			sec_0 <= 0;
			sec_1 <= 1'b1 + sec_1;
		end
		else 
			sec_0 <= 1'b1 + sec_0;
	end
	// adjust minutes
	else if (adjust == 1 && pause==0 && select == 0) begin
		if (min_0 ==4'b1001 && min_1 == 4'b0101)
		begin
			min_0 <=0;
			min_1 <=0; 
		end
		else if (min_0 == 4'b1001)
		begin
			min_0 <= 0;
			min_1 <= 1'b1 + min_1;
		end
		else 
			min_0 <= 1'b1 + min_0;
	end else if (pause == 1) begin
		// do nothing
		end

end 
	assign sec0 = sec_0;
	assign sec1 = sec_1;
	assign min0 = min_0;
	assign min1 = min_1;

endmodule
