`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2024 14:59:00
// Design Name: 
// Module Name: lmd
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


module lmd(
    input clk,
    input [31:0] in,
    output reg [31:0] out,
    input loadLMD
);
    always @(posedge clk) begin
        if(loadLMD) out <= in;
    end
endmodule
