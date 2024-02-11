`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2023 11:06:52
// Design Name: 
// Module Name: as1
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


module as1(
    input SW0,
    input SW1,
    input SW2,
    input SW3,
    input SW4,
    input SW5,
    input SW6,
    input SW7,
    input SW8,
    input SW9,
    output LD0,
    output LD1,
    output LD2,
    output LD3,
    output LD4,
    output LD5,
    output LD6,
    output LD7,
    output LD8,
    output LD9,
    output LD15,
    output SEG0,
    output SEG1,
    output SEG2,
    output SEG3,
    output SEG4,
    output SEG5,
    output SEG6,
    output DP,
    output AN0,
    output AN1,
    output AN2,
    output AN3
    );

    assign LD0 = SW0;
    assign LD1 = SW1;
    assign LD2 = SW2;
    assign LD3 = SW3;
    assign LD4 = SW4;
    assign LD5 = SW5;
    assign LD6 = SW6;
    assign LD7 = SW7;
    assign LD8 = SW8;
    assign LD9 = SW9;
    assign LD15 = ~SW0 & ~SW1 & SW2 & ~SW3 & SW4 & SW5 & ~SW6 & ~SW7 & SW8 & ~SW9;       // 5 digits are 54482
    
    // all active low - active when being pulled down to low?
    assign SEG0 = ~SW0 & ~SW1 & SW2 & ~SW3 & SW4 & SW5 & ~SW6 & ~SW7 & SW8 & ~SW9;
    assign SEG1 = 1;
    assign SEG2 = ~(~SW0 & ~SW1 & SW2 & ~SW3 & SW4 & SW5 & ~SW6 & ~SW7 & SW8 & ~SW9);
    assign SEG3 = ~(~(~SW0 & ~SW1 & SW2 & ~SW3 & SW4 & SW5 & ~SW6 & ~SW7 & SW8 & ~SW9) | ~SW0 & ~SW1 & SW2 & ~SW3 & SW4 & SW5 & ~SW6 & ~SW7 & SW8 & ~SW9);
    assign SEG4 = ~(~(~SW0 & ~SW1 & SW2 & ~SW3 & SW4 & SW5 & ~SW6 & ~SW7 & SW8 & ~SW9) | ~SW0 & ~SW1 & SW2 & ~SW3 & SW4 & SW5 & ~SW6 & ~SW7 & SW8 & ~SW9);
    assign SEG5 = ~(~SW0 & ~SW1 & SW2 & ~SW3 & SW4 & SW5 & ~SW6 & ~SW7 & SW8 & ~SW9);
    assign SEG6 = ~(~(~SW0 & ~SW1 & SW2 & ~SW3 & SW4 & SW5 & ~SW6 & ~SW7 & SW8 & ~SW9) | ~SW0 & ~SW1 & SW2 & ~SW3 & SW4 & SW5 & ~SW6 & ~SW7 & SW8 & ~SW9);
    assign DP = 1;    //never on
    assign AN0 = ~(~SW0 & ~SW1 & SW2 & ~SW3 & SW4 & SW5 & ~SW6 & ~SW7 & SW8 & ~SW9);   // on when correct password input
    assign AN1 = ~SW0 & ~SW1 & SW2 & ~SW3 & SW4 & SW5 & ~SW6 & ~SW7 & SW8 & ~SW9;    // on when password is wrong
    assign AN2 = 0;  // on all the time
    assign AN3 = ~SW0 & ~SW1 & SW2 & ~SW3 & SW4 & SW5 & ~SW6 & ~SW7 & SW8 & ~SW9;  // on when password is wrong
   
    
endmodule
