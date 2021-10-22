// a module that can count from zero to nine and outputs to a seven-segment display. Once it reaches nine, the next input will cause this
// module to output one so that it can be hooked up to another counter_09 to count to any decimal value required.
module counter_09 (in, clk, reset, HEX, out, count);
	input logic in, clk, reset;
	output logic [6:0] HEX;
	output logic out;
	output logic [3:0] count;
	
	// state variables
	enum {ZERO, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE} ps, ns;
	
	always_comb begin
			out = 1'b0; // necessary statement when not specified in each case
			ns = ps;
			count = count;
		case (ps)
			ZERO: if (in == 1) begin 
				ns = ONE;
				out = 1'b0;
				count = 4'b0001;
				end else begin 
					ns = ps;
					out = 1'b0;
					count = 4'b0000;
				end 
			ONE: if (in == 1) begin 
				ns = TWO;
				out = 1'b0;
				count = 4'b0010;
				end else begin 
					ns = ps;
					out = 1'b0;
					count = 4'b0001;
				end
			TWO: if (in == 1) begin 
				ns = THREE;
				out = 1'b0;
				count = 4'b0011;
				end else begin 
					ns = ps;
					out = 1'b0;
					count = 4'b0010;
				end
			THREE: if (in == 1) begin 
				ns = FOUR;
				out = 1'b0;
				count = 4'b0100;
				end else begin 
					ns = ps;
					out = 1'b0;
					count = 4'b0011;
				end
			FOUR: if (in == 1) begin 
				ns = FIVE;
				out = 1'b0;
				count = 4'b0101;
				end else begin 
					ns = ps;
					out = 1'b0;
					count = 4'b0100;
				end
			FIVE: if (in == 1) begin 
				ns = SIX;
				out = 1'b0;
				count = 4'b0110;
				end else begin 
					ns = ps;
					out = 1'b0;
					count = 4'b0101;
				end
			SIX: if (in == 1) begin 
				ns = SEVEN;
				out = 1'b0;
				count = 4'b0111;
				end else begin 
					ns = ps;
					out = 1'b0;
					count = 4'b0110;
				end
			SEVEN: if (in == 1) begin 
				ns = EIGHT;
				out = 1'b0;
				count = 4'b1000;
				end else begin 
					ns = ps;
					out = 1'b0;
					count = 4'b0111;
				end
			EIGHT: if (in == 1) begin 
				ns = NINE;
				out = 1'b0;
				count = 4'b1001;
				end else begin 
					ns = ps;
					out = 1'b0;
					count = 4'b1000;
				end
			NINE: if (in == 1) begin 
				ns = ZERO;
				out = 1'b1;
				count = 4'b0000;
				end else begin 
					ns = ps;
					out = 1'b0;
					count = 4'b1001;
				end	
			default: ns = ZERO;
		endcase
	end


	always_comb begin // each state outputs it's win-count to the hex display
		case (ps)
			ZERO:		HEX = 7'b1000000;
			ONE:		HEX = 7'b1111001;
			TWO:		HEX = 7'b0100100;
			THREE: 	HEX = 7'b0110000;
			FOUR:		HEX = 7'b0011001;
			FIVE:		HEX = 7'b0010010;
			SIX:		HEX = 7'b0000010;
			SEVEN:	HEX = 7'b1111000;
			EIGHT:	HEX = 7'b0000000;
			NINE:		HEX = 7'b0010000;
		endcase
	end	

	always_ff @(posedge clk) begin 
		if (reset) begin
			ps <= ZERO; // don't put "out = 1'b0;" here, it will throw an error
			end
		else 
			ps <= ns;
	end	
endmodule


// Test the gravitySpeed module
module counter_09_testbench();
	logic in, clk, reset;
	logic [6:0] HEX;
	logic out;
	logic [3:0] count;
	
	counter_09 dut (.in, .clk, .reset, .HEX, .out, .count);
	
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
	
	
	for(i = 0; i <11; i++) begin 
		in <= 1'b1; @(posedge clk);
		in <= 1'b0; @(posedge clk);
		@(posedge clk);
	end
											
		reset<= 1'b1; @(posedge clk);
		reset<= 1'b0; @(posedge clk);
	
	
	$stop; // End the simulation.
	end
	
endmodule

	