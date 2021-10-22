onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /LED_test_testbench/CLOCK_PERIOD
add wave -noupdate /LED_test_testbench/RST
add wave -noupdate /LED_test_testbench/clk
add wave -noupdate /LED_test_testbench/newPipeOn
add wave -noupdate /LED_test_testbench/movePipeOn
add wave -noupdate /LED_test_testbench/newPipe
add wave -noupdate /LED_test_testbench/RedPixels
add wave -noupdate /LED_test_testbench/GrnPixels
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {361 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ps} {4778 ps}
