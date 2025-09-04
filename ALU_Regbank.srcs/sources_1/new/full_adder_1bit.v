`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:06:13
// Design Name: 
// Module Name: full_adder_1bit
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


module full_adder_1bit(input in1, input in2, input c_in, output sum, output c_out);
    assign sum = in1 ^ in2 ^ c_in;
    assign c_out = (in1 & in2) | (in2 & c_in) | (c_in & in1);
endmodule
