`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2024 15:09:47
// Design Name: 
// Module Name: ham32
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


module ham32(in, out);
    input [31:0] in;
    output [31:0] out;
    
    wire [31:0] t1,t2,t3,t4,o1,o2;
    wire c1,c2,c3;
    
    ham h1(.in(in[7:0]), .out(t1));
    ham h2(.in(in[15:8]), .out(t2));
    ham h3(.in(in[23:16]), .out(t3));
    ham h4(.in(in[31:24]), .out(t4));
    
    adder a1(.in1(t1), .in2(t2), .out(o1), .cin(1'b0), .cout(c1));
    adder a2(.in1(t3), .in2(t4), .out(o2), .cin(1'b0), .cout(c2));
    adder a3(.in1(o1), .in2(o2), .out(out), .cin(1'b0), .cout(c3));
endmodule
