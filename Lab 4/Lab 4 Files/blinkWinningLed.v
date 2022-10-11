`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:30:09 02/28/2022 
// Design Name: 
// Module Name:    blinkWinningLeds
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


module blinkWinningLed(	
	input wire clk_in, 
	input wire rst,
    input [3:0] matches, 
	//input wire dir,
	output [7:0] Led //there are 8
    );

reg [26:0] count;
reg [7:0] tempLed; 
always @(posedge clk_in or posedge rst) begin
	if (rst == 1)
		count<=0; 
	else if (count == 27'b111111111111111111111111111) begin
		//do nothing
        end
	else begin
		count <=count +1;
    end

    case(matches) 
        2: begin
            tempLed[0] = count[26]; 
			tempLed[1] = count[26];
			tempLed[2] = count[26];
			tempLed[3] = 1;
			tempLed[4]= 1;
			tempLed[5] = count[26];
			tempLed[6]= count[26];
			tempLed[7] = count[26];
        end
        3: begin
             tempLed[0] = count[26]; 
			tempLed[1] = count[26];
			tempLed[2] = 1;
			tempLed[3] = 1;
			tempLed[4]= 1;
			tempLed[5] = count[26];
			tempLed[6]= count[26];
			tempLed[7] = count[26];
        end

        4:begin
             tempLed[0] =count[26]; 
			tempLed[1] = count[26];
			tempLed[2] = 1;
			tempLed[3] = 1;
			tempLed[4]= 1;
			tempLed[5] =1;
			tempLed[6]= count[26];
			tempLed[7] = count[26];
        end

//start screen
        9: begin
            tempLed[0] =count[26]; 
			tempLed[1] = count[25];
			tempLed[2] = count[24];
			tempLed[3] = count[23];
			tempLed[4]= count[22];
			tempLed[5] =count[21];
			tempLed[6]= count[20];
			tempLed[7] = count[19];
        end

        default: begin
            tempLed[0] = 0; 
			tempLed[1] = 0;
			tempLed[2] = 0;
			tempLed[3] =0;
			tempLed[4]= 0;
			tempLed[5] =0;
			tempLed[6]= 0;
			tempLed[7] = 0;
        end
	endcase
end 

	assign Led[0] = tempLed[0];
	assign Led[1] = tempLed[1];
	assign Led[2] = tempLed[2];
	assign Led[3] = tempLed[3];
	assign Led[4] = tempLed[4];
	assign Led[5] = tempLed[5];
	assign Led[6] = tempLed[6];
	assign Led[7] = tempLed[7];

endmodule
