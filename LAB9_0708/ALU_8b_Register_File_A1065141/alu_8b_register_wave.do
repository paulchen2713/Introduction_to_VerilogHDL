onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /t_alu_8b_register/alu_out
add wave -noupdate /t_alu_8b_register/Data_in
add wave -noupdate /t_alu_8b_register/Read_Addr_1
add wave -noupdate /t_alu_8b_register/Read_Addr_2
add wave -noupdate /t_alu_8b_register/Write_Addr
add wave -noupdate /t_alu_8b_register/opcode
add wave -noupdate /t_alu_8b_register/osc
add wave -noupdate /t_alu_8b_register/Writr_Enable
add wave -noupdate /t_alu_8b_register/clk
add wave -noupdate /t_alu_8b_register/c_in
add wave -noupdate /t_alu_8b_register/k
add wave -noupdate /t_alu_8b_register/uut/alu_out
add wave -noupdate /t_alu_8b_register/uut/opcode
add wave -noupdate /t_alu_8b_register/uut/Data_in
add wave -noupdate /t_alu_8b_register/uut/Read_Addr_1
add wave -noupdate /t_alu_8b_register/uut/Read_Addr_2
add wave -noupdate /t_alu_8b_register/uut/Write_Addr
add wave -noupdate /t_alu_8b_register/uut/Writr_Enable
add wave -noupdate /t_alu_8b_register/uut/clk
add wave -noupdate /t_alu_8b_register/uut/c_in
add wave -noupdate /t_alu_8b_register/uut/Data_Out_1
add wave -noupdate /t_alu_8b_register/uut/Data_Out_2
add wave -noupdate /t_alu_8b_register/uut/uut_ALU/a
add wave -noupdate /t_alu_8b_register/uut/uut_ALU/b
add wave -noupdate /t_alu_8b_register/uut/uut_ALU/c_in
add wave -noupdate /t_alu_8b_register/uut/uut_ALU/opcode
add wave -noupdate /t_alu_8b_register/uut/uut_ALU/alu_out
add wave -noupdate /t_alu_8b_register/uut/uut_Register_File/Data_Out_1
add wave -noupdate /t_alu_8b_register/uut/uut_Register_File/Data_Out_2
add wave -noupdate /t_alu_8b_register/uut/uut_Register_File/Data_in
add wave -noupdate /t_alu_8b_register/uut/uut_Register_File/Read_Addr_1
add wave -noupdate /t_alu_8b_register/uut/uut_Register_File/Read_Addr_2
add wave -noupdate /t_alu_8b_register/uut/uut_Register_File/Write_Addr
add wave -noupdate /t_alu_8b_register/uut/uut_Register_File/Writr_Enable
add wave -noupdate /t_alu_8b_register/uut/uut_Register_File/clk
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {66 ns}
