// simple testbench for Registe_File.v
`include "Register_File.v"
module t_Register_File;
integer k;
wire [7:0] Data_Out_1, Data_Out_2;
reg [7:0] Data_in;
reg [3:0] Read_Addr_1, Read_Addr_2, Write_Addr;
reg Writr_Enable, clk;

Register_File uut(Data_Out_1, Data_Out_2, Data_in, Read_Addr_1, Read_Addr_2, Write_Addr, Writr_Enable, clk);

// initial clk = 0;
// always #5 clk = ~clk;
initial begin
    clk = 0;
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    Data_in = 8'b1000_0000;
    Writr_Enable = 1;
    Write_Addr = 0;
    Read_Addr_1 = 0;
    Read_Addr_2 = 0;
    for(k = 0;k <= 31; k = k + 1) begin
        @(negedge clk)
        if(Data_in == 8'b1000_0000)
            Data_in = 8'b0000_0001;
        else
            Data_in <= Data_in << 1; 
            Write_Addr <= Write_Addr + 1;
            Read_Addr_1 <= Read_Addr_1 + 1;
            Read_Addr_2 <= Read_Addr_2 + 1;
    end
end

initial begin
    #500 $finish;
end
endmodule
