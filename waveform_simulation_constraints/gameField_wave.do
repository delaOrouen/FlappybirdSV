onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /gameField_testbench/gameOver
add wave -noupdate /gameField_testbench/gatePassed
add wave -noupdate /gameField_testbench/grnRow
add wave -noupdate /gameField_testbench/redRow
add wave -noupdate /gameField_testbench/gravityOn
add wave -noupdate /gameField_testbench/movePipeOn
add wave -noupdate /gameField_testbench/newPipeOn
add wave -noupdate /gameField_testbench/newPipePiece
add wave -noupdate /gameField_testbench/reset
add wave -noupdate /gameField_testbench/clk
add wave -noupdate /gameField_testbench/player
add wave -noupdate /gameField_testbench/RES
add wave -noupdate /gameField_testbench/BOTTOM
add wave -noupdate /gameField_testbench/TOP
add wave -noupdate /gameField_testbench/birdAbove
add wave -noupdate /gameField_testbench/birdBelow
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
WaveRestoreZoom {14700 ps} {15700 ps}
