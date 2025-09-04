`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 15:51:51
// Design Name: 
// Module Name: muxReg
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


module muxReg(clk,in1, in2, sel ,out);
    input [4:0] in1,in2;
    input sel;
    output reg [4:0] out;
    input clk;
    
    
    always @(*) begin
        if(sel == 0) out <= in1;
        else out <= in2;
    end
endmodule
