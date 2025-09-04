`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 13:38:10
// Design Name: 
// Module Name: alu
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


module alu #(parameter N=32)(clk,op,func,out,in1,in2);
    input [N-1:0] in1,in2;
    input [4:0] op,func;
    input clk;
    
    output reg [N-1:0] out;
    wire [N-1:0] add, sub, mul,div, and_out, or_out, xor_out, one_c, id_out1, id_out2, sll_out;
    wire [N-1:0] srl_out, ars_out, inc_out, dec_out, ham_out, nor_out, slt_out, sgt_out, lui_out, cmov_out;
    
    adder #(.N(N)) a1(.in1(in1), .in2(in2), .out(add),.cin(1'b0),.cout(temp));
    subtractor #(.N(N)) s1(.in1(in1),.in2(in2),.out(sub));
    multiplier #(.N(N)) m1(.in1(in1),.in2(in2),.out(mul));
    divider #(.N(N)) d1(.in1(in1),.in2(in2),.out(div));
    and_n #(.N(N)) an1(.in1(in1), .in2(in2), .out(and_out));
    or_n #(.N(N)) or1(.in1(in1),.in2(in2),.out(or_out));
    xor_n #(.N(N)) xor1(.in1(in1),.in2(in2),.out(xor_out));
    one_complement #(.N(N)) oc1(.in(in1),.out(one_c));
    l_shift_left #(.N(N)) lls(.in(in1), .bits(in2[4:0]), .out(sll_out));
    l_shift_right #(.N(N)) lrs(.in(in1), .bits(in2[4:0]), .out(srl_out));
    a_shift_right #(.N(N)) ars(.in(in1), .bits(in2[4:0]), .out(ars_out));
    increment #(.N(N)) inc1(.in(in1),.out(inc_out));
    decrement #(.N(N)) dec1(.in(in1),.out(dec_out));
    ham32 hm(.in(in1), .out(ham_out));
    nor_n #(.N(N)) nor1(.in1(in1), .in2(in2), .out(nor_out));
    lui_n #(.N(N)) lui1(.in(in1[15:0]), .out(lui_out));
    slt_n #(.N(N)) slt1(.in1(in1), .in2(in2), .out(slt_out));
    sgt_n #(.N(N)) sgt1(.in1(in1), .in2(in2), .out(sgt_out));
    cmov #(.N(N)) cm(.in1(in1), .in2(in2), .out(cmov_out));
        
    always @(*) begin
//        $display("in1 : %d, in2: %d, out : %d", in1, in2, out);
        case(op)
            5'b00000: begin
                case(func)
                    5'b00000, 5'b01111 : out <= add;
                    5'b00001 : out <= sub;
                    5'b00010 : out <= and_out;
                    5'b00011 : out <= or_out;
                    5'b00100 : out <= xor_out;
                    5'b00101 : out <= nor_out;
                    5'b00110 : out <= one_c;
                    5'b00111 : out <= sll_out;
                    5'b01000 : out <= srl_out;
                    5'b01001 : out <= ars_out;
                    5'b01010 : out <= inc_out;
                    5'b01011 : out <= dec_out;
                    5'b01100 : out <= slt_out;
                    5'b01101 : out <= sgt_out;
                    5'b01110 : out <= ham_out;
                    5'b10000 : out <= cmov_out;
                endcase
            end
            5'b00001, 5'b01111, 5'b01110, 5'b10000, 5'b10001, 5'b10010, 5'b10011 : out <= add;
            5'b00010 : out <= sub;
            5'b00011 : out <= and_out;
            5'b00100 : out <= or_out;
            5'b00101 : out <= xor_out;
            5'b00110 : out <= nor_out;
            5'b00111 : out <= one_c;
            5'b01000 : out <= sll_out;
            5'b01001 : out <= srl_out;
            5'b01010 : out <= ars_out;
            5'b01011 : out <= slt_out;
            5'b01100 : out <= sgt_out;
        endcase
    end
     
endmodule
