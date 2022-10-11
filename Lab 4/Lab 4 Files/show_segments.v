module show_segments(
	input rst,
	input fast_clock,
	input [7:0] min1,
	input [7:0] min0,
	input [7:0] sec1,
	input [7:0] sec0,
	input [7:0] sMin1, 
	input [7:0] sMin0, 
	input [7:0] sSec1, 
	input [7:0] sSec0,

	input wire score_mode,
	output [3:0] anode_final,
	output [7:0] cathode_final
    );

reg [1:0] position = 0;
reg [3:0] anode;
reg [7:0] cathode;

always @ (posedge fast_clock) begin
				if (score_mode) begin
				if (position == 0) begin
				position <= 2'b1 +position;
						anode <=4'b0111;
						cathode <= sMin1;
					end
					
				 else if (position == 1) begin
				position <= 2'b1 +position;
						anode <=4'b1011;
						cathode <= sMin0;
					end
					
				 else if (position == 2) begin
						position <= 2'b1 +position;
						anode <=4'b1101;
						cathode <= sSec1;
					end
					
				 else if (position == 3) begin
				position <= 2'b1 +position;
						anode <=4'b1110;
						cathode <= sSec0;
					end
					
				end
				
				
				else begin
				if (rst) begin
					anode <= 4'b0111;
					cathode <= 0;
				end
				if (position == 0) begin
					position <= 2'b1 + position;
					anode <= 4'b0111;
					cathode <= min1;
					end
					
				 else if (position == 1) begin
					position <= 2'b1 +position;
					anode <= 4'b1011;
					cathode <= min0;
					end
					
				else if (position == 2) begin
					position <= 2'b1 +position;
					anode <= 4'b1101;
					cathode <= sec1;
				end
				
				 else if (position == 3) begin
					position <= 2'b1 +position;
					anode <= 4'b1110;
					cathode <= sec0;
				end
			end
		
end
assign anode_final = anode;
assign cathode_final = cathode;
endmodule