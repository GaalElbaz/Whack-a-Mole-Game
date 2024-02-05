`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: one_sec_clk
//////////////////////////////////////////////////////////////////////////////////


module one_sec_clk(
    input clk_in, // Basys 3 clk -> 100MHz
    output logic clk_out
    );
    
    logic [27:0] counter = 0;
    logic clk_one_sec = 0;
    
    always_ff @(posedge clk_in) begin
        if(counter == 100_000_000 - 1) begin
            counter <= 0;
            clk_one_sec <= 1;
        end
        else begin
            counter <= counter + 1;
            clk_one_sec <= 0;
        end
    end
    
    assign clk_out = clk_one_sec;
endmodule
