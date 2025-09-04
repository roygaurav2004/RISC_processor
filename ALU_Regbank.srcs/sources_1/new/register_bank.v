`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 15:46:35
// Design Name: 
// Module Name: register_bank
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


module register_bank #(parameter N=32)(show, in_addr,ans, clk, w_add, w_data, r_add1, r_add2, r_data1, r_data2, regRead, regWrite);
    input clk, show;
    input [3:0] w_add, r_add1, r_add2;
    input [N-1:0] w_data;
    output reg [N-1:0] r_data1, r_data2;
    input regRead, regWrite;
    output [31:0] ans;
    input [3:0] in_addr;
    
    reg [N-1:0] arr [15:0]; // array of registers
    assign ans = show ? arr[in_addr] : 32'b0;  
    
    always @(posedge clk) begin   
        if(w_add != 4'b0000 && regWrite) begin
            arr[w_add] <= w_data;  
            $display("R[%d] = %b", w_add, w_data);          
        end
        else arr[0] <= 0;  
    end
    
    always @(negedge clk) begin
//        $display("%d %d %d %d", r_add1, r_add2, r_data1, r_data2);       
        if(regRead) begin
            r_data1 <= arr[r_add1];
            r_data2 <= arr[r_add2];
        end 
        else begin
            r_data1 <= r_data1;
            r_data2 <= r_data2;
        end
    end
endmodule
