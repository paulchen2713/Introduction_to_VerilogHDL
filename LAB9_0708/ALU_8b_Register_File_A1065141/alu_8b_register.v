// combine 8-bit ALU and Register_File
`include "alu_8b.v"
`include "Register_File.v"
module alu_8b_register(
    output [8:0] alu_out, // alu
    input [2:0] opcode, // alu
    input [7:0] Data_in, // reg
    input [2:0] Read_Addr_1, Read_Addr_2, Write_Addr, // reg
    input Writr_Enable, clk, // reg
    input c_in // alu
);

wire [7:0] Data_Out_1, Data_Out_2; 

alu_8b uut_ALU(Data_Out_1, Data_Out_2, c_in, opcode, alu_out);

Register_File uut_Register_File(Data_Out_1, Data_Out_2, Data_in, Read_Addr_1, Read_Addr_2, Write_Addr, Writr_Enable, clk);

endmodule
