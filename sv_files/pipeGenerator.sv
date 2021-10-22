// this module take in an lfsr to compare to preselected values so that a premade mario-pipe can be outputted
module pipeGenerator(reset, clk, activateMake, lfsr1, newPipe);
	input logic reset, clk, activateMake;
	input logic [9:0] lfsr1;
	output logic [15:0] newPipe; //new pipe column
	
	
	always_ff@(posedge clk) begin
		if (reset) newPipe <= 16'b0000000000000000;
		else if (activateMake) begin
			if      (lfsr1[1:0] > 2'b00) newPipe <= 16'b1100001111111111; 
			else if (lfsr1[1:0] > 2'b10) newPipe <= 16'b1111000011111111;
			else if (lfsr1[1:0] > 2'b01) newPipe <= 16'b1111111100001111;
			else if (lfsr1[1:0] > 2'b11) newPipe <= 16'b1111111111100001;
			else 								  newPipe <= 16'b1000011111100001;
		end
		else newPipe <= newPipe; 
	end
endmodule


module pipeGenerator_testbench();
	logic reset, clk, activateMake;
	logic [9:0] lfsr1;
	logic [15:0] newPipe; //new pipe column
	
	pipeGenerator dut (.reset, .clk, .activateMake, .lfsr1, .newPipe);
	
	
	
	parameter CLOCK_PERIOD=100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD/2) clk <= ~clk;
	end
	
	
	integer i;
 initial begin
															@(posedge clk);
	reset <= 1'b1; lfsr1 <= 10'b0000000000;									@(posedge clk);
	reset <= 1'b0; 									@(posedge clk);
	
	for(i = 0; i <2048; i++) begin 
		activateMake <= 1; @(posedge clk);
		activateMake <= 0; @(posedge clk);
								 @(posedge clk);
								 @(posedge clk);
		lfsr1 = lfsr1 + 10'b0000000001;	 @(posedge clk);
		
	end
	
	reset <= 1'b1; 								@(posedge clk);
	reset <= 1'b0; 								@(posedge clk);
	
	$stop; // End the simulation.
 end	
endmodule

