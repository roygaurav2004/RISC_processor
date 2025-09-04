`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2024 11:32:29
// Design Name: 
// Module Name: data_path
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module data_path(
    output [31:0] ans,
    input show,
    input [3:0] in_addr,
    input init,
    input clk,
    input pcIn, 
    input pcOut,
    input en,
    input rw,
    input instrRead,
    input regRead,
    input regWrite,
    input immSel,
    input read1Sel,
    input read2Sel,
    input memRead, 
    input memWrite,
    input loadLMD,
    input writeInfoSel,
    input writeRegSel,
    input selSignal0,
    input selSignal1,
    input selComp,
    input selPc,
    output [4:0] opcode, func
);
    wire [31:0] w_data;
    wire [31:0] A, B, se1, se2;
    wire [31:0] instr;
    wire [31:0] writeInfoOut, npcOut, writePCOut,immOut, aluIn1, aluIn2, selCompOut, aluOut, dataMemOut, lmdOut;
    wire [4:0] rs,rt,rd, writeRegOut;
    wire [16:0] imm1;
    wire [26:0] imm2;
    wire mux4out, altb, agtb, aeqb;
    wire [31:0] pcOutVal;
    wire wea;
    parameter regSize = 5;
    
    pc p(.init(init), .clk(clk), .pcIn(pcIn), .pcOut(pcOut), .in(writePCOut), .out(pcOutVal));
    instr_mem im(.clk(clk), .instr(instr), .pc(pcOutVal));
    data_mem dm(.clk(clk), .wea(wea), .addra(aluOut[15:0]), .dina(B), .dout(dataMemOut));
    npc np(.in(pcOutVal), .out(npcOut));
    ir ir1(.clk(clk), .instr(instr), .instrRead(instrRead), .rs(rs), .rt(rt), .rd(rd), .imm1(imm1), .imm2(imm2), .opcode(opcode),.func(func));
    sign_extend see(.imm1(imm1), .imm2(imm2), .se1(se1), .se2(se2));
    
    muxReg writeRegMux(.clk(clk),.in1(rt), .in2(rd), .out(writeRegOut), .sel(writeRegSel));
    
    register_bank rb(.show(show), .in_addr(in_addr), .ans(ans), .clk(clk), .w_add(writeRegOut), .w_data(writeInfoOut), .r_add1(rs), .r_add2(rt), .r_data1(A), .r_data2(B), .regRead(regRead), .regWrite(regWrite));
    mux_2to1 immSelMux(.in1(se1), .in2(se2), .out(immOut), .sel(immSel));
    mux_2to1 read1Mux(.in1(A), .in2(npcOut), .out(aluIn1), .sel(read1Sel));
    mux_2to1 read2Mux(.in1(B), .in2(immOut), .out(aluIn2), .sel(read2Sel));
    mux_2to1 selCompMux(.in1(32'b0), .in2(B), .out(selCompOut), .sel(selComp));
    mux_2to1 pcSelMux(.in1(npcOut), .in2(aluOut), .out(writePCOut), .sel(mux4Out));
    mux_2to1 weS(.in1(0), .in2(1), .out(wea), .sel(memWrite));
    
    comparator comp(.in1(A), .in2(selCompOut), .altb(altb), .agtb(agtb), .aeqb(aeqb));
    mux_4to1 mx(.in1(selPc), .in2(altb), .in3(aeqb), .in4(agtb), .out(mux4Out), .sel0(selSignal0),.sel1(selSignal1));
    
    lmd lmd1(.in(dataMemOut), .out(lmdOut), .loadLMD(loadLMD), .clk(clk));
    
    mux_2to1 writeInfoMux(.in1(lmdOut), .in2(aluOut), .out(writeInfoOut), .sel(writeInfoSel));
    
    alu ALU(.clk(clk),.op(opcode), .func(func), .in1(aluIn1), .in2(aluIn2), .out(aluOut));
    
//    always @(posedge clk) begin 
////        $monitor("PC : %d", pcOutVal);
//        $monitor("ans : %d", ans);
////        $monitor("mux4Out : %d", mux4Out);
//    end
    
endmodule
