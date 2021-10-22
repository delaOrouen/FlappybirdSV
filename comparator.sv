// takes in a hex code and returns whether the number it represents is less than an inputted 4-bit number
module comparator(HEXin, in0, out);
	output logic out;
	input logic [6:0] HEXin;
	input logic [3:0] in0;
	logic [3:0] num;
	
	always_comb begin
		case (HEXin)
			7'b1000000: num = 4'b0000;
			7'b1111001: num = 4'b0001; 
			7'b0100100: num = 4'b0010;
			7'b0110000: num = 4'b0011;
			7'b0011001: num = 4'b0100;
			7'b0010010: num = 4'b0101;
			7'b0000010: num = 4'b0110;
			7'b1111000: num = 4'b0111;
			7'b0000000: num = 4'b1000;
			7'b0010000: num = 4'b1001;
			default num = 4'b0000;
		endcase	
	end
	
	always_comb begin	
		out = 1'b0;
		case(in0 > num)
		1'b0: out = 1'b0;
		1'b1: out = 1'b1;
		endcase
	end
endmodule

// Test the gravitySpeed module
module comparator_testbench();
	logic out;
	logic [6:0] HEXin;
	logic [3:0] in0;
	logic [3:0] num;
	
	comparator dut (.HEXin, .in0, .out);
	
	
	initial begin
															#10;
															
	for(in0 = 4'b0000; in0 < 4'b1010; in0 = in0 + 4'b0001) begin 
			HEXin = 7'b1000000; #10;
			HEXin = 7'b1111001; #10; 
			HEXin = 7'b0100100; #10;
			HEXin = 7'b0110000; #10;
			HEXin = 7'b0011001; #10;
			HEXin = 7'b0010010; #10;
			HEXin = 7'b0000010; #10;
			HEXin = 7'b1111000; #10;
			HEXin = 7'b0000000; #10;
			HEXin = 7'b0010000; #10;
	end
										
	$stop; // End the simulation.
	end
	
endmodule
