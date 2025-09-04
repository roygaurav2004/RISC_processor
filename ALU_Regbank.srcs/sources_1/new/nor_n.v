`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 15:32:18
// Design Name: 
// Module Name: nor_n
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


module nor_n#(parameter N =32)(in1, in2, out);
    input [N-1:0] in1, in2;
    output [N-1:0] out;
    wire [N-1:0] temp;
    or_n o1(.in1(in1), .in2(in2), .out(temp));
    one_complement oc1(.in(temp), .out(out));
endmodule
