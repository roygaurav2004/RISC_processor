`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 11:18:35
// Design Name: 
// Module Name: l_shift_left
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


module l_shift_left #(parameter N =32)(in, out, bits);
    input [N-1:0] in;
    input [4:0] bits;
    output [N-1:0] out;
    
//    assign out = in << bits;
    mux_32_to_1 m1(.ch(2'b00), .sel(bits), .in(in), .out(out));
    
endmodule
