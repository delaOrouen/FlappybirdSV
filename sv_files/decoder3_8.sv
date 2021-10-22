// A three bit decoder that takes in a 3 bit number and converts it into an 8 bit number with one true bit. 

// Tested and Functioning

module decoder3_8(out, in, enable);
	input logic [2:0] in;
	input logic enable;
	output logic [7:0] out;
	
	always_comb begin
		out = 8'b00000000;
		case(in)
			3'b000: if (enable) out[0] = 1'b1;
			3'b001: if (enable) out[1] = 1'b1;
			3'b010: if (enable) out[2] = 1'b1;
			3'b011: if (enable) out[3] = 1'b1;
			3'b100: if (enable) out[4] = 1'b1;
			3'b101: if (enable) out[5] = 1'b1;
			3'b110: if (enable) out[6] = 1'b1;
			3'b111: if (enable) out[7] = 1'b1;
		endcase
	end
endmodule



module decoder3_8_testbench();
	logic [2:0] in;
	logic enable;
	logic [7:0] out;
	

 decoder3_8 dut (out, in, enable);

 initial begin
 in[0]=0; in[1]=0; in[2]=0; enable=1; #10;
 in[0]=0; in[1]=0; in[2]=1; enable=1; #10;
 in[0]=0; in[1]=1; in[2]=0; enable=1; #10;
 in[0]=0; in[1]=1; in[2]=1; enable=1; #10;
 in[0]=1; in[1]=0; in[2]=0; enable=1; #10;
 in[0]=1; in[1]=0; in[2]=1; enable=1; #10;
 in[0]=1; in[1]=1; in[2]=0; enable=1; #10;
 in[0]=1; in[1]=1; in[2]=1; enable=1; #10;
 end
endmodule 
