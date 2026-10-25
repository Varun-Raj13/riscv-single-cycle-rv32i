`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:15:32 10/04/2026 
// Design Name: 
// Module Name:    branch_pc_decoder 
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
module branch_jump_pc_decoder(input branch,zero,neg,overflow,borrow,jump, input [2:0] funct3, output pcs
    );
	 reg branch_pc;
	 always@(*)begin
	 branch_pc=1'b0;
	 case(funct3)
	 3'b000:	branch_pc=zero;
	 3'b001: branch_pc=~zero;
	 3'b100: branch_pc=(neg^overflow);
	 3'b101: branch_pc=~(neg^overflow);
	 3'b110: branch_pc=borrow;
	 3'b111: branch_pc=~borrow;
	 default: branch_pc=1'b0;
	 endcase
	 end
	 assign pcs=(branch_pc&branch)|jump;


endmodule
