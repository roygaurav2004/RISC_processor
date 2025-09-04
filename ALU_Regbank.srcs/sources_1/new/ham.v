`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 12:06:31
// Design Name: 
// Module Name: ham
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


module ham#(parameter N =8)(in, out);
    input [N-1:0] in;
    output [31:0] out;
    wire [3:0] carry;
    wire [1:0] temp;
    wire [1:0] temp2;
    
    adder #(1)a1(.in1(in[7]),.in2(in[6]),.out(temp[0]), .cout(carry[0]), .cin(in[5]));
    adder #(1)a2(.in1(in[4]),.in2(in[3]),.out(temp[1]), .cout(carry[1]), .cin(in[2]));
    
    adder #(2)a3(.in1({carry[0],temp[0]}),.in2({carry[1],temp[1]}),.out(temp2), .cout(carry[2]), .cin(in[1]));
    
    adder #(3)a4(.in1({carry[2],temp2}),.in2(3'b000),.out(out[2:0]), .cout(out[3]), .cin(in[0]));
endmodule
