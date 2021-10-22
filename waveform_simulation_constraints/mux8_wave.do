onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group input /mux8_1_testbench/i000
add wave -noupdate -expand -group input /mux8_1_testbench/i001
add wave -noupdate -expand -group input /mux8_1_testbench/i010
add wave -noupdate -expand -group input /mux8_1_testbench/i011
add wave -noupdate -expand -group input /mux8_1_testbench/i100
add wave -noupdate -expand -group input /mux8_1_testbench/i101
add wave -noupdate -expand -group input /mux8_1_testbench/i110
add wave -noupdate -expand -group input /mux8_1_testbench/i111
add wave -noupdate -expand -group sel /mux8_1_testbench/dut/sel0
add wave -noupdate -expand -group sel /mux8_1_testbench/dut/sel1
add wave -noupdate -expand -group sel /mux8_1_testbench/dut/sel2
add wave -noupdate /mux8_1_testbench/out
add wave -noupdate /mux8_1_testbench/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9337 ps} 0}
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
WaveRestoreZoom {9290 ps} {10290 ps}
