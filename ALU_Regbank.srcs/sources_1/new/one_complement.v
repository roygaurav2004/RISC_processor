`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:26:40
// Design Name: 
// Module Name: one_complement
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


module one_complement #(parameter N =32)(in, out);
    input [N-1:0] in;
    output [N-1:0] out;
    genvar i;
    generate
        for(i=0; i<N; i=i+1) begin : adder_loop
            not (out[i],in[i]);
        end
    endgenerate
endmodule
