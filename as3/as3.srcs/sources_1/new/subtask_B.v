`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2023 12:57:39
// Design Name: 
// Module Name: subtask_B
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


module subtask_B(
    input [2:0] pb,
    input basys_clock,
    input a_status,
    output reg b_status = 0,
    output reg LD15 = 0,
    output reg [3:0] an = ~4'b0000,
    output reg [6:0] seg = ~7'b0000000
    );
    
    reg [1:0] step = 2'b01;    // 3 steps in total: d, then l then r  
    
    always @ (posedge basys_clock) begin
        if (a_status == 1) begin
            if (step == 2'b01) begin        // step 1
                // display anodes and segments - showing d on rightmost anode
                an <= ~4'b0001;
                seg <= ~7'b1011110;
                // check if pushbutton d is pressed
                if (pb[0] == 1) begin       // pb[0] is BTND
                    step <= step + 1;
                end
            end
            if (step == 2'b10) begin        // step 2
                // display anodes and segments - showing l on 2nd anode from the right
                an <= ~4'b0010;
                seg <= ~7'b0110000;
                // check if pushbutton l is pressed
                if (pb[1] == 1) begin       // pb[1] is BTNL
                    step <= step + 1;
                end
            end
            if (step == 2'b11) begin        // step 3
                // display anodes and segments - showing r on 3rd anode from the right
                an <= ~4'b0100;
                seg <= ~7'b1010000;
                // check if pushbutton r is pressed
                if (pb[2] == 1) begin       // pb[2] is BTNR
                    step <= step + 1;       // step now becomes 2'b00, go into unlock mode
                end
            end
            if (step == 2'b00) begin        // unlock mode
                // turn on LD15
                LD15 <= 1;
                // display anodes and segments - showing d on rightmost anode
                an <= ~4'b0001;
                seg <= ~7'b1011110;
                // update b_status to indicate that subtask_b is completed
                b_status <= 1;
            end
        end
    end
endmodule
