`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2024 11:54:56
// Design Name: 
// Module Name: mux_2to1
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


module mux_2to1 #(parameter N=32)(in1, in2, sel ,out);
    input [N-1:0] in1,in2;
    input sel;
    output reg [N-1:0] out;
    
    always @(*) begin
        if(sel == 0) out <= in1;
        else out <= in2;
    end
endmodule
