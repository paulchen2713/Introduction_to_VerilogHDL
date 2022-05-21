// simple testbench for 8-bit ALU with Register_File
`include "alu_8b_register.v"
module t_alu_8b_register;

wire [8:0] alu_out;
reg [7:0] Data_in;
reg [2:0] Read_Addr_1, Read_Addr_2, Write_Addr;
reg [2:0] opcode;
reg [79:0] osc;
reg Writr_Enable, clk, c_in;
integer k;

parameter [2:0] add = 0;
parameter [2:0] subtract = 1;
parameter [2:0] subtract_a = 2;
parameter [2:0] or_ab  = 3;
parameter [2:0] and_ab = 4;
parameter [2:0] not_ab = 5;
parameter [2:0] exor   = 6;
parameter [2:0] exnor  = 7;

// OCS string, 10 letters == 10 * 8-bit == 80-bit
parameter [79:0] ocs_0 = "add";
parameter [79:0] ocs_1 = "subtract";
parameter [79:0] ocs_2 = "subtract_a"; 
parameter [79:0] ocs_3 = "or_ab";
parameter [79:0] ocs_4 = "and_ab";
parameter [79:0] ocs_5 = "not_ab";
parameter [79:0] ocs_6 = "exor";
parameter [79:0] ocs_7 = "exnor";

alu_8b_register uut(alu_out, opcode, Data_in, Read_Addr_1, Read_Addr_2, Write_Addr, Writr_Enable, clk, c_in);

// initial clk = 0;
// always #5 clk = ~clk;
initial begin
    clk = 0;
    forever begin
        #5 clk = ~clk;
    end
end

initial begin
    #1 Data_in = 8'b1000_0000;
    opcode = add;
    c_in = 0;
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

always @(opcode) begin
    // according to current OPCODE to change OCS string
    case (opcode)
        add:        osc = ocs_0;
        subtract:   osc = ocs_1;
        subtract_a: osc = ocs_2;
        or_ab:      osc = ocs_3;
        and_ab:     osc = ocs_4;
        not_ab:     osc = ocs_5;
        exor:       osc = ocs_6;
        exnor:      osc = ocs_7; 
        // default: 
    endcase
end

initial begin
    #500 $finish;
end
endmodule