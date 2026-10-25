

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:01:10 07/19/2026 
// Design Name: 
// Module Name:    instruction_memory 
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
 module instruction_memory(input [31:0] address, output [31:0] rd
    );
	 reg [31:0] rom [0:16383];
	 wire [13:0] addr = address[15:2];
	 assign rd=rom[addr];


endmodule
