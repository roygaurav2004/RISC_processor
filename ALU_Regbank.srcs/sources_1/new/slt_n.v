`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2024 15:34:49
// Design Name: 
// Module Name: slt_n
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


module slt_n#(parameter N =32)(in1, in2, out);
    input [N-1:0] in1, in2;
    output reg [N-1:0] out;
    
    wire [N-1:0] temp;
    subtractor s1(.in1(in1), .in2(in2), .out(temp));
    always @(*) begin
        if(temp[N-1] == 1'b1) out <= 32'b1;
        else out <= 32'b0;
    end
endmodule
