// simple testbench for MEALY_GRY1.v
`include "MEALY_GRY1.v";
module t_MEALY_GRY1;
    // inputs
    reg CLK, RST, Din;
    // output
    wire Qout;

    MEALY_GRY1 uut(.CLK(CLK), .RST(RST), .Din(Din), .Qout(Qout));

    initial begin
        $monitor($time, "CLK = %b, RST = %b, Din = %b, Qout = %b", CLK, RST, Din, Qout);
    end

    initial begin
        #0 begin
            RST = 1'b1;
            Din = 0;
        end
        #15 RST = 1'b0;
        #5  Din = 1;
        #20 Din = 0;
        #20 Din = 1;
        #20 Din = 0;
        #20 Din = 1;
        #20 Din = 0;
        #20 Din = 1;
        #20 Din = 0;
        #45 Din = 1;
        #20 Din = 0;
        #20 Din = 1;
        #20 Din = 0;
        #20 Din = 1;
    end

    // set up the clock to toggle every 10 clock cycle(time units), 
    // total cycle last 20 clock cycle(duty cycle 50%)
    initial begin
        CLK = 1'b0;
    end
    always begin
        #10 CLK = ~CLK;
    end

    initial begin
        #290 $finish;
    end
endmodule
