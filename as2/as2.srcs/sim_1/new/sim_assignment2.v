`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2023 15:46:05
// Design Name: 
// Module Name: sim_as2
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


module sim_assignment2(

    );
    // inputs (register)
    reg [6:0] A, B;
    reg pb;                 // BTNL
    
    // outputs (wire)
    wire [3:0] AN; 
    wire [2:0] SEG; 
    wire [6:0] S;           // Sum
    wire [3:0] T;
    
    assign T[0] = pb;
    assign T[1] = pb;
    assign T[2] = pb;
    assign T[3] = pb;
    
    // call main module
    assignment2 sim_as2(.A(A[6:0]), .B(B[6:0]), .BTNL(pb), .AN(AN[3:0]), .SEG(SEG[2:0]), .T(T[3:0]), .S(S[6:0]));
    
    // start the simulation - listing simulation paramaters
    initial
    begin
        // pb OFF
        A[6:0] = 7'b0010001; B[6:0] = 7'b0000001; pb = 0; #25;
        A[6:0] = 7'b0001010; B[6:0] = 7'b0000001; pb = 0; #25;
        A[6:0] = 7'b0100110; B[6:0] = 7'b0001111; pb = 0; #25;
        
        // pb ON
        A[6:0] = 7'b0000001; B[6:0] = 7'b0000101; pb = 1; #25;
        A[6:0] = 7'b0001011; B[6:0] = 7'b0110001; pb = 1; #25;
        A[6:0] = 7'b1110001; B[6:0] = 7'b1001100; pb = 1; #25;
    end
endmodule
