`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2023 15:10:18
// Design Name: 
// Module Name: sim_as3
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

module sim_as3();

    // Declare the signals
    reg basys_clock;
    reg [2:0] sw;
    reg [2:0] pb;
    wire [12:0] led;
    wire LD15;
    wire [3:0] an;
    wire [6:0] seg;
    wire LD15B;
    wire a_status, b_status, task_id;

    // Instantiate the as3 module
    as3 uut(
        .basys_clock(basys_clock),
        .sw(sw),
        .pb(pb),
        .led(led),
        .LD15(LD15),
        .an(an),
        .seg(seg)
    );

    // Clock generation
    always begin
        #5 basys_clock = ~basys_clock;  // Assuming 10ns clock period (100MHz)
    end

    // Test Sequence
    initial begin
        // Initial conditions
        basys_clock = 0;
        sw = 3'b000;
        pb = 3'b000;
        #1400000;

        // 1. No buttons pressed, no switches flipped
        #1000;

        // 2. Flip SW[0]
        sw[0] = 1;
        #10;

        // 3. Press BTND (pb[0])
        pb[0] = 1;
        #10;
        pb[0] = 0;
        #10;

    end

endmodule

