`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2024 13:47:46
// Design Name: 
// Module Name: sign_extend
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


module sign_extend(input [16:0] imm1, input [26:0] imm2, output reg [31:0] se1, se2);
    wire t1,t2;
    assign t1 = imm1[16];
    assign t2 = imm2[26];
    integer i;
    always @(*) begin
        for(i = 17; i<=31; i=i+1) se1[i] <= t1;
        for(i = 0; i<=16; i = i+1) se1[i] <= imm1[i];
        for(i = 27; i<=31; i=i+1) se2[i] <= t2;
        for(i = 0; i<=26; i = i+1) se2[i] <= imm2[i];
    end
endmodule
