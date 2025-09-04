`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 11:55:48
// Design Name: 
// Module Name: increment
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


module increment#(parameter N =32)(in,out);
    input [N-1:0] in;
    output [N-1:0] out;
    wire temp;
    adder a1(.in1(in), .in2(32'b100), .out(out), .cout(temp), .cin(1'b0));
endmodule
