`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2024 15:40:17
// Design Name: 
// Module Name: cmov
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


module cmov #(parameter N = 32) (in1, in2, out);
    input [N-1:0] in1,in2;
    output [N-1:0] out;
    assign out = (in1 < in2) ? in1 : in2;
endmodule
