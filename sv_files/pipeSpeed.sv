// This module represents the rate at which the mario-pipes shift positions
// it should be half as fast as the rate at which the bird falls, and twice the speed at which new pipes are generated
module pipeSpeed (clk, reset, pause, activate);
   input  logic clk, reset, pause;
	output logic activate;
	logic [9:0] incr;
	
	always_ff @(posedge clk) begin
		if (reset)
			incr <= 10'b0000000000;
		else if (pause)
			incr <= incr;
		else
			incr <= incr + 10'b0000000001; 
	end
		
	assign activate = (incr == 10'b0000000000);
endmodule

// Test the gravitySpeed module
module pipeSpeed_testbench();
	logic clk, reset, pause;
	logic activate;
	
	pipeSpeed dut (.clk, .reset, .pause, .activate);
	
	// Setup the test clock
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	integer i;
	initial begin
															@(posedge clk);
	reset <= 1'b1; 									@(posedge clk);
	reset <= 1'b0; 									@(posedge clk);
	
	
	for(i = 0; i <5000; i++) begin 
		@(posedge clk);
	end
	
	
	$stop; // End the simulation.
	end
	
endmodule
	
	
	