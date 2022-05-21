// simple Register_File system
module Register_File(
    output[7:0] Data_Out_1, Data_Out_2, // 8-bit 
    input[7:0] Data_in, // 8-bit
    input[2:0] Read_Addr_1, Read_Addr_2, Write_Addr, // Addr: address
    input Writr_Enable, clk // 1-bit
);
reg [7:0] Reg_File [31:0]; // 32 8-bit-reg

assign Data_Out_1 = Reg_File[Read_Addr_1]; 
assign Data_Out_2 = Reg_File[Read_Addr_2]; 
always@(posedge clk) begin
    if(Writr_Enable)
        Reg_File[Write_Addr] <= Data_in;
end
endmodule
