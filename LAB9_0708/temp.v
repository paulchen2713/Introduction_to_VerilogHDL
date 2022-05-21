// simple 8-bit ALU + register file
module alu_8b(
    input [7:0] a, b, // 8-bit
    input c_in, 
    reg [2:0] opcode, // 3-bit
    output reg [8:0] alu_out // 8-bit 運算完可能變 9-bit
);
// 參數化 狀態編碼轉成能讀的文字
parameter [2:0] add = 0;
parameter [2:0] subtract = 1;
parameter [2:0] subtract_a = 2;
parameter [2:0] or_ab = 3;
parameter [2:0] and_ab = 4;
parameter [2:0] not_ab = 5;
parameter [2:0] exor = 6;
parameter [2:0] exnor = 7;

always @(a, b, c_in, opcode) begin
    case (opcode)
        add:        alu_out = a + b + c_in;
        subtract:   alu_out = a + ~b + c_in;
        subtract_a: alu_out = b + ~a + ~c_in;
        or_ab:      alu_out = {1'b0, a | b};
        and_ab:     alu_out = {1'b0, a & b};
        not_ab:     alu_out = {1'b0, (~a) & b};
        exor:       alu_out = {1'b0, a ^ b};
        exnor:      alu_out = {1'b0, a ~^ b}; 
        // default: 
    endcase
end

// always@(a, b, c_in, opcode)
// case(opcode)
    // add:        alu_out = a + b + c_in;
    // subtract:   alu_out = a + ~b + c_in;
    // subtract_a: alu_out = b + ~a + ~c_in;
    // or_ab:      alu_out = {1'b0, a | b};
    // and_ab:     alu_out = {1'b0, a & b};
    // not_ab:     alu_out = {1'b0, (~a) & b};
    // exor:       alu_out = {1'b0, a ^ b};
    // exnor:      alu_out = {1'b0, a ~^ b};
// endcase
endmodule

// simple testbench for 8-bit ALU
`include "alu_8b.v"
module t_alu_8b;

reg[7:0] a, b;
reg c_in;
reg[79:0] osc;
reg[2:0] opcode;
integer j, k;
wire[8:0] alu_out;

parameter [2:0] add = 0;
parameter [2:0] subtract = 1;
parameter [2:0] subtract_a = 2;
parameter [2:0] or_ab = 3;
parameter [2:0] and_ab = 4;
parameter [2:0] not_ab = 5;
parameter [2:0] exor = 6;
parameter [2:0] exnor = 7;

// ocs can stores at most 10 letters, each letters takes 8-bit(1-byte) 
parameter [79:0] ocs_0 = "add";
parameter [79:0] ocs_1 = "subtract";
parameter [79:0] ocs_2 = "subtract_a"; // 10 char = 10 * 8-bit = 80-bit
parameter [79:0] ocs_3 = "or_ab";
parameter [79:0] ocs_4 = "and_ab";
parameter [79:0] ocs_5 = "not_ab";
parameter [79:0] ocs_6 = "exor";
parameter [79:0] ocs_7 = "exnor";

alu_8b M0(a, b, c_in, opcode, alu_out);

initial begin
    #10 a = 8'h55; // 0101_0101
    b = 8'haa;     // 1010_1010
    // c_in 0 or 1 
    for(j = 0; j <= 1 ; j = j + 1) begin
        // state 0~7 
        for(k = 0; k <= 7 ; k = k + 1) begin
            #10 c_in = j;
            case(k)
                0: opcode = add;
                1: opcode = subtract;
                2: opcode = subtract_a;
                3: opcode = or_ab;
                4: opcode = and_ab;
                5: opcode = not_ab;
                6: opcode = exor;
                7: opcode = exnor;
                // default:
            endcase    
        end
    end
end

always @(opcode) begin
    // according to current OPCODE to change OCS string
    case (opcode)
        add: osc = ocs_0;
        subtract: osc = ocs_1;
        subtract_a: osc = ocs_2;
        or_ab: osc = ocs_3;
        and_ab: osc = ocs_4;
        not_ab: osc = ocs_5;
        exor: osc = ocs_6;
        exnor: osc = ocs_7; 
        // default: 
    endcase
end

// always@(opcode) 
// case(opcode)
//     add:        osc = ocs_0;
//     subtract:   osc = ocs_1;
//     subtract_a: osc = ocs_2;
//     or_ab:      osc = ocs_3;
//     and_ab:     osc = ocs_4;
//     not_ab:     osc = ocs_5;
//     exor:       osc = ocs_6;
//     exnor:      osc = ocs_7;
// endcase

initial #1000 $finish;
endmodule


module Register_File(
    output[7:0] Data_Out_1, Data_Out_2, // 8-bit 
    input[7:0] Data_in, // 8-bit
    input[2:0] Read_Addr_1, Read_Addr_2, Write_Addr, // Addr: address的縮寫
    input Writr_Enable, clk // 1-bit
);
reg [7:0] Reg_File [31:0]; // 32 個 8-bit reg

assign Data_Out_1 = Reg_File[Read_Addr_1]; // 將 Reg_File 裡的第 Read_Addr_1 個位置裡的資料 丟給 Data_Out_1
assign Data_Out_2 = Reg_File[Read_Addr_2]; // 將 Reg_File 裡的第 Read_Addr_2 個位置裡的資料 丟給 Data_Out_2

always@(posedge clk)
begin
    if(Writr_Enable)
        Reg_File[Write_Addr] <= Data_in; // 將 Data_in 丟進 Reg_File 裡的第 Write_Addr 個位置裡
end
endmodule


`include "Register_File.v"
module t_Register_File()
integer k;
wire [7:0] Data_Out_1, Data_Out_2;
reg [7:0] Data_in;
reg [3:0] Read_Addr_1, Read_Addr_2, Write_Addr;
reg Writr_Enable, clk;

Register_File M0(Data_Out_1, Data_Out_2, Data_in, Read_Addr_1, Read_Addr_2, Write_Addr, Writr_Enable, clk);

initial clk = 0;
always #5 clk = ~clk;

initial
begin
    Data_in = 8'b1000_0000;
    Writr_Enable = 1;
    Write_Addr = 0;
    Read_Addr_1 = 0;
    Read_Addr_2 = 0;
    for(k = 0;k <= 31; k = k + 1)
    begin
        @(negedge clk) // 負緣觸發
        if(Data_in == 8'b1000_0000)
            Data_in = 8'b0000_0001; // 1從最左邊放到最右邊 
        else
            Data_in <= Data_in << 1; // 向左shift 1格 跟上面if一起 可以保證 8個bit中只有1個1
            Write_Addr <= Write_Addr + 1;
            Read_Addr_1 <= Read_Addr_1 + 1;
            Read_Addr_2 <= Read_Addr_2 + 1;
    end
end

initial #500 $finish;

endmodule


`include "alu_8b.v"
`include "Register_File.v"
module alu_8b_register(
    output [8:0] alu_out, // alu
    input [2:0] opcode, // alu
    input[7:0] Data_in, // reg
    input[2:0] Read_Addr_1, Read_Addr_2, Write_Addr, // reg
    input Writr_Enable, clk, // reg
    input c_in // alu
);

wire [7:0] Data_Out_1, Data_Out_2; // reg 跟 alu 接在一起的線 alu裡的a b pin 可以刪掉
alu_8b M0_ALU (Data_Out_1, Data_Out_2, c_in, opcode, alu_out);
Register_File M1_Register_File (Data_Out_1, Data_Out_2, Data_in, Read_Addr_1, Read_Addr_2, Write_Addr, Writr_Enable, clk);

endmodule


`include "alu_8b_register.v"
module t_alu_8b_register();

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
parameter [2:0] or_ab = 3;
parameter [2:0] and_ab = 4;
parameter [2:0] not_ab = 5;
parameter [2:0] exor = 6;
parameter [2:0] exnor = 7;

parameter [79:0] ocs_0 = "add"; // ocs_0 存字串
parameter [79:0] ocs_1 = "subtract";
parameter [79:0] ocs_2 = "subtract_a"; // 有10個字 = 10 * 8 = 80 bit 所以 ocs 要 80 bit
parameter [79:0] ocs_3 = "or_ab";
parameter [79:0] ocs_4 = "and_ab";
parameter [79:0] ocs_5 = "not_ab";
parameter [79:0] ocs_6 = "exor";
parameter [79:0] ocs_7 = "exnor";

alu_8b_register M0 (alu_out, opcode, Data_in, Read_Addr_1, Read_Addr_2, Write_Addr, Writr_Enable, clk, c_in);

initial clk = 0;
always #5 clk = ~clk;

initial
begin
    #1 Data_in = 8'b1000_0000;
    opcode = add;
    c_in = 0;
    Writr_Enable = 1;
    Write_Addr = 0;
    Read_Addr_1 = 0;
    Read_Addr_2 = 0;
    for(k = 0;k <= 31; k = k + 1)
    begin
        @(negedge clk) // negative edge trigger
        if(Data_in == 8'b1000_0000)
            Data_in = 8'b0000_0001; // 1從最左邊放到最右邊 
        else
            Data_in <= Data_in << 1; // 向左shift 1格 跟上面if一起 可以保證 8個bit中只有1個1
            Write_Addr <= Write_Addr + 1;
            Read_Addr_1 <= Read_Addr_1 + 1;
            Read_Addr_2 <= Read_Addr_2 + 1;
    end
end

always @(opcode) begin
    // according to current OPCODE to change OCS string
    case (opcode)
        add: osc = ocs_0;
        subtract: osc = ocs_1;
        subtract_a: osc = ocs_2;
        or_ab: osc = ocs_3;
        and_ab: osc = ocs_4;
        not_ab: osc = ocs_5;
        exor: osc = ocs_6;
        exnor: osc = ocs_7; 
        default: 
    endcase
end

// always@(opcode) 
// case(opcode)
//     add:        osc = ocs_0;
//     subtract:   osc = ocs_1;
//     subtract_a: osc = ocs_2;
//     or_ab:      osc = ocs_3;
//     and_ab:     osc = ocs_4;
//     not_ab:     osc = ocs_5;
//     exor:       osc = ocs_6;
//     exnor:      osc = ocs_7;
// endcase

initial #500 $finish;

endmodule
