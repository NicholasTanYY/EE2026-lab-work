`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.09.2023 17:18:07
// Design Name: 
// Module Name: slow_clock
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


module clk_200Hz(
    input basys_clock,
    output reg slow_clock = 0   // set slow_clock as an output register with initial value 0, since we use it in the always block
    );
    
    // counter which determines when the slow clock's signal should be flipped
    // reg[3:0] is 4 bits hence can count from 0 to 15
    reg[31:0] count = 0;
    
    always @(posedge basys_clock) begin
        // if we want the clock to run the full duration of the counter
        //count <= count + 1;
        
        // if we want the clock to stop before it hits the full counter
        count <= (count == 249999) ? 0 : count + 1;    // count until 49999999, then reset to 0
        
        // since we use slow_clock in an always block (we are always assigning a new value to slow_clock
        // then slow_clock needs to be an output REGISTER
        
        // everytime the count is 0 at the positive edge of the basys signal, invert the slow signal
        slow_clock <= (count == 0) ? ~slow_clock : slow_clock;
    end
    
endmodule
