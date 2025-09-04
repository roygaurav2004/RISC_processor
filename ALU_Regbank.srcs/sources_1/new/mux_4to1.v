`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2024 13:26:42
// Design Name: 
// Module Name: mux_4to1
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


module mux_4to1( input in1, input in2, input in3, input in4, input sel0,input sel1, output reg out);
    always @(*) begin
        if(sel0==0 && sel1==0) out <= in1;
        else if(sel0==1 && sel1 == 0)out<=in2;
        else if(sel0==0 && sel1==1) out<=in3;
        else if(sel0==1 && sel1==1) out<=in4;
    end
endmodule
