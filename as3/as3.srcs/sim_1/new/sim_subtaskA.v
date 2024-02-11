`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2023 01:23:31
// Design Name: 
// Module Name: sim_subtaskA
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


module sim_subtaskA(

    );
    
    // inputs and outputs
    reg sim_basys_clock;
    reg [2:0] sim_SW;
    wire [12:0] sim_LD;
    wire [3:0] sim_countA;
    
    // call module
    counterA test_counterA(.basys_clock(sim_basys_clock), .countA(sim_countA[3:0]));
    led_controlA test_led_controlA(.basys_clock(sim_basys_clock), .countA(sim_countA[3:0]), .SW(sim_SW[2:0]), .LD(sim_LD[12:0]));
    
    // start the simulation
    initial begin
        sim_basys_clock = 0; sim_SW = 3'b100;
    end
    
    always begin
        #5 sim_basys_clock = ~sim_basys_clock;
    // to this line, the simulation code is always the same.
    // Basically the simulation always just flips the original clock.
    // The other clocks will follow the orientation of this basys clock.
    end
endmodule
