`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2023 19:26:27
// Design Name: 
// Module Name: subtask_D
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


module subtask_D(
    input basys_clock,
    input clk_1Hz,
    input sw15,
    output reg stop_d = 0,
    output reg LD15,
    output reg [12:0] led,
    output reg [3:0] an,
    output reg [6:0] seg
    );
    
    reg [31:0] count = 0;
    
    always @ (posedge basys_clock) begin
        if (sw15) begin
            count <= count + 1;
            if (count == 299999999) begin     // counted up to first 3 seconds
               stop_d <= 1;
            end
        end
        if (~sw15) begin                // reset when sw15 is turned off
            stop_d <= 0;
            count <= 0;                 // reset counter for the next time sw15 is on
        end    
    end
endmodule
