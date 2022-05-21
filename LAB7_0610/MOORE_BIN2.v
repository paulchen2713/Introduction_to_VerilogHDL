// simple Odd-Parity Checker circuit
// implemented in Moore Machine, and encoded in Binary-code
module MOORE_BIN2(CLK, Din, RST, Qout);
    input CLK, RST, Din;
    output Qout;

    reg Qout;

    // state coding
    // declare the value for every states
    parameter S0 = 1'b0;
    parameter S1 = 1'b1;
    // declare Current State and Next State
    reg CS;
    reg NS;

    always @(posedge CLK or posedge RST) begin
        if (RST == 1'b1)
            CS = S0; // initial state
        else
            CS = NS;
    end

    always @(CS or Din) begin
        case (CS)
            S0: begin
                Qout = 1'b0;
                NS = Din ? S1 : S0;
                // if (Din == 1'b0)
                //     NS = S0;
                // else
                //     NS = S1;
            end
            S1: begin
                Qout = 1'b1;
                NS = Din ? S0 : S1;
                // if (Din == 1'b0)
                //     NS = S1;
                // else
                //     NS = S0;
            end
        endcase
    end
endmodule
