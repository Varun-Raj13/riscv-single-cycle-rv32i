`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:11:46 10/04/2026
// Design Name:   riscv_top_single
// Module Name:   E:/Xilinx14.7/processor/riscv_top_single_tb.v
// Project Name:  processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: riscv_top_single
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module riscv_top_single_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] aluout;
	wire [31:0] dmemout;
	wire [31:0] pcout;

	// Instantiate the Unit Under Test (UUT)
	riscv_top_single uut (
		.clk(clk), 
		.rst(rst), 
		.aluout(aluout), 
		.dmemout(dmemout), 
		.pcout(pcout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		forever #5 clk=~clk;
		end
		initial begin
		rst = 1;

		// Wait 100 ns for global reset to finish
		//#100;
		$readmemh("program.hex",uut.imem.rom);
		@(negedge clk);
		@(negedge clk);
		rst=0;
		repeat (20) @(negedge clk);
		$display("simulation complete");
		$finish;
        
		// Add stimulus here

	end
	always@(negedge clk)begin
	if (!rst) begin
	$display("time: %5t | pc: 0x%08h | instr: 0x%08h | alu_out: 0x%08h | dmem_out: 0x%08h | x1=%0d x2=%0d x3=%0d", $time,pcout,uut.instr,aluout,dmemout,uut.regf.registers[1],uut.regf.registers[2],uut.regf.registers[3]);
      end
end		
endmodule

