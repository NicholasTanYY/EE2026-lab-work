`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2023 00:44:07
// Design Name: 
// Module Name: clk_subtaskA
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

// clk that counts 0.54 seconds
module clk_subtaskA(
    input basys_clock,
    output reg slow_clock = 0   // set slow_clock as an output register with initial value 0, since we use it in the always block
    );
    
    // counter which determines when the slow clock's signal should be flipped
    reg[31:0] count = 0;
    
    always @(posedge basys_clock) begin
        // value determined by ((100*10^6)/(2*(1/0.54))-1
        count <= (count == 26999999) ? 0 : count + 1;    // count until 26999999, then reset to 0
//        count <= (count == 49999) ? 0 : count + 1;    // faster clock for testing in simulations
        // since we use slow_clock in an always block (we are always assigning a new value to slow_clock
        // then slow_clock needs to be an output REGISTER
        
        // everytime the count is 0 at the positive edge of the basys signal, invert the slow signal
        slow_clock <= (count == 0) ? ~slow_clock : slow_clock;
    end
endmodule
