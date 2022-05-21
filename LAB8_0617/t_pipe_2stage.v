// simple testbench for two-stage pipelined register
`include "pipe_2stage.v";
module t_pipe_2stage;
    wire [15:0] R0;
    reg  [7:0] Data;
    reg En, Ld, clk, rst;
    //
    pipe_2stage uut (.R0(R0), .Data(Data), .En(En), .Ld(Ld), .clk(clk), .rst(rst));
    //
    initial begin 
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end 
    end
    //
    initial begin 
        Data = 8'H55;
        forever @ (negedge clk) begin
            Data = Data + 1;
        end 
    end
    //
    initial
    fork
        #10  rst = 0;
        #20  rst = 1;
        #40  rst = 0;
        #300 rst = 1;
        #350 rst = 0;
        #20  En  = 0;
        #70  En  = 1;
        #80  En  = 0;
        #200 En  = 1;
        #20  Ld  = 0;
        #140 Ld  = 1;
        #150 Ld  = 0;
        #400 Ld  = 1;
    join
    // whole test last for 500 clock cycle
    initial begin
        #500 $finish;
    end
endmodule
