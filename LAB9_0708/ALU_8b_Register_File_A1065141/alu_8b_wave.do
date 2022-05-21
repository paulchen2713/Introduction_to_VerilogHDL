onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /t_alu_8b/a
add wave -noupdate /t_alu_8b/b
add wave -noupdate /t_alu_8b/c_in
add wave -noupdate /t_alu_8b/osc
add wave -noupdate /t_alu_8b/opcode
add wave -noupdate /t_alu_8b/j
add wave -noupdate /t_alu_8b/k
add wave -noupdate /t_alu_8b/alu_out
add wave -noupdate /t_alu_8b/uut/a
add wave -noupdate /t_alu_8b/uut/b
add wave -noupdate /t_alu_8b/uut/c_in
add wave -noupdate /t_alu_8b/uut/opcode
add wave -noupdate /t_alu_8b/uut/alu_out
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
WaveRestoreZoom {0 ns} {1177 ns}
