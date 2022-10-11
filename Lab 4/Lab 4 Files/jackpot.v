`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:40 02/09/2022 
// Design Name: 
// Module Name:    jackpot 
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
module jackpot(
	input clk_in, 
    input rst,
	//input [10:0] score, 
    input [3:0] res1, 
    input [3:0] res2,
    input [3:0] res3,
    input [3:0] res4,
	 input enda,
	 input endb,
	 input endc,
	 input endd,
	 output [3:0] matches, 
    output [7:0] Led,
    output [10:0] score
    );
	
	reg [10:0] tempScore = 0;
	reg [3:0] tmatches;
	//blinkLeds blink (.clk_in(clk_in), .rst(rst), .Led(Led)); 
    always @ (posedge clk_in) begin
			if (enda && endb && endc && endd) begin
		 
			  //doubles
			  if (res1==res2 || res2== res3|| res3==res4 || res4==res1 || res4==res2 || res1==res3) begin
					//tmatches <= 2; 
			tempScore <=10;
			  end 
			  

			  //triples 
			  else if ((res1==res2 && res2== res3) ||
			  ( res3==res4 && res4==res1) || 
			  (res4==res2 && res2==res3) ||
			  (res2==res1 && res1== res4))
					//tmatches <=3;
					begin
			   tempScore <= 50; 
				end

			  //quadruplets - jackpot
			  else if (res1==res2 && res2==res3 && res3==res4) 
					//tmatches <=4; 
					begin
					tempScore <= 100;
					end
			  

			  else begin
			  tempScore <= 0; 
			  end
					//tmatches <= 0; 
			  
			  

		end
end 

assign score = tempScore;
assign matches = tmatches;

endmodule