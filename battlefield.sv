// this FSM uses all nine lights of the DE1 board as the battlefield for the tug of war game. Light five starts as the only lit light. When 
// player one presses their button, the light "advances light to the left, and visa versa for player two. The middle light will reset to a value 
// of one where the light is on. The rest of the lights will reset to a value of zero (or off).

// TESTED AND FUNCTIONING


module battlefield (clk, reset, leftLight, rightLight, p2in, p1in, out); // thid FSM manages one standard light
	input logic clk, reset, leftLight, rightLight, p2in, p1in;
	output logic out;
	
	// state variables
	enum logic {OFF, ON} ps, ns;
		
always_comb begin
		ns = ps; // note can't use if the else case is different
		
		case (ps)
			OFF: if (p1in == 0 & p2in == 0) begin 
				ns = OFF; // no input
				
			end else if ((rightLight == 1 & p2in == 1 & p1in == 0) | (leftLight == 1 & p1in == 1 & p2in == 0)) begin
				ns = ON;
				
			end 
			ON: if (p1in == 0 & p2in == 0) begin
				ns = ON;
				
			end else if (p1in == 1 ^ p2in == 1) begin 
				ns = OFF;
				
			end 
		endcase
	end	


always_comb begin
		case (ps)
		OFF:  out = 0;
		ON:  out = 1;
		endcase
end		


	always_ff @(posedge clk) begin
		if (reset)
			ps <= OFF;
		else
			ps <= ns;
	end
	
endmodule


module centerLight (clk, reset, leftLight, rightLight, p2in, p1in, out); // thid FSM manages one standard light
	input logic clk, reset, leftLight, rightLight, p2in, p1in;
	output logic out;
	
	// state variables
	enum logic {OFF, ON} ps, ns;
	
	always_comb begin
		ns = ps; // note can't use if the else case is different
		
		case (ps)
			OFF: if (p1in == 0 & p2in == 0) begin 
				ns = OFF; // no input
				
			end else if ((rightLight == 1 & p2in == 1 & p1in == 0) | (leftLight == 1 & p1in == 1 & p2in == 0)) begin
				ns = ON;
				
			end 
			ON: if (p1in == 0 & p2in == 0) begin
				ns = ON;
				
			end else if (p1in == 1 ^ p2in == 1) begin 
				ns = OFF;

			end 
		endcase
	end	
	
	
	always_comb begin
		case (ps)
		OFF:  out = 0;
		ON:  out = 1;
		endcase
end	
	
	
	
	always_ff @(posedge clk) begin
		if (reset)
			ps <= ON;
		else
			ps <= ns;
	end
	
	
	
	
endmodule



module battlefield_testbench();
	logic clk, reset, leftLight, rightLight, p2in, p1in;
	logic out;

 battlefield dut (clk, reset, leftLight, rightLight, p2in, p1in, out);

 // Set up the clock.
 parameter CLOCK_PERIOD=100;
 initial begin
	clk <= 0;
	forever #(CLOCK_PERIOD/2) clk <= ~clk;
 end

 // Set up the inputs to the design. Each line is a clock cycle.
 initial begin
																							@(posedge clk);
	reset <= 1; 																@(posedge clk);
	reset <= 0; leftLight <= 0; rightLight<= 0; p1in<= 0; p2in <= 0;	@(posedge clk);
																							@(posedge clk);
				rightLight<= 1;	p2in <=1;										@(posedge clk); //right light on, button is pushed
				p1in <= 1;	rightLight <= 0;										@(posedge clk); //left light on, button is
				p2in <= 1; 																@(posedge clk);
																							@(posedge clk);
	reset <= 1; 																		@(posedge clk);
	reset <= 0; leftLight <= 0; rightLight<= 0; p1in<= 0; p2in <= 0;	@(posedge clk);
																							@(posedge clk);
				leftLight <= 1; p1in <= 1;														@(posedge clk);
				p2in <= 1; leftLight<= 0;														@(posedge clk);
				p1in <= 1;																			@(posedge clk);
																							@(posedge clk);
																							@(posedge clk);
//	leftLight <= 1; p1in <= 0;														@(posedge clk);
//	p1in<= 1;																			@(posedge clk);
																							@(posedge clk);
	reset<= 1;																			@(posedge clk);
	reset<= 0;																			@(posedge clk);
																							@(posedge clk);
																							@(posedge clk);
																							@(posedge clk);
	reset<= 1;																						@(posedge clk);
																							@(posedge clk);
																							@(posedge clk);
																							@(posedge clk);
																							@(posedge clk);
																							
	$stop; // End the simulation.
 end
endmodule
	