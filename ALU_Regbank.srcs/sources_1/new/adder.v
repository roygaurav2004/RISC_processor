`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:10:42
// Design Name: 
// Module Name: adder
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


module adder #(parameter N =32)(in1, in2, out, cout, cin);
    input [N-1:0] in1,in2;
    input cin;
    output [N-1:0] out;
    output cout;
    genvar i;
    wire [N-1:0] carry;
    generate
        for(i=0; i<N; i=i+1) begin : adder_loop
            if(i == 0) begin
                full_adder_1bit f1(.in1(in1[i]), .in2(in2[i]), .c_in(cin), .sum(out[i]), .c_out(carry[i]));
            end
            else begin
                full_adder_1bit f2(.in1(in1[i]), .in2(in2[i]), .c_in(carry[i-1]), .sum(out[i]), .c_out(carry[i]));
            end
        end
    endgenerate
    
    assign cout = carry[N-1];
endmodule
