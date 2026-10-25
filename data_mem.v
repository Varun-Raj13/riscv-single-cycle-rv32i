`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:49:53 10/04/2026 
// Design Name: 
// Module Name:    data_mem 
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
module data_mem(input clk,wen,input [31:0] address,wd, output [31:0] rd
    );
	 reg [31:0] mem [0:16383];//64kb that is 2^16
	 wire [13:0] addr=address[15:2];//since its byte addressing we dont need last two bits which is a byte length
	 always@(posedge clk)begin
	 if(wen)begin
	 mem[addr]<=wd;
	 end
	 end
	 assign rd= mem[addr];
	 
	 


endmodule
