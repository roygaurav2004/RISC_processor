`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 21:22:44
// Design Name: 
// Module Name: instr_mem
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


module instr_mem(
    input clk,
    output [31:0] instr,
    input [31:0] pc
);

    wire [31:0] temp;
    
    blk_mem_gen_0 your_instance_name (
      .clka(clk),    // input wire clka
      .wea(1'b0),      // input wire [0 : 0] wea
      .addra(pc),  // input wire [15 : 0] addra
      .dina(temp),    // input wire [31 : 0] dina
      .douta(instr)  // output wire [31 : 0] douta
    );
endmodule
