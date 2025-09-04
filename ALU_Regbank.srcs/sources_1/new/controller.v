`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 15:58:13
// Design Name: 
// Module Name: controller
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


module controller #(parameter N= 32) (clk, control, op, w_add, r_add1, r_add2);
    input [2:0] control;
    output reg [3:0] op;
    output reg [2:0] w_add, r_add1, r_add2;
    input clk;
    
    always @(posedge clk) begin
        case (control) 
            3'b000 : begin
                w_add = 3'b001;
                r_add1 = 3'b010;
                r_add2 = 3'b011;
                op = 4'b0000;
            end
            3'b001 : begin
                w_add = 3'b100;
                r_add1 = 3'b001;
                r_add2 = 3'b101;
                op = 4'b0001;
            end
            3'b010 : begin
                w_add = 3'b010;
                r_add1 = 3'b001;
                r_add2 = 3'b010;
                op = 4'b1010;
            end
            3'b011 : begin
                w_add = 3'b111;
                r_add1 = 3'b001;
                r_add2 = 3'b010;
                op = 4'b1011;
            end
            3'b100 : begin
                w_add = 3'b110;
                r_add1 = 3'b001;
                r_add2 = 3'b010;
                op = 4'b0010;
            end
            3'b101 : begin
                w_add = 3'b001;
                r_add1 = 3'b001;
                r_add2 = 3'b010;
                op = 4'b0100;
            end
            3'b110 : begin
                w_add = 3'b011;
                r_add1 = 3'b010;
                r_add2 = 3'b000;
                op = 4'b0000;
            end
            3'b111 : begin
                w_add = 3'b110;
                r_add1 = 3'b000;
                r_add2 = 3'b000;
                op = 4'b0000;
            end
        endcase
    end
endmodule
