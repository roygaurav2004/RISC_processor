`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2024 11:58:01
// Design Name: 
// Module Name: pc
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


module pc #(parameter N=32)(input init, input clk, input pcIn, input pcOut, input [N-1:0] in, output reg [N-1:0] out);
    always @(posedge clk) begin
        case(init)
            1'b1 : begin
                out = 0;
            end
            1'b0: begin
                if(pcIn) out <= in;
            end
        endcase
    end
endmodule
