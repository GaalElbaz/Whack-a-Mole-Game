`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Module Name: top_module
//////////////////////////////////////////////////////////////////////////////////


module top_module(
    input clk,
    input rst,
    input [15:0] sw,
    output logic [6:0] seg,
    output logic [15:0] led,
    output logic [3:0] an
    );
    
    wire one_sec_clock,slow_clock;
    wire [1:0] count_out;
    wire [5:0] score_out;
    wire [4:0] time_count;
    wire [3:0] score_ones, score_tens, time_ones, time_tens, mux_out;
    wire valid_play;
    
    slow_clock      U0(.clk_in(clk), .clk_out(slow_clock));
    two_bit_counter U1(.clk_in(slow_clock), .count_out(count_out));
    decoder         U2(.in(count_out), .an(an));
    mux4to1         U3(.A(time_ones), .B(time_tens), .C(score_ones), .D(score_tens), .sel(count_out), .out(mux_out));
    bcd_to_7seg     U4(.in(mux_out), .seg(seg));
    binary_to_bcd   U5(.score_count(score_out), .time_count(time_count), .score_ones(score_ones), .score_tens(score_tens), .time_ones(time_ones), .time_tens(time_tens));
    
    one_sec_clk L0(.clk_in(clk) ,.clk_out(one_sec_clock));
    timer_count L1(.clk_in(one_sec_clock) , .rst(rst) , .time_count(time_count), .valid_play(valid_play));
    game        L2(.clk(clk), .sw(sw), .rst(rst),.valid_play(valid_play), .led(led), .score_count(score_out));
    
endmodule
