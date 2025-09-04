`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 10:44:03
// Design Name: 
// Module Name: or_n
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


module or_n#(parameter N =32)(in1, in2, out);
    input [N-1:0] in1, in2;
    output [N-1:0] out;
    genvar i;
    generate
        for(i=0; i<N; i=i+1) begin:xloop
            or x1(out[i], in1[i], in2[i]);
        end
    endgenerate
endmodule
