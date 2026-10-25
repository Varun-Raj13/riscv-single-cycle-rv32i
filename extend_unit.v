`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:59 07/18/2026 
// Design Name: 
// Module Name:    extend_unit 
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
module extend_unit(input [24:0] instr,input [2:0] immsrc,output reg [31:0] immext
    );
	 //[31:25]=[24:18],[24:20]=[17:13],[19:15]=[12:8],[14:12]=[7:5],[11:7]=[4:0]
	 always@(*)begin
	 case(immsrc)
	 3'b000:immext={{20{instr[24]}},instr[24:13]};
	 3'b001:immext={{20{instr[24]}},instr[24:18],instr[4:0]};
	 3'b010:immext={{20{instr[24]}},instr[0],instr[23:18],instr[4:1],1'b0};
	 3'b011:immext={{12{instr[24]}},instr[12:5],instr[13],instr[23:14],1'b0};
	 3'b100:immext={instr[24:5],12'b0};
	 default:immext=32'b0;
	 endcase
	 end


endmodule
