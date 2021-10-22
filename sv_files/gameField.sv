// This module operates each row of the 16x16 LED array to display the gamefield
// setting RES = 1 when instantiating is to use this module for the row where the bird starts
// setting BOTTOM = 1 indicates that this module is used for the bottom-most row
// setting TOP = 1 indicates that this module is use for the top-most row
module gameField (clk, RES, BOTTOM, TOP, reset, gravityOn, movePipeOn, newPipeOn, newPipePiece, birdAbove, birdBelow, player, gameOver, gatePassed, grnRow, redRow);
	output logic gameOver, gatePassed;
	output logic [15:0] grnRow, redRow;
	input logic gravityOn, movePipeOn,newPipeOn, newPipePiece, reset, clk, player, RES, BOTTOM, TOP; 
	input logic [15:0] birdAbove, birdBelow;
	logic birdSightedAbove, birdSightedBelow;
	
	assign gameOver = redRow[11] & grnRow[11] | (BOTTOM & gravityOn & redRow[11] & ~player | TOP & player & redRow[11] & gravityOn);
	assign gatePassed = grnRow[11] & ~redRow[11] & ~gameOver; // this is used to indicate that the bird flew between the mario-pipes
	assign birdSightedAbove = birdAbove > 16'b0000000000000000;
	assign birdSightedBelow = birdBelow > 16'b0000000000000000;
	
	enum logic {OFF, ON} ps, ns;
		
	always_comb begin
		ns = ps; 
		case (ps)
			OFF: if (gravityOn & (~player & birdSightedAbove | player & birdSightedBelow)) begin
					ns = ON;
				end else ns = ps;
			ON: if (gravityOn) begin
					ns = OFF;
				end else ns = ps;
		endcase
	end	

	always_comb begin
		case (ps)
		OFF: redRow = {4'b0000, 1'b0, 11'b00000000000};
		ON: redRow = {4'b0000, 1'b1, 11'b00000000000};
		endcase
	end		

	always_ff @(posedge clk) begin
		if (reset) begin
			if (RES == 1'b1) ps <= ON;
			else ps <= OFF;
		end else
			ps <= ns;
	end
				
	
	// this block handles the movement of the pipes
	always_ff@ (posedge clk) begin	
		if (reset)
		begin
		  // originally, all the red LEDs are off
		  grnRow <= 16'b0000000000000000;
		end
		// if thereis a new pipe
		else if (movePipeOn & newPipeOn)
		begin
		  // note: the following lines are use to shift each of the columns of the LED array by 1 column to the left while inputing
		  // one new column - the 
		  grnRow <= {grnRow[14:0], newPipePiece};
		end
		else if (movePipeOn) begin
			grnRow <= {grnRow[14:0], 1'b0};
		end
		else grnRow <= grnRow;
	end
endmodule


module gameField_testbench();
	logic gameOver, gatePassed;
	logic [15:0] grnRow, redRow;
	logic gravityOn, movePipeOn,newPipeOn, newPipePiece, reset, clk, player, RES, BOTTOM, TOP; 
	logic [15:0] birdAbove, birdBelow;
	logic birdSightedAbove, birdSightedBelow;
	
	gameField dut (.clk, .RES, .BOTTOM, .TOP, .reset, .gravityOn, .movePipeOn, .newPipeOn, .newPipePiece, .birdAbove, .birdBelow, .player, .gameOver, .gatePassed, .grnRow, .redRow);
	
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	
	integer i;
	integer j;
 initial begin
																													@(posedge clk);
	reset <= 1'b1; birdAbove <= 16'b0000000000000000; birdBelow <= 16'b0000000000000000; gravityOn <= 1'b0; movePipeOn <= 1'b0; newPipePiece <= 1'b1;
	player <= 1'b0; RES <= 1'b1; BOTTOM <= 1'b0; TOP <= 1'b0; 		@(posedge clk);
	reset <= 1'b0; gravityOn <= 1'b1;																	@(posedge clk);
	gravityOn <= 1'b0;																						@(posedge clk);
																													@(posedge clk);
	reset <= 1'b1;	player <= 1'b1; gravityOn <= 1'b1;												@(posedge clk);																											
	reset <= 1'b0;																								@(posedge clk);
	gravityOn <= 1'b0; 																						@(posedge clk);
																													@(posedge clk);
	reset <= 1'b1; player <= 1'b0; birdAbove <= 16'b0000010000000000;	RES <= 1'b0; 		@(posedge clk);
	reset <= 1'b0;	gravityOn <= 1'b1;																	@(posedge clk);
	gravityOn <= 1'b0;																						@(posedge clk);
																													@(posedge clk);
	reset <= 1'b1; player <= 1'b1; birdAbove <= 16'b0000000000000000; birdBelow <= 16'b0000010000000000;  @(posedge clk);
	reset <= 1'b0;	gravityOn <= 1'b1;																	@(posedge clk);
	gravityOn <= 1'b0;																						@(posedge clk);
																													@(posedge clk);
	reset <= 1'b1; player <= 1'b1; birdBelow <= 16'b0000000000000000; TOP <= 1'b1; RES<= 1'b1;  @(posedge clk);
	reset <= 1'b0;	gravityOn <= 1'b1;																	@(posedge clk);
	gravityOn <= 1'b0;																						@(posedge clk);
																													@(posedge clk);
	reset <= 1'b1; player <= 1'b0; birdBelow <= 16'b0000000000000000; TOP <= 1'b0; BOTTOM <= 1'b1; RES<= 1'b1;  @(posedge clk);
	reset <= 1'b0;	gravityOn <= 1'b1;																	@(posedge clk);
	gravityOn <= 1'b0;																						@(posedge clk);
																													@(posedge clk);
	reset <= 1'b1;	RES<= 1'b0;																							@(posedge clk);
	reset <= 1'b0;																								@(posedge clk);
	
	
	
	
	for(i = 0; i <8; i++) begin 
		movePipeOn <= 1'b1; newPipeOn <= 1'b1;	@(posedge clk);
		newPipeOn <= 1'b0;	@(posedge clk);
		movePipeOn <= 1'b0;	@(posedge clk);
									@(posedge clk);
	end
	reset <= 1'b1; 								@(posedge clk);
	reset <= 1'b0; 								@(posedge clk);
	
	$stop; // End the simulation.
 end	
endmodule
	