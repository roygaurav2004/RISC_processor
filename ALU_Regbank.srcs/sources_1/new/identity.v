`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 10:47:21
// Design Name: 
// Module Name: identity
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


module identity #(parameter N=32)(in, out);
    input [N-1:0] in;
    output [N-1:0] out;
    genvar i;
    generate
        for(i=0; i<N; i=i+1) begin:xloop
          or o1(out[i], in[i], 1'b0);
        end
    endgenerate
endmodule
