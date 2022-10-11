`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:40 02/09/2022 
// Design Name: 
// Module Name:    score 
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
module score(
    input rst,
    input clk_in,
   input score,
  input score_mode,
    
    output wire [3:0] sl,
	output wire [3:0] slm,
	output wire [3:0] srm,
	output wire [3:0] sr
    );



reg [3:0] tsl;
reg [3:0] tslm;
reg [3:0] tsrm;
reg [3:0] tsr;
reg [10:0] temp =10;


always @ (posedge clk_in) begin

 
    if (rst) begin 
		temp <= 0; 
    end else begin
			
        tsr <= temp%10; //0
      

        tsrm <=(temp/10)%10; //2

        tslm <= (temp/100)%10;
      
        tsl <= (temp/1000)%10;
     
    end
	 end

    assign sl = tsl;
    assign slm = tslm;
    assign srm = tsrm; 
    assign sr = tsr; 


endmodule

