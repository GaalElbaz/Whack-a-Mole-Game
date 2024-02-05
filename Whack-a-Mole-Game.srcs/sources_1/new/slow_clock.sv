`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: slow_clock
//////////////////////////////////////////////////////////////////////////////////


module slow_clock(
    input clk_in,
    output logic clk_out
    );
    
    logic [10:0] count = 0;
    
    always_ff @(posedge clk_in) begin
        if(count[10]) begin
            count <= 0;
            clk_out <= 1;
        end
        else begin
            count <= count + 1'b1;
            clk_out <= 0;
        end
    end
endmodule
