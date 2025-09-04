`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 10:54:19
// Design Name: 
// Module Name: mux_8_to_1
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


module mux_32_to_1(ch, sel, in, out);
    input [1:0] ch;
    input [4:0] sel;
    input [31:0] in;
    output reg [31:0] out;
    reg [31:0] st;
    integer i;
    always @(*) begin
        case (ch)
            2'b00: begin// Logical shift left
//                for(i=sel; i<32; i=i+1) begin
//                    st[i] = in[i-sel];
//                end
//                for(i=0; i<sel; i=i+1) begin
//                    st[i] = 1'b0;
//                end
//                out = st;
                out = in << sel;
            end
            2'b01: begin// Logical shift right
//                for(i=0; i<32-sel; i=i+1) begin
//                    st[i] = in[i+sel];
//                end
//                for(i=0; i<sel; i=i+1) begin
//                    st[32-i-1] = 1'b0;
//                end
//                out = st;
                out = in >> sel;
            end
            2'b10: begin // Arithmetic shift right
//                for(i=0; i<32-sel; i=i+1) begin
//                    st[i] = in[i+sel];
//                end
//                for(i=0; i<sel; i=i+1) begin
//                    st[32-i-1] = in[31];
//                end
//                out = st;
                out = in >>> sel;
            end
        endcase
    end
endmodule
