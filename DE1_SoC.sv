// Top-level module that defines the I/Os for the DE-1 SoC board
module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, SW, LEDR, GPIO_1, CLOCK_50);
    output logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	 output logic [9:0]  LEDR;
    input  logic [3:0]  KEY;
    input  logic [9:0]  SW;
    output logic [35:0] GPIO_1;
    input logic CLOCK_50;
	 
	 logic [31:0] clk;
	 logic SYSTEM_CLOCK, gravityOn, movePipeOn, newPipeOn, pause, reset, player, onesOut, tensOut, gateCountUp, resetHighScore, game, pipeSpeedStart;
	 logic [9:0] lfsr1, currentScore; 
	 logic [15:0] newPipe, gatePassed, gameOver;
	 logic [15:0][15:0] RedPixels, GrnPixels; // 16 x 16 array representing red LEDs
	 
	 // assign buttons and switches 
	 assign reset = ~KEY[3] | game;
	 assign pause = SW[0];
	 
	 // note: when using the test-bench, comment-out the clock divider
	 //clock_divider divider (.clock(CLOCK_50), .reset, .divided_clocks(clk));
	 
	 // generate the clocks for all components
	 // note: when using the testbench, change the assigned value to CLOCK_50
	 assign SYSTEM_CLOCK = CLOCK_50; //clk[13]; // 1526 Hz clock signal to be use everywhere
	 gravitySpeed gravity 		(.clk(SYSTEM_CLOCK), .reset, .pause, .activate(gravityOn));
	 pipeSpeed pipeSpeed1 		(.clk(SYSTEM_CLOCK), .reset, .pause, .activate(pipeSpeedStart));
	 pipeMakeSpeed makePipe1 	(.clk(SYSTEM_CLOCK), .reset, .pause, .activate(newPipeOn));
	 
	 // generate new pipes
	 lfsr rng (.clk(SYSTEM_CLOCK), .reset, .out(lfsr1));
	 pipeGenerator pipeMaker (.reset, .clk(SYSTEM_CLOCK), .activateMake(newPipeOn), .lfsr1, .newPipe);
	 
	 // send the player's key press into two DFFs and prevent one press from counting twice
	 buffer player1 (.clk(SYSTEM_CLOCK), .reset, .in(~KEY[0]), .out(player));
	 
	 // setup the rows of the playfield	
	 gameField row00 (.clk(SYSTEM_CLOCK), .RES(1'b0), .BOTTOM(1'b0), .TOP(1'b1), .reset, .gravityOn, .movePipeOn, .newPipeOn, .newPipePiece(newPipe[00]), .birdAbove(RedPixels[15]), .birdBelow(RedPixels[01]), .player, .gameOver(gameOver[00]), .gatePassed(gatePassed[00]), .grnRow(GrnPixels[00]), .redRow(RedPixels[00]));
	 gameField row01 (.clk(SYSTEM_CLOCK), .RES(1'b0), .BOTTOM(1'b0), .TOP(1'b0), .reset, .gravityOn, .movePipeOn, .newPipeOn, .newPipePiece(newPipe[01]), .birdAbove(RedPixels[00]), .birdBelow(RedPixels[02]), .player, .gameOver(gameOver[01]), .gatePassed(gatePassed[01]), .grnRow(GrnPixels[01]), .redRow(RedPixels[01]));
	 gameField row02 (.clk(SYSTEM_CLOCK), .RES(1'b0), .BOTTOM(1'b0), .TOP(1'b0), .reset, .gravityOn, .movePipeOn, .newPipeOn, .newPipePiece(newPipe[02]), .birdAbove(RedPixels[01]), .birdBelow(RedPixels[03]), .player, .gameOver(gameOver[02]), .gatePassed(gatePassed[02]), .grnRow(GrnPixels[02]), .redRow(RedPixels[02]));
	 gameField row03 (.clk(SYSTEM_CLOCK), .RES(1'b0), .BOTTOM(1'b0), .TOP(1'b0), .reset, .gravityOn, .movePipeOn, .newPipeOn, .newPipePiece(newPipe[03]), .birdAbove(RedPixels[02]), .birdBelow(RedPixels[04]), .player, .gameOver(gameOver[03]), .gatePassed(gatePassed[03]), .grnRow(GrnPixels[03]), .redRow(RedPixels[03]));
	 gameField row04 (.clk(SYSTEM_CLOCK), .RES(1'b0), .BOTTOM(1'b0), .TOP(1'b0), .reset, .gravityOn, .movePipeOn, .newPipeOn, .newPipePiece(newPipe[04]), .birdAbove(RedPixels[03]), .birdBelow(RedPixels[05]), .player, .gameOver(gameOver[04]), .gatePassed(gatePassed[04]), .grnRow(GrnPixels[04]), .redRow(RedPixels[04]));
	 gameField row05 (.clk(SYSTEM_CLOCK), .RES(1'b1), .BOTTOM(1'b0), .TOP(1'b0), .reset, .gravityOn, .movePipeOn, .newPipeOn, .newPipePiece(newPipe[06]), .birdAbove(RedPixels[04]), .birdBelow(RedPixels[06]), .player, .gameOver(gameOver[05]), .gatePassed(gatePassed[05]), .grnRow(GrnPixels[05]), .redRow(RedPixels[05]));
	 gameField row06 (.clk(SYSTEM_CLOCK), .RES(1'b0), .BOTTOM(1'b0), .TOP(1'b0), .reset, .gravityOn, .movePipeOn, .newPipeOn, .newPipePiece(newPipe[06]), .birdAbove(RedPixels[05]), .birdBelow(RedPixels[07]), .player, .gameOver(gameOver[06]), .gatePassed(gatePassed[06]), .grnRow(GrnPixels[06]), .redRow(RedPixels[06]));
	 gameField row07 (.clk(SYSTEM_CLOCK), .RES(1'b0), .BOTTOM(1'b0), .TOP(1'b0), .reset, .gravityOn, .movePipeOn, .newPipeOn, .newPipePiece(newPipe[07]), .birdAbove(RedPixels[06]), .birdBelow(RedPixels[08]), .player, .gameOver(gameOver[07]), .gatePassed(gatePassed[07]), .grnRow(GrnPixels[07]), .redRow(RedPixels[07]));
	 gameField row08 (.clk(SYSTEM_CLOCK), .RES(1'b0), .BOTTOM(1'b0), .TOP(1'b0), .reset, .gravityOn, .movePipeOn, .newPipeOn, .newPipePiece(newPipe[08]), .birdAbove(RedPixels[07]), .birdBelow(RedPixels[09]), .player, .gameOver(gameOver[08]), .gatePassed(gatePassed[08]), .grnRow(GrnPixels[08]), .redRow(RedPixels[08]));
	 gameField row09 (.clk(SYSTEM_CLOCK), .RES(1'b0), .BOTTOM(1'b0), .TOP(1'b0), .reset, .gravityOn, .movePipeOn, .newPipeOn, .newPipePiece(newPipe[09]), .birdAbove(RedPixels[08]), .birdBelow(RedPixels[10]), .player, .gameOver(gameOver[09]), .gatePassed(gatePassed[09]), .grnRow(GrnPixels[09]), .redRow(RedPixels[09]));
	 gameField row10 (.clk(SYSTEM_CLOCK), .RES(1'b0), .BOTTOM(1'b0), .TOP(1'b0), .reset, .gravityOn, .movePipeOn, .newPipeOn, .newPipePiece(newPipe[10]), .birdAbove(RedPixels[09]), .birdBelow(RedPixels[11]), .player, .gameOver(gameOver[10]), .gatePassed(gatePassed[10]), .grnRow(GrnPixels[10]), .redRow(RedPixels[10]));
	 gameField row11 (.clk(SYSTEM_CLOCK), .RES(1'b0), .BOTTOM(1'b0), .TOP(1'b0), .reset, .gravityOn, .movePipeOn, .newPipeOn, .newPipePiece(newPipe[11]), .birdAbove(RedPixels[10]), .birdBelow(RedPixels[12]), .player, .gameOver(gameOver[11]), .gatePassed(gatePassed[11]), .grnRow(GrnPixels[11]), .redRow(RedPixels[11]));
	 gameField row12 (.clk(SYSTEM_CLOCK), .RES(1'b0), .BOTTOM(1'b0), .TOP(1'b0), .reset, .gravityOn, .movePipeOn, .newPipeOn, .newPipePiece(newPipe[12]), .birdAbove(RedPixels[11]), .birdBelow(RedPixels[13]), .player, .gameOver(gameOver[12]), .gatePassed(gatePassed[12]), .grnRow(GrnPixels[12]), .redRow(RedPixels[12]));
	 gameField row13 (.clk(SYSTEM_CLOCK), .RES(1'b0), .BOTTOM(1'b0), .TOP(1'b0), .reset, .gravityOn, .movePipeOn, .newPipeOn, .newPipePiece(newPipe[13]), .birdAbove(RedPixels[12]), .birdBelow(RedPixels[14]), .player, .gameOver(gameOver[13]), .gatePassed(gatePassed[13]), .grnRow(GrnPixels[13]), .redRow(RedPixels[13]));
	 gameField row14 (.clk(SYSTEM_CLOCK), .RES(1'b0), .BOTTOM(1'b0), .TOP(1'b0), .reset, .gravityOn, .movePipeOn, .newPipeOn, .newPipePiece(newPipe[14]), .birdAbove(RedPixels[13]), .birdBelow(RedPixels[15]), .player, .gameOver(gameOver[14]), .gatePassed(gatePassed[14]), .grnRow(GrnPixels[14]), .redRow(RedPixels[14]));
	 gameField row15 (.clk(SYSTEM_CLOCK), .RES(1'b0), .BOTTOM(1'b1), .TOP(1'b0), .reset, .gravityOn, .movePipeOn, .newPipeOn, .newPipePiece(newPipe[15]), .birdAbove(RedPixels[14]), .birdBelow(RedPixels[00]), .player, .gameOver(gameOver[15]), .gatePassed(gatePassed[15]), .grnRow(GrnPixels[15]), .redRow(RedPixels[15]));
	 
	 // setup the scorecard of the current game
	 pinputs gateCounting (.clk(SYSTEM_CLOCK), .reset, .w(gatePassed > 16'b0000000000000000), .out(gateCountUp)); // prevents "counting" dishonesty
	 counter_09 ones (.in(gateCountUp & ~game), .clk(SYSTEM_CLOCK), .reset, .HEX(HEX0), .out(onesOut), .count());
	 counter_09 tens (.in(onesOut), .clk(SYSTEM_CLOCK), .reset, .HEX(HEX1), .out(tensOut), .count());
	 counter_09 huns (.in(tensOut), .clk(SYSTEM_CLOCK), .reset, .HEX(HEX2), .out(), .count());
	 
	 // track the highscore
	 highScore highScore1 (.currentScore, .HEXout0(HEX3), .HEXout1(HEX4), .HEXout2(HEX5), .HEXin0(HEX0), .HEXin1(HEX1), .HEXin2(HEX2), .reset(~KEY[3]), .resetScore(SW[8]), .in(gateCountUp), .clk(SYSTEM_CLOCK), .gameOver(game));
	 
	 // enable "god-mode" aka invincible mode
	 mux2_1 godMode (.out(game), .i0(gameOver> 16'b0000000000000000), .i1(1'b0), .sel(SW[2]));
	 
	 // control the speed of the board
	 // this will control the speed of the pipes, change the selector to be less than some value of the output of 
	 // one input is gravity, the other input is the normal speed, the output is the new speed
	 mux2_1 difficultMode (.out(movePipeOn), .i0(pipeSpeedStart), .i1(gravityOn), .sel(currentScore < 10'b0000000100));
	 
	 // Standard LED Driver instantiation
	 LEDDriver Driver (.CLK(SYSTEM_CLOCK), .RST(reset), .EnableCount(~game), .RedPixels, .GrnPixels, .GPIO_1);
	 
endmodule

module clock_divider (clock, reset, divided_clocks);
 input logic reset, clock;
 output logic [31:0] divided_clocks = 0;

 always_ff @(posedge clock) begin
 divided_clocks <= divided_clocks + 1;
 end

endmodule


module DE1_SoC_testbench();
	 logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	 logic [9:0]  LEDR;
    logic [3:0]  KEY;
    logic [9:0]  SW;
    logic [35:0] GPIO_1;
    logic CLOCK_50;
	 
	 logic [31:0] clk;
	 logic SYSTEM_CLOCK, gravityOn, movePipeOn, newPipeOn, pause, reset;
	 logic [9:0] lfsr1; 
	 logic [15:0] newPipe;
	 //logic [15:0][15:0] RedPixels, GrnPixels; // 16 x 16 array representing red LEDs // don't include since it is not an input
	
	DE1_SoC dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .SW, .LEDR, .GPIO_1, .CLOCK_50(SYSTEM_CLOCK));
	
	parameter CLOCK_PERIOD=100;
	initial begin
		SYSTEM_CLOCK <= 0;
		forever #(CLOCK_PERIOD/2) SYSTEM_CLOCK <= ~SYSTEM_CLOCK;
	end
	
	integer i;
	initial begin		
		KEY <= 4'b0000; SW <= 10'b1111111111;								    @(posedge SYSTEM_CLOCK);
		KEY <= 4'b1111; SW <= 10'b0000000000;									 @(posedge SYSTEM_CLOCK);
		KEY[3] <= 1'b0;												repeat (2)	 @(posedge SYSTEM_CLOCK);
		KEY[3] <= 1'b1;													          @(posedge SYSTEM_CLOCK);
																			repeat(5500) @(posedge SYSTEM_CLOCK);
		SW[0] <= 1'b1;													repeat(5500) @(posedge SYSTEM_CLOCK);
		SW[0] <= 1'b0;
																							 @(posedge SYSTEM_CLOCK);
		SW[2] <= 1'b1;													repeat(5500) @(posedge SYSTEM_CLOCK);
		SW[2] <= 1'b0;													repeat(1000) @(posedge SYSTEM_CLOCK);
		SW[2] <= 1'b1;													repeat(10200)@(posedge SYSTEM_CLOCK);
		SW[2] <= 1'b0;													repeat(1000) @(posedge SYSTEM_CLOCK);
		SW[2] <= 1'b1;													repeat(5500) @(posedge SYSTEM_CLOCK);
		SW[2] <= 1'b0;													repeat(1000) @(posedge SYSTEM_CLOCK);
		SW[2] <= 1'b1;	 KEY[0] <= 1'b0;							repeat(5500) @(posedge SYSTEM_CLOCK);
		SW[2] <= 1'b0;													repeat(1000) @(posedge SYSTEM_CLOCK);
		KEY[0] <= 1'b1; KEY[3] <= 1'b0;                                 @(posedge SYSTEM_CLOCK);
		KEY[3] <= 1'b1;																 @(posedge SYSTEM_CLOCK);
		$stop;
	end	 
endmodule
