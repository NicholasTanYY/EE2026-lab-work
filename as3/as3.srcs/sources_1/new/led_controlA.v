`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2023 00:55:15
// Design Name: 
// Module Name: led_controlA
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


module led_controlA(
    input basys_clock,
    input [2:0] sw,
    output reg [12:0] led = 13'b0000_0000_0000_0,
    output reg a_status = 0
    );
    
    wire clock1Hz, clock10Hz, clock100Hz;
    clk_1Hz run_1Hz(.basys_clock(basys_clock), .slow_clock(clock1Hz));
    clk_10Hz run_10Hz(.basys_clock(basys_clock), .slow_clock(clock10Hz));
    clk_100Hz run_100Hz(.basys_clock(basys_clock), .slow_clock(clock100Hz));
    
    wire [3:0] countA;
    counterA run_counter_A(.basys_clock(basys_clock), .countA(countA));
    
    always @ (posedge basys_clock) begin
        case (countA)
            4'b0001: 
                begin
                    led <= 13'b0000_0000_0000_1;
                end
            4'b0010: 
                begin
                    led <= 13'b0000_0000_0001_1;
                end
            4'b0011: 
                begin
                    led <= 13'b0000_0000_0011_1;
                end
            4'b0100: 
                begin
                    led <= 13'b0000_0000_0111_1;
                end
            4'b0101: 
                begin
                    led <= 13'b0000_0000_1111_1;
                end
            4'b0110: 
                begin
                    led <= 13'b0000_0001_1111_1;
                end
            4'b0111: 
                begin
                    led <= 13'b0000_0011_1111_1;
                end
            4'b1000: 
                begin
                    led <= 13'b0000_0111_1111_1;
                end
            4'b1001: 
                begin
                    led <= 13'b0000_1111_1111_1;
                end
            4'b1010: 
                begin
                    led <= 13'b0001_1111_1111_1;
                end
            4'b1011: 
                begin
                    led <= 13'b0011_1111_1111_1;
                end
            4'b1100: 
                begin
                    led <= 13'b0111_1111_1111_1;
                end
            4'b1101: 
                begin
                    led <= 13'b1111_1111_1111_1;
                end
            default:
                begin
                    led <= 13'b0000_0000_0000_0;
                end
        endcase
        
        if (countA == 13) begin
            a_status <= 1;
        end
        // order conditional statements from sw[2] to sw[0]
        if (countA == 13 && sw[2]) begin
            led[2] <= clock100Hz;
        end
        if (countA == 13 && sw[1] && ~sw[2]) begin
            led[1] <= clock10Hz;
        end
        if (countA == 13 && sw[0] && ~sw[2] && ~sw[1]) begin
            led[0] <= clock1Hz;
        end
        
    end
    
endmodule
