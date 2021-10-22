onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /battlefield_testbench/CLOCK_PERIOD
add wave -noupdate /battlefield_testbench/clk
add wave -noupdate /battlefield_testbench/leftLight
add wave -noupdate /battlefield_testbench/rightLight
add wave -noupdate /battlefield_testbench/p2in
add wave -noupdate /battlefield_testbench/p1in
add wave -noupdate /battlefield_testbench/out
add wave -noupdate /battlefield_testbench/reset
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
WaveRestoreZoom {0 ps} {2573 ps}
