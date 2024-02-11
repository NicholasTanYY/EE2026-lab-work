`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2023 11:19:12
// Design Name: 
// Module Name: sim_as1
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


module sim_as1(

    );
    
    // initialise inputs
    reg SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7, SW8, SW9;
    
    // initialise outputs
    wire LD0, LD1, LD2, LD3, LD4, LD5, LD6, LD7, LD8, LD9, LD15, SEG0, SEG1, SEG2, SEG3, SEG4, SEG5, SEG6, DP, AN0, AN1, AN2, AN3;

    // call function
    as1 simulate(SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7, SW8, SW9, LD0, LD1, LD2, LD3, LD4, LD5, LD6, LD7, LD8, LD9, LD15, SEG0, SEG1, SEG2, SEG3, SEG4, SEG5, SEG6, DP, AN0, AN1, AN2, AN3);
    
    // start the simulation
    initial begin
        SW0=1; SW1=0; SW2=0; SW3=0; SW4=0; SW5=0; SW6=0; SW7=0; SW8=0; SW9=0; #10;
        SW0=0; SW1=1; SW2=0; SW3=0; SW4=0; SW5=0; SW6=0; SW7=0; SW8=0; SW9=0; #10;
        SW0=0; SW1=0; SW2=1; SW3=0; SW4=0; SW5=0; SW6=0; SW7=0; SW8=0; SW9=0; #10;
        SW0=0; SW1=0; SW2=0; SW3=1; SW4=0; SW5=0; SW6=0; SW7=0; SW8=0; SW9=0; #10;
        SW0=0; SW1=0; SW2=0; SW3=0; SW4=1; SW5=0; SW6=0; SW7=0; SW8=0; SW9=0; #10;
        SW0=0; SW1=0; SW2=0; SW3=0; SW4=0; SW5=1; SW6=0; SW7=0; SW8=0; SW9=0; #10;
        SW0=0; SW1=0; SW2=0; SW3=0; SW4=0; SW5=0; SW6=1; SW7=0; SW8=0; SW9=0; #10;
        SW0=0; SW1=0; SW2=0; SW3=0; SW4=0; SW5=0; SW6=0; SW7=1; SW8=0; SW9=0; #10;
        SW0=0; SW1=0; SW2=0; SW3=0; SW4=0; SW5=0; SW6=0; SW7=0; SW8=1; SW9=0; #10;
        SW0=0; SW1=0; SW2=0; SW3=0; SW4=0; SW5=0; SW6=0; SW7=0; SW8=0; SW9=1; #10;
        SW0=0; SW1=1; SW2=0; SW3=1; SW4=0; SW5=0; SW6=1; SW7=0; SW8=0; SW9=0; #10;
        SW0=0; SW1=0; SW2=1; SW3=0; SW4=1; SW5=1; SW6=0; SW7=0; SW8=1; SW9=0; #10;
        SW0=1; SW1=1; SW2=1; SW3=1; SW4=1; SW5=1; SW6=1; SW7=1; SW8=1; SW9=1; #10;
    end
endmodule
