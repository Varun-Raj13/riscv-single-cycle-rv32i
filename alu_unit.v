`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:05:49 07/18/2026 
// Design Name: 
// Module Name:    alu_unit 
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
module alu_unit(input [31:0] a,b,input [3:0] aluc, output negative,zero,overflow, output reg [31:0] y, output reg borrow
    );
	 always@(*)begin
	 borrow=1'b0;
	 case(aluc)
	 4'b0000:y=a+b;
	 4'b0001:{borrow,y}={1'b0,a}-{1'b0,b};
	 4'b0010:y=a<<b[4:0];
	 4'b0011:y=($signed(a)<$signed(b))?32'b1:32'b0;
	 4'b0100:y=($unsigned(a)<$unsigned(b))?32'b1:32'b0;
	 4'b0101:y=a^b;
	 4'b0110:y=a>>b[4:0];
	 4'b0111:y=$signed(a)>>>b[4:0];
	 4'b1000:y=a|b;
	 4'b1001:y=a&b;
	 default:y=32'b0;
	 endcase
	 end
	 assign negative=y[31];
	 assign zero=(y==32'b0);
	 assign overflow=(aluc==4'b0000)?((a[31]==b[31])&&a[31]!=y[31]):(aluc==4'b0001)?((a[31]!=b[31])&&(a[31]!=y[31])):1'b0;
	 


endmodule
