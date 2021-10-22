// this is the FSM for the winner's display. Originally, it will display 0, but as the player accumulates wins, it will display 1, 2, 3...
// When the player has accumulated 7 wins, the display will output 1 which will be used to continuously reset the playfield. 


// TESTED AND FUNCTIONING

module winDisplay (clk, reset, pin, farMost, HEX, out);
	input logic clk, reset, pin, farMost;
	output logic [6:0] HEX;
	output logic out;
	

	
	// state variables
	enum {OFF, WIN1, WIN2, WIN3, WIN4, WIN5, WIN6, WIN7} ps, ns;
	
	
		always_comb begin
			out = 1'b0; // necessary statement when not specified in each case
			ns = ps;
		case (ps)
			OFF: if (pin == 0) begin 
				ns = ps;
				out = 1'b0;
				end else if (pin == 1 & farMost == 1) begin 
					ns = WIN1;
					out = 1'b1;
				end 
			WIN1: if (pin == 0) begin 
					ns = ps;
					out = 1'b0;
				end else if (pin == 1 & farMost == 1) begin 
					ns = WIN2;
					out = 1'b1;
				end
			WIN2: if (pin == 0) begin 
					ns = ps;
					out = 1'b0;
				end else if (pin == 1 & farMost == 1) begin 
					ns = WIN3;
					out = 1'b1;
				end
			WIN3: if (pin == 0) begin 
					ns = ps;
					out = 1'b0;
				end else if (pin == 1 & farMost == 1) begin 
					ns = WIN4;
					out = 1'b1;
				end
			WIN4: if (pin == 0) begin 
					ns = ps;
					out = 1'b0;
				end else if (pin == 1 & farMost == 1) begin 
					ns = WIN5;
					out = 1'b1;
				end
			WIN5: if (pin == 0) begin 
					ns = ps;
					out = 1'b0;
				end else if (pin == 1 & farMost == 1) begin 
					ns = WIN6;
					out = 1'b1;
				end
			WIN6: if (pin == 0) begin 
					ns = ps;
					out = 1'b0;
				end else if (pin == 1 & farMost == 1) begin 
					ns = WIN7;
					out = 1'b1;
				end
			WIN7: begin
				ns = ps;
				out = 1'b1;
				end	
			default: ns = OFF;
		endcase
	end


	always_comb begin // each state outputs it's win-count to the hex display
		case (ps)
			OFF: 	   HEX = 7'b1000000;
			WIN1:		HEX = 7'b1111001;
			WIN2:    HEX = 7'b0100100;
			WIN3:  	HEX = 7'b0110000;
			WIN4:    HEX = 7'b0011001;
			WIN5:    HEX = 7'b0010010;
			WIN6:		HEX = 7'b0000010;
			WIN7:    HEX = 7'b1111000;
		endcase
	end	

	always_ff @(posedge clk) begin 
		if (reset) begin
			ps <= OFF; // don't put "out = 1'b0;" here, it will throw an error
			end
		else 
			ps <= ns;
	end
		
endmodule



module winDisplay_testbench();
	logic clk, reset, pin, farMost;
	logic [6:0] HEX;
	logic out;
 

 winDisplay dut (clk, reset, pin, farMost, HEX, out);

 // Set up the clock.
 parameter CLOCK_PERIOD=100;
 initial begin
	clk <= 0;
	forever #(CLOCK_PERIOD/2) clk <= ~clk;
 end

 integer i;
 initial begin
																						@(posedge clk);
	reset <= 1; 																	@(posedge clk);
	reset <= 0;	pin<= 0; farMost <= 0; 										@(posedge clk);
																						@(posedge clk);
																						@(posedge clk);
	pin <= 1; farMost <= 1;														@(posedge clk);
																						@(posedge clk);
																						@(posedge clk);
	reset<=1;																		@(posedge clk);
	reset <= 0;	pin<= 0; pin<= 0; farMost<= 0; 	@(posedge clk);
																						@(posedge clk);
	for(i = 0; i <16; i++) begin 
		pin<= 1; farMost<= 1; @(posedge clk);
		pin<= 0; farMost<= 0; @(posedge clk);
									 @(posedge clk);
	end
 

	$stop; // End the simulation.
 end
endmodule


