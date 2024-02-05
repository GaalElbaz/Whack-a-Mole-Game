`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: timer_count
// 
//////////////////////////////////////////////////////////////////////////////////


module timer_count(
    input clk_in,
    input rst,
    output logic [4:0] time_count,
    output logic valid_play
    );
    
    logic [4:0] time_start = 20;
    
    always_ff @(posedge clk_in or posedge rst) begin
        if(rst) begin
            time_start <= 20;
            valid_play <= 1;
        end
        else if(time_start >= 1) begin
            time_start <= time_start - 1;
            valid_play <= 1;
        end
        else if(time_start == 0) begin
            time_start <= 0;
            valid_play <= 0;
        end
    end
    
    assign time_count = time_start;
    
    
endmodule
