// This module is a 10 bit linear feedback shift register (LFSR) that will be used as a part of a random number generator. It outputs a 10 bit
// value


// TESTED AND FUNCTIONING

module lfsr (clk, reset, out);
	input logic clk, reset; 
	output logic [9:0] out;
	
	always_ff @(posedge clk) begin 
		if (reset) begin
			out <= 1'b0000000000;	
		end 
		else begin
			out[0] <= out[9] ~^ out[6];
			out[1] <= out[0];
			out[2] <= out[1];
			out[3] <= out[2];
			out[4] <= out[3];
			out[5] <= out[4];
			out[6] <= out[5];
			out[7] <= out[6];
			out[8] <= out[7];
			out[9] <= out[8];
		end
	end		
endmodule


module lfsr_testbench();
 logic clk, reset;
 logic [9:0] out;

 lfsr dut (clk, reset, out);

 // Set up the clock.
 parameter CLOCK_PERIOD=5;
 initial begin
	clk <= 0;
	forever #(CLOCK_PERIOD/2) clk <= ~clk;
 end
 integer i;
 // Set up the inputs to the design. Each line is a clock cycle.
 initial begin
	reset <= 1;  					@(posedge clk);
	reset <= 0; 	 				@(posedge clk);
	for(i = 0; i <512; i++) begin 
		@(posedge clk);
	end
	
									
	$stop; // End the simulation.
 end
endmodule

