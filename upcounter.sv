// this is a WIDTH-bit signal. Each time an input comes, 
// inpcomplete, not functioning

module upcounter #(parameter WIDTH=8)(incr, reset, clk, out);
	output logic [WIDTH-1:0] 	out;
	input logic 					incr, reset, clk;
	
	always_ff @(posedge clk) begin
		if (reset) out <= 0;
		else if (incr) out <= out + 1;
		else out <= out;
	end
endmodule
	
module upCounter_testbench();
		logic [3:0] out;
		logic incr, reset, clk;
	
	upCounter_testbench dut ();

	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
 initial begin
															@(posedge clk);
	reset <= 1'b1; incr <= 1'b0;					@(posedge clk);
	
	repeat (10)
	incr <= 1'b1;										@(posedge clk);
	incr <= 1'b0;										@(posedge clk);
																	
	$stop; // End the simulation.
 end	
endmodule
