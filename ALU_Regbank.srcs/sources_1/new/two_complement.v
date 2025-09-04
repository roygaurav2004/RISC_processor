`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:24:41
// Design Name: 
// Module Name: two_complement
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


module two_complement #(parameter N =32)(in, out);
    input [N-1:0] in;
    output [N-1:0] out;
    
    wire [N-1:0] inv;
    wire temp;
    one_complement oc(.in(in), .out(inv));
    adder a1(.in1(inv), .in2(32'b1), .out(out), .cout(temp), .cin(1'b0));    
endmodule
