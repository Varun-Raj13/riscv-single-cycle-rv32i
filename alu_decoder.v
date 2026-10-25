`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:55:41 10/02/2026 
// Design Name: 
// Module Name:    alu_decoder 
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
module alu_decoder(input [1:0] alu_op, input [2:0] funct3, input funct7_5, output reg [3:0] aluc
    );
	 always@(*)begin
	 case(alu_op)
	 2'b00:aluc=4'b0000;
	 2'b01:aluc=4'b0001;
	 2'b10: begin
	 case(funct3)
	 3'b000: aluc=funct7_5?4'b0001:4'b0000;
	 3'b001: aluc=4'b0010;
	 3'b010: aluc=4'b0011;
	 3'b011: aluc=4'b0100;
	 3'b100: aluc=4'b0101;
	 3'b101: aluc=funct7_5?4'b0111:4'b0110;
	 3'b110: aluc=4'b1000;
	 3'b111: aluc=4'b1001;
	 default: aluc=4'b0000;
	 endcase
	 end
	 default: aluc=4'b0000;
	 endcase
	 end

endmodule
