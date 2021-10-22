onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /highScore_testbench/dut/HEXout0
add wave -noupdate /highScore_testbench/dut/HEXout1
add wave -noupdate /highScore_testbench/dut/HEXout2
add wave -noupdate /highScore_testbench/dut/HEXin0
add wave -noupdate /highScore_testbench/dut/HEXin1
add wave -noupdate /highScore_testbench/dut/HEXin2
add wave -noupdate /highScore_testbench/dut/reset
add wave -noupdate /highScore_testbench/dut/in
add wave -noupdate /highScore_testbench/dut/clk
add wave -noupdate /highScore_testbench/dut/gameOver
add wave -noupdate /highScore_testbench/dut/currentScore
add wave -noupdate /highScore_testbench/dut/highScore
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 100
configure wave -griddelta 20
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
