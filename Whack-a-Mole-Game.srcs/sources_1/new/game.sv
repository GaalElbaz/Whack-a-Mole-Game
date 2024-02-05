`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: game
//////////////////////////////////////////////////////////////////////////////////


module game(
    input clk,
    input [15:0] sw,
    input rst,
    input valid_play,
    output logic [15:0] led,
    output logic [5:0] score_count
    );
    
    logic [5:0] current_state, next_state;
    logic [5:0] current_score = 0;
    
    always_ff @(posedge rst or posedge clk) begin
        if(rst) begin
            current_state <= 0;
            next_state <= 0;
            current_score = 0;
        end
        else begin
            current_state <= next_state;
        end
    end
    
    always @(sw[15:0] or current_state or valid_play) begin
        if(valid_play) begin
            case(current_state)
            0: begin
                led[15:0] <= 0;     //All leds are down
                led[3] <= 1;        //
                current_score <= 0;
                if(sw[3]) 
                    next_state <= 1;
                else
                    next_state <= 0;
            end
            1: begin
                led[15:0] <= 0;
                led[11] <= 1;
                current_score <= 1;
                if(sw[11])
                    next_state <= 2;
                else
                    next_state <= 1;
            end
            2: begin
                led[15:0] <= 0;
                led[4] <= 1;
                current_score <= 2;
                if(sw[4])
                    next_state <= 3;
                else
                    next_state <= 2;
            end
            3: begin
                led[15:0] <= 0;
                led[15] <= 1;
                current_score <= 3;
                if(sw[15])
                    next_state <= 4;
                else
                    next_state <= 3;
            end
            4: begin
                led[15:0] <= 0;
                led[0] <= 1;
                current_score <= 4;
                if(sw[0])
                    next_state <= 5;
                else
                    next_state <= 4;
            end
            5: begin
                led[15:0] <= 0;
                led[7] <= 1;
                current_score <= 5;
                if(sw[7])
                    next_state <= 6 ;
                else
                    next_state <= 5;
            end
            6: begin
                led[15:0] <= 0;
                led[8] <= 1;
                current_score <= 6;
                if(sw[8])
                    next_state <= 7;
                else
                    next_state <= 6;
            end
            7: begin
                led[15:0] <= 0;
                led[14] <= 1;
                current_score <= 7;
                if(sw[14])
                    next_state <= 8;
                else
                    next_state <= 7;
            end
            8: begin
                led[15:0] <= 0;
                led[1] <= 1;
                current_score <= 8;
                if(sw[1])
                    next_state <= 9;
                else
                    next_state <= 8;
            end
            9: begin
                led[15:0] <= 0;
                led[12] <= 1;
                current_score <= 9;
                if(sw[12])
                    next_state <= 10;
                else
                    next_state <= 9;
            end
            10: begin
                led[15:0] <= 0;
                led[2] <= 1;
                current_score <= 10;
                if(sw[2])
                    next_state <= 11;
                else
                    next_state <= 10;
            end
            11: begin
                led[15:0] <= 0;
                led[13] <= 1;
                current_score <= 11;
                if(sw[13])
                    next_state <= 12;
                else
                    next_state <= 11;
            end
            12: begin
                led[15:0] <= 0;
                led[10] <= 1;
                current_score <= 12;
                if(sw[10])
                    next_state <= 13;
                else
                    next_state <= 12;
            end
            13: begin
                led[15:0] <= 0;
                led[10] <= 1;
                current_score <= 13;
                if(sw[10])
                    next_state <= 14;
                else
                    next_state <= 13;
            end
            14: begin
                led[15:0] <= 0;
                led[9] <= 1;
                current_score <= 14;
                if(sw[9])
                    next_state <= 15;
                else
                    next_state <= 14;
            end
            15: begin
                led[15:0] <= 0;
                led[5] <= 1;
                current_score <= 15;
                if(sw[5])
                    next_state <= 16;
                else
                    next_state <= 15;
            end
            16: begin
                led[15:0] <= 0;
                led[6] <= 1;
                current_score <= 16;
                if(sw[6])
                    next_state <= 17;
                else
                    next_state <= 16;
            end
            17: begin
                led[15:0] <= 0;
                led[4] <= 1;
                current_score <= 17;
                if(sw[4])
                    next_state <= 18;
                else
                    next_state <= 17;
            end
            18: begin
                led[15:0] <= 0;
                led[11] <= 1;
                current_score <= 18;
                if(sw[11])
                    next_state <= 19;
                else
                    next_state <= 18;
            end
            19: begin
                led[15:0] <= 0;
                led[0] <= 1;
                current_score <= 19;
                if(sw[0])
                    next_state <= 20;
                else
                    next_state <= 19;
            end
            20: begin
                led[15:0] <= 0;
                led[7] <= 1;
                current_score <= 20;
                if(sw[7])
                    next_state <= 21;
                else
                    next_state <= 20;
            end
            21: begin
                led[15:0] <= 0;
                led[9] <= 1;
                current_score <= 21;
                if(sw[9])
                    next_state <= 22;
                else
                    next_state <= 21;
            end
            22: begin
                led[15:0] <= 0;
                led[5] <= 1;
                current_score <= 22;
                if(sw[5])
                    next_state <= 23;
                else
                    next_state <= 22;
            end
            23: begin
                led[15:0] <= 0;
                led[14] <= 1;
                current_score <= 23;
                if(sw[14])
                    next_state <= 24;
                else
                    next_state <= 23;
            end
            24: begin
                led[15:0] <= 0;
                led[8] <= 1;
                current_score <= 24;
                if(sw[8])
                    next_state <= 25;
                else
                    next_state <= 24;
            end
            25: begin
                led[15:0] <= 0;
                led[9] <= 1;
                current_score <= 25;
                if(sw[9])
                    next_state <= 26;
                else
                    next_state <= 25;
            end
            26: begin
                led[15:0] <= 0;
                led[11] <= 1;
                current_score <= 26;
                if(sw[11])
                    next_state <= 27;
                else
                    next_state <= 26;
            end
            27: begin
                led[15:0] <= 0;
                led[1] <= 1;
                current_score <= 27;
                if(sw[1])
                    next_state <= 28;
                else
                    next_state <= 27;
            end
            28: begin
                led[15:0] <= 0;
                led[6] <= 1;
                current_score <= 28;
                if(sw[6])
                    next_state <= 29;
                else
                    next_state <= 28;
            end
            29: begin
                led[15:0] <= 0;
                led[13] <= 1;
                current_score <= 29;
                if(sw[13])
                    next_state <= 30;
                else
                    next_state <= 29;
            end
            30: begin
                led[15:0] <= 0;
                led[4] <= 1;
                current_score <= 30;
                if(sw[4])
                    next_state <= 31;
                else
                    next_state <= 30;
            end
            31: begin
                led[15:0] <= 0;
                current_score <= 31;
                end
            endcase
        end
        else begin
            led[15:0] <= 0;
        end
    end
    
    assign score_count = current_score;
endmodule
