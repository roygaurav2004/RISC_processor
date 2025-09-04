`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 16:32:21
// Design Name: 
// Module Name: test
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


module test;
    reg clk;
    reg init;
    reg show;
    reg [3:0] in_addr;
    wire [15:0] out;
    main_module m1(.clk(clk), .init(init), .out(out), .show(show), .in_addr(in_addr));
    
    initial
    begin
        clk = 1'b0;
        init = 1'b1;
        show = 0;
        in_addr = 4'b1;
        #2 init = 1'b0;
//        instr = 32'b00001000000000100000000000000011;
        
//        #72 instr = 32'b00001000000001000000000000000010;
//        #72 instr = 32'b00001000000001000000000000000010;
//        #72 instr = 32'b00000000010001000011000000000111;
//        #72 instr = 32'b01111000000001100000000000000001; //ST
//        #92 instr = 32'b01110000000010000000000000000001; //LD
//        #100 $finish;
        
    end
    
    always #1 clk = ~clk;
endmodule
