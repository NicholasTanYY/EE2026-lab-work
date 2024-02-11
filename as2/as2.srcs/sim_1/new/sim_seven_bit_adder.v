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


module sim_as2(

    );
    // inputs (register)  
    reg [13:0]SW;
    reg pb;                 // BTNL
    wire [6:0] A, B;        // input values
    assign A[6:0] = SW[6:0];
    assign B[6:0] = SW[13:7];

//    assign SW[6:0] = A[6:0];
//    assign SW[6:0] = B[13:7];
    
    // outputs (wire)
    wire [1:0] AN; wire [2:0] SEG; wire [10:0] LD; 
    wire [6:0] S;       // Sum
    assign S[6:0] = LD[6:0];        // ??
    assign LD[10:7] = pb;
    
    wire [6:0]sim_S;
    
    // call module
    assignment2 sim_as2(.SW(SW[13:0]), .BTNL(pb), .AN(AN[1:0]), .SEG(SEG[2:0]), .LD(LD[10:0]));
    
    // start the simulation - listing simulation paramaters
    initial
    begin
//        sim_A = 5; sim_B = 6; #25;;
//        sim_A = 7'b1111111; sim_B = 7'b0000001; #25;
        SW[]
    end
endmodule
