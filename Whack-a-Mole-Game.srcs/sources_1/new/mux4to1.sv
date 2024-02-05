`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: mux4to1
//////////////////////////////////////////////////////////////////////////////////


module mux4to1(
    input [3:0] A, // Time ones
    input [3:0] B, // Time tens
    input [3:0] C, // Score ones
    input [3:0] D, // Score tens
    input [1:0] sel,
    output logic [3:0] out
    );
    
    always_comb begin
        case(sel) 
            2'b00: out = A;
            2'b01: out = B;
            2'b10: out = C;
            2'b11: out = D;
        endcase
    end
endmodule
