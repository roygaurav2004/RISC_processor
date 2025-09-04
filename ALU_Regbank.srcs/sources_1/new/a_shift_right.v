`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 11:54:44
// Design Name: 
// Module Name: a_shift_right
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


module a_shift_right#(parameter N =32)(in, out, bits);
    input [N-1:0] in;
    input [4:0] bits;
    output [N-1:0] out;
    wire [N-1:0] temp;
    assign out[31] = in[31];
    assign out[30:0] = in[31:1];
//    integer i;
//    always @(*) begin
//        for(i = 1; i<= bits; i= i+1) out[32-i] = in[31];
//        for(; i<=32; i=i+1) out[32-i] = temp[32-i];
//    end
endmodule
