`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 10:22:23
// Design Name: 
// Module Name: xor_n
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


module xor_n #(parameter N =32)(in1, in2, out);
    input [N-1:0] in1, in2;
    output [N-1:0] out;
    genvar i;
    generate
        for(i=0; i<N; i=i+1) begin:xloop
            xor_st x1(.in1(in1[i]), .in2(in2[i]), .out(out[i]));
        end
    endgenerate
endmodule
