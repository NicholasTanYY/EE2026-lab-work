`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2023 15:47:09
// Design Name: 
// Module Name: subtaskC
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


module subtask_C(
    input basys_clock,
    input b_status,
    input [2:0] sw,
    output [3:0] an,
    output [6:0] seg
    );
    
    // run slow clocks
    wire clock_200Hz; wire clock_20Hz; wire clock_2Hz;
    
    clk_200Hz run_clk_200Hz(.basys_clock(basys_clock), .slow_clock(clock_200Hz));
    clk_20Hz run_clk_20Hz(.basys_clock(basys_clock), .slow_clock(clock_20Hz));
    clk_2Hz run_clk_2Hz(.basys_clock(basys_clock), .slow_clock(clock_2Hz));

    // choose which clock to use based on the switch that is turned on
    reg used_clock;
    
    always @ (posedge basys_clock) begin
        if (sw[2]) begin
            used_clock <= clock_200Hz;
        end
        if (sw[1] && ~sw[2]) begin
            used_clock <= clock_20Hz;
        end
        if (sw[0] && ~sw[2] && ~sw[1]) begin
            used_clock <= clock_2Hz;
        end            
    end
    
    reg [1:0] countC = 2'b01;       // set countC to show 'd' first
    always @ (posedge used_clock) begin
        // countC should only takes values 1, 2 and 3
        // add 2 to countC if it == 3, so that we dont get to the case where countC == 1
        countC <= (countC == 2'b11) ? countC + 2 : countC + 1; 
    end
    
    wire sw15on_for_3s;
    segment_controlC run_segment_controlC(.basys_clock(basys_clock), .countC(countC[1:0]), .sw15_3s(sw15on_for_3s), .an(an[3:0]), .seg(seg[6:0]));

    
endmodule
