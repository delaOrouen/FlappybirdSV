// This module is going to become my module for he mario pipes, note, the bird will appear on the 5th column from the right
module mario_pipes(RST, clk, RedPixels, GrnPixels);
    input logic               clk, RST;
    output logic [15:0][15:0] RedPixels; // 16x16 array of red LEDs    rows-columns?
    output logic [15:0][15:0] GrnPixels; // 16x16 array of green LEDs
	 
	 
	 
	 // state of the bird:
	 // if the light where the bird is turns green and red, the game stops
	 // if the button is pressed, the bird will go up an led
	 // if the button is not pressed, the bird will fall down an LED
	 
	 
	 
	 // I need to change this to an always ff block which means that I need the clock
	 always_ff@ (posedge clk)
	 begin
		
		// Reset - Turn off all LEDs
		if (RST)
		begin
		  // originally, all the red LEDs are off
		  RedPixels <= '0;
		  
		  // the following pattern represents the orignal state of the mario pipes
		  GrnPixels[00] <= 16'b0000010010010010;
		  GrnPixels[01] <= 16'b0000010010010010;
		  GrnPixels[02] <= 16'b0000010000010010;
		  GrnPixels[03] <= 16'b0000010000010010;
		  GrnPixels[04] <= 16'b0000000000000010;
		  GrnPixels[05] <= 16'b0000000000000010;
		  GrnPixels[06] <= 16'b0000000000000000;
		  GrnPixels[07] <= 16'b0000000000000000;
		  GrnPixels[08] <= 16'b0000000000000000;
		  GrnPixels[09] <= 16'b0000000010000000;
		  GrnPixels[10] <= 16'b0000000010000000;
		  GrnPixels[11] <= 16'b0000010010010000;
		  GrnPixels[12] <= 16'b0000010010010000;
		  GrnPixels[13] <= 16'b0000010010010010;
		  GrnPixels[14] <= 16'b0000010010010010;
		  GrnPixels[15] <= 16'b0000010010010010;			
		end
		
	  // Display a pattern
		else
		begin
		  // note: the following lines are use to shift each of the columns of the LED array by 1 column to the left while inputing
		  // one new column - the 
		  
//		  integer j;
//		  for(j = 0; j <4096; j++) begin 
//				#10;
//		  end
		  
		  GrnPixels[00] <= {GrnPixels[00][14:0], 1'b0};
		  GrnPixels[01] <= {GrnPixels[01][14:0], 1'b0};
		  GrnPixels[02] <= {GrnPixels[02][14:0], 1'b0};
		  GrnPixels[03] <= {GrnPixels[03][14:0], 1'b0};
		  GrnPixels[04] <= {GrnPixels[04][14:0], 1'b0};
		  GrnPixels[05] <= {GrnPixels[05][14:0], 1'b0};
		  GrnPixels[06] <= {GrnPixels[06][14:0], 1'b0};
		  GrnPixels[07] <= {GrnPixels[07][14:0], 1'b0};
		  GrnPixels[08] <= {GrnPixels[08][14:0], 1'b0};
		  GrnPixels[09] <= {GrnPixels[09][14:0], 1'b0};
		  GrnPixels[10] <= {GrnPixels[10][14:0], 1'b0};
		  GrnPixels[11] <= {GrnPixels[11][14:0], 1'b0};
		  GrnPixels[12] <= {GrnPixels[12][14:0], 1'b0};
		  GrnPixels[13] <= {GrnPixels[13][14:0], 1'b0};
		  GrnPixels[14] <= {GrnPixels[14][14:0], 1'b0};
		  GrnPixels[15] <= {GrnPixels[15][14:0], 1'b0};  
		end
	end

endmodule


module mario_pipes_testbench();
	logic RST, clk;
	logic [15:0][15:0] RedPixels, GrnPixels;
	logic [31:0] clock;
	
	clock_divider divider (.clock(CLOCK_50), .divided_clocks(clock));
	 
	mario_pipes dut (.RST, .clk(clock[14]), .RedPixels, .GrnPixels);
	
	parameter CLOCK_PERIOD=100;
	initial begin
		clock[14] <= 0;
		forever #(CLOCK_PERIOD/2) clock[14] <= ~clk;
	end
	
	
	integer i;
 initial begin
														@(posedge clk);
	RST <= 1'b1; 									@(posedge clk);
	RST <= 1'b0; 									@(posedge clk);
	
	
	for(i = 0; i <32; i++) begin 
		@(posedge clk);
	end
	
	
	$stop; // End the simulation.
 end
endmodule
