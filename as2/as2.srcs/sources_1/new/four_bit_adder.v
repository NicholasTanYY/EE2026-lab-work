`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.09.2023 14:50:27
// Design Name: 
// Module Name: four_bit_adder
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

// addition starts from the LSB - here
module four_bit_adder(input [3:0] fA, input [3:0] fB, output fCOUT, output [3:0] fS);  // f to indicate four
    wire C0, C1, C2;    // connectors for carry bits among all the one-bit adders
    one_bit_adder adder0(.A(fA[0]), .B(fB[0]), .CIN(0), .COUT(C0), .S(fS[0]));  // no CIN.
    one_bit_adder adder1(.A(fA[1]), .B(fB[1]), .CIN(C0), .COUT(C1), .S(fS[1]));
    one_bit_adder adder2(.A(fA[2]), .B(fB[2]), .CIN(C1), .COUT(C2), .S(fS[2]));
    one_bit_adder adder3(.A(fA[3]), .B(fB[3]), .CIN(C2), .COUT(fCOUT), .S(fS[3]));  // fCOUT to the three_bit_adder
endmodule
