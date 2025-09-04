`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2024 21:44:44
// Design Name: 
// Module Name: data_mem
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


module data_mem(input clk, input wea, input [15:0] addra, input [31:0] dina, output [31:0] dout);

    blk_mem_gen_2 your_instance_name (
      .clka(clk),    // input wire clka
      .ena(1'b1),      // input wire ena
      .wea(wea),      // input wire [0 : 0] wea
      .addra(addra),  // input wire [15 : 0] addra
      .dina(dina),    // input wire [31 : 0] dina
      .douta(dout)  // output wire [31 : 0] douta
    );
endmodule
