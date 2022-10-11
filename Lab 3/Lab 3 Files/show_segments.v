module show_segments(
	input fast_clock,
   	input blink_clock,
	input select,
	input adjust,
	input [7:0] min1,
	input [7:0] min0,
	input [7:0] sec1,
	input [7:0] sec0,
	output [3:0] anode_final,
	output [7:0] cathode_final
    );

reg [1:0] position = 0;
reg [3:0] anode;
reg [7:0] cathode;

always @ (posedge fast_clock) begin
    if (adjust) begin
        if (~select) begin
            if (position == 0) begin
                position <= 2'b1 + position;
                anode <= 4'b0111;
                if (blink_clock) begin
                    cathode <= min1;
                end else begin
                    cathode <= 8'b11111111;
                end
            end else if (position == 1) begin
                position <= 2'b1 +position;
                anode <= 4'b1011;
                if (blink_clock) begin
                    cathode <= min0;
                end else begin
                    cathode <= 8'b11111111;
                end
            end else if (position == 2) begin
                position <= 2'b1 +position;
                anode <= 4'b1101;
                cathode <= sec1;
            end else if (position == 3) begin
                position <= 2'b1 +position;
                anode <= 4'b1110;
                cathode <= sec0;
            end
        end else if (select) begin
            if (position == 0) begin
                position <= 2'b1 + position;
                anode <= 4'b0111;
                cathode <= min1;
            end else if (position == 1) begin
                position <= 2'b1 +position;
                anode <= 4'b1011;
                cathode <= min0;
            end else if (position == 2) begin
                position <= 2'b1 +position;
                anode <= 4'b1101;
                if (blink_clock) begin
                    cathode <= sec1;
                end else begin 
                    cathode <= 8'b11111111;
                end
            end else if (position == 3) begin
                position <= 2'b1 +position;
                anode <= 4'b1110;
                if (blink_clock) begin
                    cathode <= sec0;
                end else begin
                    cathode <= 8'b11111111;
                end
            end
        end
    end else begin 
        if (position == 0) begin
            position <= 2'b1 + position;
            anode <= 4'b0111;
            cathode <= min1;
        end else if (position == 1) begin
            position <= 2'b1 +position;
            anode <= 4'b1011;
            cathode <= min0;
        end else if (position == 2) begin
            position <= 2'b1 +position;
            anode <= 4'b1101;
            cathode <= sec1;
        end else if (position == 3) begin
            position <= 2'b1 +position;
            anode <= 4'b1110;
            cathode <= sec0;
        end
    end
end
assign anode_final = anode;
assign cathode_final = cathode;
endmodule