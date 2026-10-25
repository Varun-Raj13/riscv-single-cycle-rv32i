`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:23 07/18/2026 
// Design Name: 
// Module Name:    register_file 
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
module register_file(input clk,we,input [4:0] a1,a2,a3,input [31:0] wd3, output [31:0] rd1,rd2
    );
	 reg [31:0] registers [31:0];
	 assign rd1 = (a1==5'b0)?32'b0:registers[a1];
	 assign rd2 = (a2==5'b0)?32'b0:registers[a2];
	 always@(posedge clk)begin
	 if(we && (a3!=5'b0))begin
	 registers[a3]<=wd3;
	 end
	 end


endmodule
