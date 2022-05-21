// simple two-stage pipelined register
module pipe_2stage (R0, Data, En, Ld, clk, rst);
    output R0;
    input Data;
    input En, Ld, clk, rst; //Ld. load
    //
    // four-states
    parameter S_idle = 0;
    parameter S_1 = 1;
    parameter S_full = 2;
    parameter S_wait = 3;
    //
    reg  [1:0] state, next_state; // (current) state, next state
    wire [7:0] Data;
    reg Ld_R0;
    reg Clr_P1_P0;
    reg Ld_P1_P0;
    reg [7:0] P0, P1;
    reg [15:0] R0;
    //
    // Controller Unit
    // transition of the state, with synchronous reset
    always @(posedge clk) begin
        if (rst) 
            state <= S_idle; 
        else 
            state <= next_state;
    end
    // 
    always @(state, Ld, En, rst) begin
        Ld_R0 = 0; 
        Clr_P1_P0 = 0; 
        Ld_P1_P0 = 0;
        case (state)
            // if (state == S_idle) then
            S_idle: if (rst) begin
                        next_state = S_idle; 
                        Clr_P1_P0 = 1;
                    end
                    else if (En) begin
                        next_state = S_1; 
                        Ld_P1_P0 = 1;
                    end
                    else begin
                        Clr_P1_P0 = 1;
                    end
            // if (state == S_1) then
            S_1:    begin
                        next_state = S_full; 
                        Ld_P1_P0 = 1;
                    end
            // if (state == S_full) then
            S_full: if (Ld == 0) begin
                        next_state = S_wait;
                    end
                    // if (Ld != 0) then load the signal
                    else begin
                        Ld_R0 = 1;
                        if (En) begin
                            next_state = S_1;
                            Ld_P1_P0 = 1;
                        end
                        else begin
                            next_state = S_idle; 
                            Clr_P1_P0 = 1;
                        end
                    end
            // if (state == S_wait) then
            S_wait: if (Ld) begin
                        Ld_R0 = 1;
                        if (En) begin
                            next_state = S_1;
                            Ld_P1_P0 = 1;
                        end
                        else begin
                            next_state = S_idle; 
                            Clr_P1_P0 = 1;
                        end
                    end
            default: next_state = 2'bx;
        endcase
    end
    //
    // Datapath
    always @(posedge clk) begin
        if (Clr_P1_P0) begin
            P1 <= 0; 
            P0 <= 0;
        end
        if (Ld_R0) begin
            R0 <= {P1, P0};
        end
        if (Ld_P1_P0) begin
            P1 <= Data; 
            P0 <= P1;
        end
    end
endmodule
