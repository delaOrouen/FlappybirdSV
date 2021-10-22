// this module is designed to display the player's highest score which is determined by the number of "gates" (pipes) that they fly their
// bird through. The score of the display only changes when the player reaches a new high score, or they reset the game. 

module highScore (currentScore, HEXout0, HEXout1, HEXout2, HEXin0, HEXin1, HEXin2, reset, resetScore, in, clk, gameOver);
	output logic [6:0] HEXout0, HEXout1, HEXout2; // new dislplay of high-score of gates passed
	output logic [9:0] currentScore;
	input logic [6:0] HEXin0, HEXin1, HEXin2; // current display of gates passsed
	input logic reset, resetScore, in, clk, gameOver; 		//becomes true each time a gate is passed
	logic [9:0] highScore;
	
	always_ff @(posedge clk) begin
		if(resetScore) begin
			currentScore <= 10'b0000000000;
			highScore <= 10'b0000000000;
			HEXout0 <= 7'b1111111;
			HEXout1 <= 7'b1111111;
			HEXout2 <= 7'b1111111;
		end else if (reset) begin
			currentScore <= 10'b0000000000;
			highScore <= highScore;
			HEXout0 <= 7'b1111111;
			HEXout1 <= 7'b1111111;
			HEXout2 <= 7'b1111111;
		end else if (in & ~gameOver) begin
			currentScore <= currentScore + 10'b0000000001;
			highScore <= highScore;
			HEXout0 <= HEXout0;
			HEXout1 <= HEXout1;
			HEXout2 <= HEXout2;
		end else if (gameOver & (currentScore > highScore)) begin
			highScore <= currentScore;
			currentScore <= 10'b0000000000;
			HEXout0 <= HEXin0;
			HEXout1 <= HEXin1;
			HEXout2 <= HEXin2;
		end else begin
			currentScore <= currentScore;
			highScore <= highScore;
			HEXout0 <= HEXout0;
			HEXout1 <= HEXout1;
			HEXout2 <= HEXout2;
		end
	end	
endmodule


// note: view signals currentScore and highScore in modelsim, change currentScore and highsScore from logic to Output logic in the 
// highScore module. 
module highScore_testbench();
	logic [7:0] HEXout0, HEXout1, HEXout2;
	logic [7:0] HEXin0, HEXin1, HEXin2; // current display of gates passsed
	logic reset, resetScore, in, clk, gameOver; 		//becomes true each time a gate is passed
   logic [9:0] currentScore, highScore;
	
	highScore dut (currentScore, highScore, HEXout0, HEXout1, HEXout2, HEXin0, HEXin1, HEXin2, reset, resetScore, in, clk, gameOver);
	
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	initial begin
																																						@(posedge clk);
	reset <= 1'b1; HEXin0 <= 7'b0000010; HEXin1 <= 7'b0000010; HEXin2 <= 7'b0000010; gameOver <= 1'b0; in <= 1'b0;  resetScore <= 1'b1;@(posedge clk);
	reset <= 1'b0;																																	@(posedge clk);
																																						@(posedge clk);
	in <= 1'b1;																														repeat (10) @(posedge clk);
	in <= 1'b0;																														repeat (10) @(posedge clk);
	
	gameOver <= 1'b1;																																@(posedge clk);
	gameOver <= 1'b0;																																@(posedge clk);
																																						@(posedge clk);
	HEXin0 <= 7'b0000001; HEXin1 <= 7'b0000001; HEXin2 <= 7'b0000001; 															@(posedge clk);
	in <= 1'b1;																														repeat (9)  @(posedge clk);
	in <= 1'b0;																														repeat (9)  @(posedge clk);
																																						@(posedge clk);
	gameOver <= 1'b1;																																@(posedge clk);
	gameOver <= 1'b0;																																@(posedge clk);
																																						@(posedge clk);
	HEXin0 <= 7'b0000011; HEXin1 <= 7'b0000011; HEXin2 <= 7'b0000011; 															@(posedge clk);
	in <= 1'b1;																														repeat (12) @(posedge clk);
	in <= 1'b0;																														repeat (12) @(posedge clk);
																																						@(posedge clk);
	gameOver <= 1'b1;																																@(posedge clk);
	gameOver <= 1'b0;																																@(posedge clk);
																																						@(posedge clk);
	resetScore <= 1'b1;																																	@(posedge clk);
	resetScore <= 1'b0;																																	@(posedge clk);
																																						@(posedge clk);
	
	
	$stop;
	end
endmodule
