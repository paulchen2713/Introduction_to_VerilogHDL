onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /t_Register_File/k
add wave -noupdate /t_Register_File/Data_Out_1
add wave -noupdate /t_Register_File/Data_Out_2
add wave -noupdate /t_Register_File/Data_in
add wave -noupdate /t_Register_File/Read_Addr_1
add wave -noupdate /t_Register_File/Read_Addr_2
add wave -noupdate /t_Register_File/Write_Addr
add wave -noupdate /t_Register_File/Writr_Enable
add wave -noupdate /t_Register_File/clk
add wave -noupdate /t_Register_File/uut/Data_Out_1
add wave -noupdate /t_Register_File/uut/Data_Out_2
add wave -noupdate /t_Register_File/uut/Data_in
add wave -noupdate /t_Register_File/uut/Read_Addr_1
add wave -noupdate /t_Register_File/uut/Read_Addr_2
add wave -noupdate /t_Register_File/uut/Write_Addr
add wave -noupdate /t_Register_File/uut/Writr_Enable
add wave -noupdate /t_Register_File/uut/clk
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
WaveRestoreZoom {0 ns} {525 ns}
