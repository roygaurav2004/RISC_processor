`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:20:28
// Design Name: 
// Module Name: subtractor
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


module subtractor #(parameter N =32)(in1, in2, out);
    input [N-1:0] in1, in2;
    output [N-1:0] out;
    wire [N-1:0] inv;
    wire temp;
    two_complement t(.in(in2), .out(inv));
    adder a1(.in1(in1), .in2(inv),.out(out), .cout(temp), .cin(1'b0));
endmodule
