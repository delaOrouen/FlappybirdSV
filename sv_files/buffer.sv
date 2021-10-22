// DFF for the tug of war game, there are two players and therefore, this module will be instantiated (proper terminology?) twice. 
// The output of this DFF should go to another DFF. The output of the first DFF should only be true when the button is just pressed, and it
// should only become true again when the button is released then pressed again. Only players gifted with a strong trigger-finger may win 
// in this game. 


// TESTED AND FUNCTIONING

module buffer (clk, reset, in, out);
	input logic clk, reset, in; 
	output logic out;
	
	logic temp1;
	
	// better way to do a buffer
	
	always_ff @(posedge clk) begin 
		if (reset) begin
			temp1 <= 1'b0;
		end 
		else begin
			temp1 <= in;
			out <= temp1;
		end
	end
	
			
endmodule


module buffer_testbench();
 logic clk, reset, in;
 logic out;

 buffer dut (clk, reset, in, out);

 // Set up the clock.
 parameter CLOCK_PERIOD=5;
 initial begin
	clk <= 0;
	forever #(CLOCK_PERIOD/2) clk <= ~clk;
 end

 // Set up the inputs to the design. Each line is a clock cycle.
 initial begin
									@(posedge clk);
	reset <= 1; in <= 0; 	@(posedge clk);
	reset <= 0; 	 			@(posedge clk);
									@(posedge clk);
	in<= 1;						@(posedge clk);
					in<= 0;		@(posedge clk);
									@(posedge clk);
					in<= 1;		@(posedge clk);
									@(posedge clk);
	reset <= 1;					@(posedge clk);
									@(posedge clk);
									@(posedge clk);
									@(posedge clk);
	$stop; // End the simulation.
 end
endmodule
