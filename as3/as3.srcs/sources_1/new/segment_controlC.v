`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.09.2023 16:40:44
// Design Name: 
// Module Name: segment_controlC
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


module segment_controlC(
    input basys_clock,
    input [1:0] countC,
    input sw15_3s,
    output reg [3:0] an,
    output reg [6:0] seg
    );
    
    always @ (posedge basys_clock) begin
        case (countC)
            2'b01:      //1st step
                begin
                    an <= ~4'b0001;
                    seg <= ~7'b1011110;
                end
            2'b10:      //2nd step
                begin
                    an <= ~4'b0010;
                    seg <= ~7'b0110000;
                end
            2'b11:      //3rd step
                begin
                    an <= ~4'b0100;
                    seg <= ~7'b1010000;
                end
            default: 
                begin
                    an <= 4'b0000;
                    seg <= 7'b0000000;
                end
        endcase
    end
    
    
endmodule
