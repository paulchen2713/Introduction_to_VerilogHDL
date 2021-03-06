// simple Sequence(101) Detector circuit
// implemented in Mealy Machine, and encoded in Grey-code
module MEALY_GRY1(CLK, Din, RST, Qout);
    input CLK, RST, Din;
    output Qout;

    reg Qout;

    // state coding
    // declare the value for all states
    parameter [1:0] S0 = 2'b00; // 0,  empty state
    parameter [1:0] S1 = 2'b01; // 1,  1...1 consecutive 1s
    parameter [1:0] S2 = 2'b11; // 10, 1...10
    // delcare Current State and Next State
    reg [1:0] CS;
    reg [1:0] NS;

    always @(posedge CLK or posedge RST) begin
        if (RST == 1'b1)
            CS = S0; // initial state
        else
            CS = NS;
    end
    
    always @(CS or Din) begin
        case (CS)
            S0: begin
                if (Din == 1'b0) begin
                    NS = S0;
                    Qout = 1'b0;
                end
                else begin
                    NS = S1;
                    Qout = 1'b0;
                end
            end
            S1: begin
                if (Din == 1'b0) begin
                    NS = S2;
                    Qout = 1'b0;
                end
                else begin
                    NS = S1;
                    Qout = 1'b0;
                end
            end
            S2: begin
                if (Din == 1'b0) begin
                    NS = S0;
                    Qout = 1'b0;
                end
                else begin
                    NS = S1;
                    Qout = 1'b1;
                end
            end     
        endcase
    end
endmodule
