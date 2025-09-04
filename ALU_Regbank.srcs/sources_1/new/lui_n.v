`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 15:39:20
// Design Name: 
// Module Name: lui_n
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


module lui_n#(parameter N =32)(in, out);
    input [15:0] in;
    wire [N-1:0] in_ext;
    assign in_ext = {16'b0, in};
    output [N-1:0] out;
    l_shift_left l1(.in(in_ext), .out(out), .bits(5'b10000));
endmodule
