//FSM that outputs true if the input is true for two clock cycles
module landingLights (clk, reset, w, out);
	input logic clk, reset;
	input logic [1:0] w; //SW[1:0]
	output logic [2:0] out; //LEDR[2:0]
	
	// State variables.
	enum { SIDES, LEFT, RIGHT, MIDDLE } ps, ns; 

// Next State logic

always_comb begin
	case (ps)
		SIDES:  if (w == 2'b00) ns = MIDDLE;
			else if (w == 2'b01) ns = RIGHT;
			else if (w == 2'b10) ns = LEFT;
			else ns = MIDDLE; //optimization involves considering the don't care values
		LEFT: if (w == 2'b00) ns = SIDES;
			else if (w == 2'b01) ns = RIGHT;
			else if (w == 2'b10) ns = MIDDLE;
			else ns = MIDDLE;
		RIGHT: if (w == 2'b00) ns = SIDES;
			else if (w == 2'b01) ns = MIDDLE;
			else if (w == 2'b10) ns = LEFT;
			else ns = MIDDLE;
		MIDDLE: if (w == 2'b00) ns = SIDES;
			else if (w == 2'b01) ns = LEFT;
			else if (w == 2'b10) ns = RIGHT;
			else ns = MIDDLE;
	endcase
end


 // Output logic - could also be another always, or part of above block.
 
always_comb begin
	case (ps)
		SIDES: 	out = 3'b101;
		LEFT: 	out = 3'b100;
		RIGHT: 	out = 3'b001;
		MIDDLE: 	out = 3'b010;
	endcase
end



 // DFFs
 always_ff @(posedge clk) begin
	if (reset)
		ps <= SIDES;
	else
		ps <= ns;
 end
endmodule



module landingLights_testbench();
 logic clk, reset;
 logic [0:1] w;
 logic [2:0] out;

 landingLights dut (clk, reset, w, out);

 // Set up the clock.
 parameter CLOCK_PERIOD=100;
 initial begin
	clk <= 0;
	forever #(CLOCK_PERIOD/2) clk <= ~clk;
 end

 // Set up the inputs to the design. Each line is a clock cycle.
 initial begin
										@(posedge clk);
	reset <= 1; 					@(posedge clk);
	reset <= 0; w <= 0;	 		@(posedge clk);
										@(posedge clk);
										@(posedge clk);
										@(posedge clk);
				w <=2'b01;			@(posedge clk);
										@(posedge clk);
										@(posedge clk);
										@(posedge clk);
				w <=2'b00;			@(posedge clk);
				w <=2'b10;			@(posedge clk);
										@(posedge clk);
										@(posedge clk);
										@(posedge clk);
				w <= 2'b00;			@(posedge clk);
										@(posedge clk);
	$stop; // End the simulation.
 end
endmodule
