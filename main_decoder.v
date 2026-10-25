`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:55:05 07/20/2026 
// Design Name: 
// Module Name:    main_decoder 
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
module main_decoder(input [6:0] op, output reg_write,alu_src,mem_write,branch,jump, output [2:0] imm_src,result_src,output [1:0] alu_op
    );
	 reg [12:0] controls;
	 assign {reg_write,imm_src,alu_src,mem_write,result_src,branch,jump,alu_op}=controls;
	 always@(*)begin
	 case(op)
	 7'b0110011: controls=13'b1_000_0_0_000_0_0_10;//r
	 7'b0010011: controls=13'b1_000_1_0_000_0_0_10;//i
	 7'b0000011: controls=13'b1_000_1_0_001_0_0_00;//lw
	 7'b0100011: controls=13'b0_001_1_1_000_0_0_00;//sw
	 7'b1100011: controls=13'b0_010_0_0_000_1_0_01;//branch
	 7'b1101111: controls=13'b1_011_0_0_010_0_1_00;//jump
	 7'b0110111: controls=13'b1_100_0_0_011_0_0_00;//lui
	 7'b0010111: controls=13'b1_100_0_0_100_0_0_00;//aupic
	 default: controls=13'b0_000_0_0_000_0_0_00;
	 endcase
	 end


endmodule
