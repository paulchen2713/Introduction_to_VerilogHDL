// simple testbench for MOORE_BIN2.v
`include "MOORE_BIN2.v";
module t_MOORE_BIN2;
    // inputs
    reg CLK, RST, Din;
    // output
    wire Qout;

    MOORE_BIN2 uut(.CLK(CLK), .RST(RST), .Din(Din), .Qout(Qout));

    initial begin
        $monitor($time, "CLK = %b, RST = %b, Din = %b, Qout = %b", CLK, RST, Din, Qout);
    end

    initial begin
        RST = 1'b1;
        #20 RST = 1'b0;
        #5  Din = 0;
        #20 Din = 1;
        #60 Din = 0;
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

    // finish the simulation at time 150
    initial begin
        #150 $finish;
    end

endmodule
