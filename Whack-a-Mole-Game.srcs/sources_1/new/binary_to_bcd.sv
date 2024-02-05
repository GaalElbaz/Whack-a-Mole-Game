`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: binary_to_bcd
//////////////////////////////////////////////////////////////////////////////////


module binary_to_bcd(
    input [5:0] score_count,
    input [4:0] time_count,
    output logic [3:0] score_ones,
    output logic [3:0] score_tens,
    output logic [3:0] time_ones,
    output logic [3:0] time_tens
    );
    
    logic [5:0] score_count_temp = 0;
    logic [4:0] time_count_temp = 0;
    
    always_comb begin
        // storing score and time values;
        score_count_temp = score_count;
        time_count_temp = time_count;
        // storing ones digit
        score_ones = score_count_temp % 10;
        time_ones = time_count_temp % 10;
        // setting tens digit
        score_count_temp = score_count_temp - score_ones;
        time_count_temp = time_count_temp - time_ones;
        score_count_temp = score_count_temp / 10;
        time_count_temp = time_count_temp / 10;
        // storing tens digit
        score_tens = score_count_temp % 10;
        time_tens = time_count_temp % 10;
    end
    
endmodule
