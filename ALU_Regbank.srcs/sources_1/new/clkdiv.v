`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2024 16:26:42
// Design Name: 
// Module Name: clkdiv
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


module clkdiv(clk_in, clk_out);
    input clk_in;
    output reg clk_out;
    reg [31:0] counter = 32'd0;
    parameter div = 32'd5;
    always @(posedge clk_in) begin
        counter <= counter +1;
        if(counter >= (div-1)) counter <= 32'd0;
        clk_out <= (counter < div/2) ? 1'b1 : 1'b0;
    end
endmodule
