`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:03:46 07/18/2026 
// Design Name: 
// Module Name:    pc_unit 
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
module pc_unit(input clk,rst,input [31:0] pcn,output reg [31:0] pc
    );
	 always@(posedge clk or posedge rst)begin
	 if(rst)begin
	 pc<=32'b0;
	 end else begin
	 pc<=pcn;
	 end
	 end


endmodule
