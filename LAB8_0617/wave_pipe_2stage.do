onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /t_pipe_2stage/R0
add wave -noupdate -radix hexadecimal -radixshowbase 0 /t_pipe_2stage/Data
add wave -noupdate /t_pipe_2stage/En
add wave -noupdate /t_pipe_2stage/Ld
add wave -noupdate /t_pipe_2stage/clk
add wave -noupdate /t_pipe_2stage/rst
add wave -noupdate /t_pipe_2stage/uut/R0
add wave -noupdate /t_pipe_2stage/uut/clk
add wave -noupdate /t_pipe_2stage/uut/rst
add wave -noupdate /t_pipe_2stage/uut/En
add wave -noupdate /t_pipe_2stage/uut/Ld
add wave -noupdate -radix hexadecimal -radixshowbase 0 /t_pipe_2stage/uut/Data
add wave -noupdate /t_pipe_2stage/uut/Clr_P1_P0
add wave -noupdate /t_pipe_2stage/uut/Ld_P1_P0
add wave -noupdate /t_pipe_2stage/uut/Ld_R0
add wave -noupdate -radix hexadecimal -radixshowbase 0 /t_pipe_2stage/uut/P0
add wave -noupdate -radix hexadecimal -radixshowbase 0 /t_pipe_2stage/uut/P1
add wave -noupdate -radix unsigned -radixshowbase 0 /t_pipe_2stage/uut/state
add wave -noupdate -radix unsigned -radixshowbase 0 /t_pipe_2stage/uut/next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 205
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
WaveRestoreZoom {0 ns} {264 ns}
