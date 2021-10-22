// DFF for the tug of war game, there are two players and therefore, this module will be instantiated (proper terminology?) twice. 
// The output of this DFF should go to another DFF. The output of the first DFF should only be true when the button is just pressed, and it
// should only become true again when the button is released then pressed again. Only players gifted with a strong trigger-finger may win 
// in this game. 


// TESTED AND FUNCTIONING

module pinputs (clk, reset, w, out);
	input logic clk, reset, w; // KEY[x] (only two players)
	output logic out;
	
	logic temp1, temp2;
	
	enum logic {NOTPRESSED, PRESSED} ps, ns; // if state has more than 2 states [#:0]


	always_comb begin
		case (ps)
			NOTPRESSED: if (temp2 == 1) begin
				ns = PRESSED;
				out = 1'b1;
			end else begin
				ns = NOTPRESSED;
				out = 1'b0;
			end			
			PRESSED: if (temp2 == 1) begin 
				ns = PRESSED; // still holding input
				out = 1'b0;
			end else begin  // input released
				ns = NOTPRESSED;
				out = 1'b0;	
			end	
		endcase
	end

	// better way to do a buffer
	
	always_ff @(posedge clk) begin 
		if (reset) begin
			ps <= NOTPRESSED;
			temp2 <= 1'b0;
			temp1 <= 1'b0;
		end 
		else begin
			temp1 <= w;
			temp2 <= temp1;
			ps <= ns;
		end
	end
	
			
endmodule






module pinputs_testbench();
 logic clk, reset, w;
 logic out;

 pinputs dut (clk, reset, w, out);

 // Set up the clock.
 parameter CLOCK_PERIOD=5;
 initial begin
	clk <= 0;
	forever #(CLOCK_PERIOD/2) clk <= ~clk;
 end

 // Set up the inputs to the design. Each line is a clock cycle.
 initial begin
										@(posedge clk);
	reset <= 1; w <= 0; 					@(posedge clk);
	reset <= 0; 	 		@(posedge clk);
										@(posedge clk);
	w<= 1;								@(posedge clk);
					w<= 0;			@(posedge clk);
										@(posedge clk);
					w<= 1;					@(posedge clk);
								@(posedge clk);
	reset <= 1;						@(posedge clk);
							@(posedge clk);
									@(posedge clk);
									@(posedge clk);
	$stop; // End the simulation.
 end
endmodule
//
//
//
//			
//
//	
	


