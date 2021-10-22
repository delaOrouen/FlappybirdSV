onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /DE1_SoC_testbench/KEY
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/gameOver
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/gatePassed
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/grnRow
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/redRow
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/gravityOn
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/movePipeOn
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/newPipeOn
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/newPipePiece
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/reset
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/clk
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/player
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/RES
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/BOTTOM
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/TOP
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/birdAbove
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/birdBelow
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/birdSightedAbove
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/birdSightedBelow
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/ps
add wave -noupdate -group row5 /DE1_SoC_testbench/dut/row05/ns
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/gameOver
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/gatePassed
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/grnRow
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/redRow
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/gravityOn
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/movePipeOn
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/newPipeOn
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/newPipePiece
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/reset
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/clk
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/player
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/RES
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/BOTTOM
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/TOP
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/birdAbove
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/birdBelow
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/birdSightedAbove
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/birdSightedBelow
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/ps
add wave -noupdate -group row6 /DE1_SoC_testbench/dut/row06/ns
add wave -noupdate /DE1_SoC_testbench/dut/pipeMaker/newPipe
add wave -noupdate /DE1_SoC_testbench/dut/RedPixels
add wave -noupdate /DE1_SoC_testbench/dut/GrnPixels
add wave -noupdate -expand -group Driver /DE1_SoC_testbench/dut/Driver/GPIO_1
add wave -noupdate -expand -group Driver /DE1_SoC_testbench/dut/Driver/RedPixels
add wave -noupdate -expand -group Driver /DE1_SoC_testbench/dut/Driver/GrnPixels
add wave -noupdate -expand -group Driver /DE1_SoC_testbench/dut/Driver/EnableCount
add wave -noupdate -expand -group Driver /DE1_SoC_testbench/dut/Driver/CLK
add wave -noupdate -expand -group Driver /DE1_SoC_testbench/dut/Driver/RST
add wave -noupdate -expand -group Driver /DE1_SoC_testbench/dut/Driver/Counter
add wave -noupdate -expand -group Driver /DE1_SoC_testbench/dut/Driver/RowSelect
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25452 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 125
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2579 ps}
