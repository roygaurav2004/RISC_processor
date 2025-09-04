`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2024 13:32:09
// Design Name: 
// Module Name: ir
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


module ir(
    input clk,
    input instrRead,
    input [31:0] instr,
    output reg [4:0] rs, rt, rd, opcode, func,
    output reg [16:0] imm1,
    output reg [26:0] imm2
);
    always @(posedge clk) begin
        if(instrRead) begin
            opcode <= instr[31:27];
            func <= instr[4:0];
            rs <= instr[26:22];
            rt <= instr[21:17];
            rd <= instr[16:12];
            imm1 <= instr[16:0];
            imm2 <= instr[26:0];
        end
    end
    
endmodule
