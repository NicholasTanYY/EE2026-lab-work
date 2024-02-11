`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2023 14:50:27
// Design Name: 
// Module Name: three_bit_adder
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

// MSB here - addtion carries on from four_bit_adder
module three_bit_adder(input [2:0] tA, input [2:0] tB, input tCIN, output [2:0] tS);  // t for three
    wire C3, C4, _; // connectors for carry bits among all the one-bit adders
    one_bit_adder adder4(.A(tA[0]), .B(tB[0]), .CIN(tCIN), .COUT(C3), .S(tS[0]));  // CIN from four_bit_adder
    one_bit_adder adder5(.A(tA[1]), .B(tB[1]), .CIN(C3), .COUT(C4), .S(tS[1]));
    one_bit_adder adder6(.A(tA[2]), .B(tB[2]), .CIN(C4), .COUT(_), .S(tS[2]));  // no COUT at the MSB
    
endmodule
