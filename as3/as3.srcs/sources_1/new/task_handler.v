`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2023 17:24:00
// Design Name: 
// Module Name: task_handler
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


module task_handler(
    input basys_clock,
    input a_status,
    input b_status,
    input stop_d,
    output reg [1:0] task_id = 2'b00
    );
    
    always @ (posedge basys_clock) begin
        if (~a_status && ~b_status) begin
            task_id <= 2'b00;
        end
    
        if (a_status && ~b_status) begin     // subtask A is completed
            task_id <= 2'b01;       // execute code for subtask B
        end
        if (b_status && a_status) begin     // subtask b is completed
            task_id <= 2'b10;       // execute code for subtask C
        end
    end
    
endmodule
