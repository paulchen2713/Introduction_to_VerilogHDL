// simple testbench for pipe_v3
`include "pipe_v3.v";
module t_pipe_v3;
    reg clk, rst;
    reg [3:0] a, b, c;
    wire [8:0] y;
    integer k;

    pipe_v3 uut (.clk(clk), .rst(rst), .y(y), .a(a), .b(b), .c(c));

    initial begin
        rst <= 0;   // rst <= 0;     <--- time = 0
        #5 rst = 1; // rst <= #5  1; <--- time = 5
        #26;        // rst <= #31 0; <--- time = 31
        rst = 0;    // clk <= 0;     <--- time = 0
        clk <= 0;
    end

    always begin
        #10 clk = ~clk;
    end

    initial begin
        {a, b, c} = 0;
        for (k = 0; k < 4096; k = k + 1) begin
            {a, b, c} = k;
            #20;
        end
    end

    initial begin
        #40960 $finish;
    end

endmodule
