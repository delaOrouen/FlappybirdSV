onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /winDisplay_testbench/CLOCK_PERIOD
add wave -noupdate /winDisplay_testbench/clk
add wave -noupdate /winDisplay_testbench/reset
add wave -noupdate /winDisplay_testbench/pin
add wave -noupdate /winDisplay_testbench/farMost
add wave -noupdate /winDisplay_testbench/out
add wave -noupdate /winDisplay_testbench/dut/wins
add wave -noupdate /winDisplay_testbench/dut/ps
add wave -noupdate /winDisplay_testbench/dut/ns
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
WaveRestoreZoom {0 ps} {1628 ps}
