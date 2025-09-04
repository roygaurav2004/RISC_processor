`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 16:07:23
// Design Name: 
// Module Name: main_module
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


module main_module #(parameter N=32)(clk, init, out, show, in_addr);
      input clk,show;
      input init;
      wire [31:0] ans;
      wire clk_slow;
      input [3:0] in_addr;
      wire [4:0] opcode, func;
//      input [31:0] instr;
      wire pcIn, pcOut, en, rw, instrRead, regRead, regWrite, immSel, read1Sel, read2Sel, memRead, memWrite, loadLMD, writeInfoSel, writeRegSel, selSignal0, selSignal1, selComp, selPc;
      clkdiv cd(.clk_in(clk), .clk_out(clk_slow));
      output [15:0] out;
      
      assign out = ans[15:0];
      
      data_path dp(
        .ans(ans),
        .show(show),
        .in_addr(in_addr),
        .init(init),
        .clk(clk_slow),
        .pcIn(pcIn),
        .pcOut(pcOut),
        .en(en),
        .rw(rw),
        .instrRead(instrRead),
        .regRead(regRead),
        .regWrite(regWrite),
        .immSel(immSel),
        .read1Sel(read1Sel),
        .read2Sel(read2Sel),
        .memRead(memRead), 
        .memWrite(memWrite),
        .loadLMD(loadLMD),
        .writeInfoSel(writeInfoSel),
        .writeRegSel(writeRegSel),
        .selSignal0(selSignal0),
        .selSignal1(selSignal1),
        .selComp(selComp),
        .selPc(selPc),
        .opcode(opcode),
        .func(func)
    );
    
    control_path cp(
        .opcode(opcode),
        .func(func),
        .clk(clk_slow),
        .pcIn(pcIn),
        .pcOut(pcOut),
        .en(en),
        .rw(rw),
        .instrRead(instrRead),
        .regRead(regRead),
        .regWrite(regWrite),
        .immSel(immSel),
        .read1Sel(read1Sel),
        .read2Sel(read2Sel),
        .memRead(memRead), 
        .memWrite(memWrite),
        .loadLMD(loadLMD),
        .writeInfoSel(writeInfoSel),
        .writeRegSel(writeRegSel),
        .selSignal0(selSignal0),
        .selSignal1(selSignal1),
        .selComp(selComp),
        .selPc(selPc),
        .init(init)
    );
    
    
endmodule
