`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 10:16:03
// Design Name: 
// Module Name: xor_st
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


module xor_st (in1,in2, out);
    input in1,in2;
    output out;
    wire in1_dash, in2_dash, and1, and2, ans;
    not n1(in1_dash, in1);
    not n2(in2_dash, in2);
    and a1(and1, in1_dash, in2);
    and a2(and2, in2_dash, in1);
    or oo(ans, and1,and2);
    assign out = ans;
endmodule
