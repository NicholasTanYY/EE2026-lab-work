`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2023 00:42:25
// Design Name: 
// Module Name: as3
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


module as3(
    input basys_clock,
    input [2:0] sw,
    input sw15,
    input [2:0] pb,
    output reg [12:0] led,
    output reg LD15,
    output reg [3:0] an,
    output reg [6:0] seg
    );
    
    wire a_status, b_status, stop_d;
    wire [1:0] task_id;
    wire [3:0] anB, anC, anD;
    wire [6:0] segB, segC, segD;
    wire [12:0] ledA, ledD;
    wire LD15B, LD15D;
    
    wire clock_1Hz;
    
    clk_1Hz run_clock_1Hz(.basys_clock(basys_clock), .slow_clock(clock_1Hz));
    
    led_controlA run_subtaskA(.basys_clock(basys_clock), .sw(sw[2:0]), .led(ledA[12:0]), .a_status(a_status));
    subtask_B run_subtaskB(.pb(pb), .basys_clock(basys_clock), .a_status(a_status), .b_status(b_status), .LD15(LD15B), .an(anB[3:0]), .seg(segB[6:0]));
    subtask_C run_subtaskC(.basys_clock(basys_clock), .b_status(b_status), .sw(sw[2:0]), .an(anC[3:0]), .seg(segC[6:0]));
    subtask_D run_subtaskD(.basys_clock(basys_clock), .clk_1Hz(clock_1Hz), .sw15(sw15), .stop_d(stop_d), .LD15(LD15D), .led(ledD[12:0]), .an(anD[3:0]), .seg(segD[6:0]));

    task_handler run_task_handler(.basys_clock(basys_clock), .a_status(a_status), .b_status(b_status), .stop_d(stop_d), .task_id(task_id));
    
    // Multiplexers for an, seg, and LD15 based on task_id
    always @ (posedge basys_clock) begin
        if (stop_d) begin       // run this code when sw15 has been on for 3 seconds - subtaskD
            an <= ~4'b1111;
            seg <= ~7'b1111100;
            led <= 13'b0000_1001_1010_0;
            LD15 <= 0;
        end
        
        if (~stop_d) begin
            case (task_id)
                2'b00:              // subtaskA
                    begin
                        led <= ledA;
                        an <= ~4'b0000;
                        seg <= ~7'b0000000;
                        LD15 <= 0;  
                    end
                2'b01:              // subtaskB
                    begin
                        led <= ledA;        // led patterns follow that of subtask A
                        an <= anB;
                        seg <= segB;
                        LD15 <= LD15B;
                    end
                2'b10:              // subtaskC
                    begin
                        led <= ledA;        // led patterns follow that of subtask A
                        an <= anC;
                        seg <= segC;
                        LD15 <= 1;
                    end
                default: 
                    begin
                        an = ~4'b1010;
                        seg = ~7'b1010101;
                        LD15 = 1;
                    end
            endcase
        end
    end
endmodule
