`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:26:19 10/03/2026 
// Design Name: 
// Module Name:    riscv_top_single 
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
module riscv_top_single(input clk, rst, output [31:0] aluout,dmemout,pcout
    );
	 wire [31:0] pc_next,pc,pc_plus_4,instr,imm_extend,pc_jump,rd1,rd2,reg_imm_select,alu_out,dmem_read,result;
	 wire pcs,reg_w,mem_w,alu_s,n,z,c,v,branch,jump;
	 wire [1:0] alu_op;
	 wire [2:0] ims,result_s;
	 wire [3:0] aluc;
	 
	 assign pc_next=pcs?pc_jump:pc_plus_4;
	 assign reg_imm_select=alu_s?imm_extend:rd2;
	 assign result=(result_s==3'b000)?alu_out:(result_s==3'b001)?dmem_read:(result_s==3'b010)?pc_plus_4:(result_s==3'b011)?imm_extend:(result_s==3'b100)?pc_jump:32'b0;
	 assign pc_plus_4=pc+32'd4;
	 assign pc_jump=pc+imm_extend;
	 
	 assign aluout=alu_out;
	 assign dmemout=dmem_read;
	 assign pcout=pc;
	 
	 pc_unit pcu(.clk(clk),.rst(rst),.pcn(pc_next),.pc(pc));
	 instruction_memory imem(.address(pc),.rd(instr));
	 register_file regf(.clk(clk),.we(reg_w),.a1(instr[19:15]),.a2(instr[24:20]),.a3(instr[11:7]),.wd3(result),.rd1(rd1),.rd2(rd2));
	 extend_unit immextnd(.instr(instr[31:7]),.immsrc(ims),.immext(imm_extend));
	 alu_unit alunit(.a(rd1),.b(reg_imm_select),.aluc(aluc),.negative(n),.zero(z),.overflow(v),.y(alu_out),.borrow(c));
	 data_mem dmem(.clk(clk),.wen(mem_w),.address(alu_out),.wd(rd2),.rd(dmem_read));
	 main_decoder cumain(.op(instr[6:0]),.reg_write(reg_w),.alu_src(alu_s),.mem_write(mem_w),.branch(branch),.jump(jump),.imm_src(ims),.result_src(result_s),.alu_op(alu_op));
	 alu_decoder alud(.alu_op(alu_op),.funct3(instr[14:12]),.funct7_5(instr[30]),.aluc(aluc));
	 branch_jump_pc_decoder pcjb(.branch(branch),.zero(z),.neg(n),.overflow(v),.borrow(c),.jump(jump),.funct3(instr[14:12]),.pcs(pcs));
	 
	 


endmodule
