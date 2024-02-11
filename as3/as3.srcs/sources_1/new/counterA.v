`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2023 00:49:36
// Design Name: 
// Module Name: counterA
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

// counter which increments every 0.54 seconds
module counterA(
    input basys_clock,
    output reg [3:0] countA = 4'b0000
    );
    
    wire clkA;
    clk_subtaskA run_clockA(.basys_clock(basys_clock), .slow_clock(clkA));
    
    always @ (posedge clkA) begin
        if (countA < 4'b1101) begin     // stop counting once counter reaches 13
            countA <= countA + 1;
        end
    end
    
endmodule
