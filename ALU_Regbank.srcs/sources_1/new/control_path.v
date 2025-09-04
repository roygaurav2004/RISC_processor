`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 10:59:33
// Design Name: 
// Module Name: control_path
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


module control_path(
    input [4:0] opcode,
    input [4:0] func,
    input clk,
    input init,
    
    output reg pcIn, 
    output pcOut,
    output en,
    output rw,
    output instrRead,
    output regRead,
    output regWrite,
    output immSel,
    output read1Sel,
    output read2Sel,
    output memRead, 
    output memWrite,
    output loadLMD,
    output writeInfoSel,
    output writeRegSel,
    output selSignal0,
    output selSignal1,
    output selComp,
    output selPc    
);
    reg [3:0] state;
    reg [18:0] cmask;
    wire temp;
    assign {temp, pcOut, en, rw, instrRead, regRead, regWrite, immSel, read1Sel, read2Sel, memRead, memWrite, loadLMD, writeInfoSel, writeRegSel, selSignal0, selSignal1, selComp, selPc} = cmask;
    
    // OP code = 5'b00000 setting parameter for func
    parameter ADD = 5'b00000;
    parameter SUB = 5'b00001;
    parameter AND = 5'b00010;
    parameter OR = 5'b00011;
    parameter XOR = 5'b00100;
    parameter NOR = 5'b00101;
    parameter NOT = 5'b00110;
    parameter SL = 5'b00111;
    parameter SRL = 5'b01000;
    parameter SRA = 5'b01001;
    parameter INC = 5'b01010;
    parameter DEC = 5'b01011;
    parameter SLT = 5'b01100;
    parameter SGT = 5'b01101;
    parameter HAM = 5'b01110;
    parameter MOVE = 5'b01111;
    parameter CMOV = 5'b10000;

    // OP code beginning from 5'b00001
    parameter ADDI = 5'b00001;
    parameter SUBI = 5'b00010;
    parameter ANDI = 5'b00011;
    parameter ORI = 5'b00100;
    parameter XORI = 5'b00101;
    parameter NORI = 5'b00110;
    parameter NOTI = 5'b00111;
    parameter SLI = 5'b01000;
    parameter SRLI = 5'b01001;
    parameter SRAI = 5'b01010;
    parameter SLTI = 5'b01011;
    parameter SGTI = 5'b01100;
    parameter LUI = 5'b01101;
    parameter LD = 5'b01110;
    parameter ST = 5'b01111;
    parameter BMI = 5'b10000;
    parameter BPL = 5'b10001;
    parameter BZ = 5'b10010;
    parameter BR = 5'b10011;
    parameter HALT = 5'b10100;
    parameter NOP = 5'b10101;

    always @(posedge clk) begin
//       $display("%d %b %b", state, opcode,func);
        case(state)
            4'b000: begin
                cmask <= 19'b0111000000000000000;
                pcIn <= 1'b0;
                state <= 4'b001;
            end
            4'b001: begin
                state <= 4'b010;
                cmask <= 19'b0000100000000000000;
            end
            4'b010: begin
                state <= 4'b011;
            end
            4'b011: begin
                // waiting for instruction read
                state <= 4'b100;
            end
            4'b100: begin
                case(opcode)
                    5'b00000: begin
                        cmask <= 19'b0000011000000110000;
                        state <= 4'b101;
                    end
                    ADDI, SUBI, ANDI, ORI, XORI, NORI, NOTI, SLI, SRLI, SRAI, SLTI, SGTI, LUI: begin
                        cmask <= 19'b0000011001000100000;
                        pcIn <= 1'b0;
                        state <= 4'b101;
                    end
                    ST: begin
                        cmask <= 19'b0000010001000000000;
                        pcIn <= 1'b0;
                        state <= 4'b101;
                    end
                    LD : begin
                        cmask <= 19'b0000010001100000000;
                        pcIn <= 1'b0;
                        state <= 4'b101;
                    end
                    BZ : begin
                        cmask <= 19'b0000010011000000100;
                        pcIn <= 1'b0;
                        state <= 4'b101;
                    end
                    BPL : begin
                        cmask <= 19'b0000010011000001100;
                        pcIn <= 1'b0;
                        state <= 4'b101;
                    end
                    BMI : begin
                        cmask <= 19'b0000010011000011000;
                        pcIn <= 1'b0;
                        state <= 4'b101;
                    end
                    BR : begin
                        cmask <= 19'b0000000111000000001;
                        pcIn <= 1'b0;
                        state <= 4'b101;
                    end
                    HALT, NOP : begin
                        cmask <= 19'b0000000000000000000;
                        pcIn <= 1'b0;
                        state <= 4'b100;
                    end
                endcase 
            end
            4'b101: begin
                case(opcode)
                    5'b00000: begin
                        cmask <= 19'b1000000000000000000;
                        pcIn <= 1'b1;
                        state <= 4'b110;
                    end
                    ADDI, SUBI, ANDI, ORI, XORI, NORI, NOTI, SLI, SRLI, SRAI, SLTI, SGTI, LUI: begin
                        cmask <= 19'b100000000000000000;
                        pcIn <= 1'b1;
                        state <= 4'b110;
                    end
                    ST: begin
                        cmask[7] <= 1'b1;
                        state <= 4'b110;
                    end
                    LD : begin
                        state <= 4'b110;
                    end
                    BZ, BPL, BMI, BR : begin
                        pcIn <= 1'b1;
                        state <= 4'b110;
                    end
                endcase
            end
            4'b110: begin
                case(opcode)
                    5'b00000: begin
                        cmask <= 19'b0000000000000000000;
                        pcIn <= 1'b0;
                        state <= 4'b000;
                    end
                    ADDI, SUBI, ANDI, ORI, XORI, NORI, NOTI, SLI, SRLI, SRAI, SLTI, SGTI, LUI: begin
                        cmask <= 19'b0000000000000000000;
                        pcIn <= 1'b0;
                        state <= 4'b000;
                    end
                    ST: begin
                        state <= 4'b111;
                    end
                    LD : begin
                        cmask[6] <= 1'b1;
                        state <= 4'b111;
                    end
                    BZ, BPL, BMI, BR : begin
                        pcIn <= 1'b0;
                        state <= 4'b1000;
                    end
                endcase
            end
            4'b111: begin
                case(opcode) 
                    ST : begin
                        cmask <= 19'b1000000000000000000;
                        pcIn <= 1'b1;
                        state <= 4'b1000;
                    end
                    LD : begin
                        cmask[12] <= 1'b1;
                        pcIn <= 1'b1;
                        state <= 4'b1000;
                    end
                endcase 
            end
            4'b1000: begin
                cmask <= 19'b0000000000000000000;
                pcIn <= 1'b0;
                state <= 4'b000;
            end
            default : begin
                if(init) state <= 0;
            end
        endcase
    end
endmodule
