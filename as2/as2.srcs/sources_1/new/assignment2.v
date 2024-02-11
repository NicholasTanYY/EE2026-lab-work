`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2023 14:18:21
// Design Name: 
// Module Name: assignment2
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

//module assignment2(input [13:0]SW, input BTNL, output [1:0]AN, output [2:0]SEG, output [10:0]LD);
module assignment2(input [6:0]A, B, input BTNL, output [3:0]AN, output [2:0]SEG, output [3:0]T, output [6:0]S);
    
    // AN[3:0] and SEG[6:0] are active low signals
    assign AN[3] = 1; 
    assign AN[2] = 1;
    assign AN[1] = 0; 
    assign AN[0] = 0;
    assign SEG[0] = 0;      // seg0
    assign SEG[1] = 0;      // seg2
    assign SEG[2] = 0;      // seg4
    
    assign T[3] = BTNL;
    assign T[2] = BTNL;
    assign T[1] = BTNL;
    assign T[0] = BTNL;

    // input: switches. output: sum
//    seven_bit_adder adder(.sA(SW[6:0]), .sB(SW[13:7]), .sS(SUM[6:0])); // calling the adder
   
    wire CARRY;        // carry bit
    wire [6:0] SUM;
    four_bit_adder least_significant_bits(.fA(A[3:0]), .fB(B[3:0]), .fCOUT(CARRY), .fS(SUM[3:0]));
    three_bit_adder most_significant_bits(.tA(A[6:4]), .tB(B[6:4]), .tCIN(CARRY), .tS(SUM[6:4]));

    assign S[6:0] = BTNL ? {SUM[4:0], 2'b00} : SUM[6:0];
    
endmodule
