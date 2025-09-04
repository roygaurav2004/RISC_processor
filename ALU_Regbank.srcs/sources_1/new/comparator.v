`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2024 13:13:07
// Design Name: 
// Module Name: comparator
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


module comparator(
    input [31:0] in1,
    input [31:0] in2,
    output reg altb,
    output reg aeqb,
    output reg agtb
);
    wire [31:0] out;
//    assign altb = (in1 < 0 ) ? 1'b1 : 1'b0;
//    assign agtb = (in1 > 0 ) ? 1'b1 : 1'b0;
//    assign aeqb = (in1 == 0 ) ? 1'b1 : 1'b0;
    
    subtractor s1(.in1(in1), .in2(in2), .out(out));
    always @(*) begin
        if(out[31] == 1'b1) begin
            altb <= 1'b1;
            agtb <= 1'b0;
            aeqb <= 1'b0;
        end
        else if(out == 0) begin
            altb <= 1'b0;
            agtb <= 1'b0;
            aeqb <= 1'b1;
        end
        else begin
            altb <= 1'b0;
            agtb <= 1'b1;
            aeqb <= 1'b0;
        end
    end
endmodule
