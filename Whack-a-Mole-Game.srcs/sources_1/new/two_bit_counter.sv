`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: two_bit_counter
//////////////////////////////////////////////////////////////////////////////////


module two_bit_counter(
    input clk_in,
    output logic [1:0] count_out
    );
    
    logic [1:0] curr_count = 2'b00;
    // 00 -> 01 -> 10 -> 11 -> 00 -> 01 -> ... 
    always_ff @(posedge clk_in) begin
        if(curr_count == 2'b11) begin
            curr_count <= 2'b00;
        end
        else begin
            curr_count <= curr_count + 2'b01;
        end
    end
    
    assign count_out = curr_count;
endmodule
