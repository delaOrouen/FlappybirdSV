//// this module performs the subtraction: of two `1 bit values by using a 3_8 decoder


// TESTED AND FUNCTIONING

module subtractor(Ain, Bin, Cin, Cout, out);
	input logic Ain, Bin, Cin;
	output logic Cout, out;
	logic [2:0] in; //all three inputs sythesized into a 3 bits
	logic [7:0] decoded;
	
	assign in = {Ain, ~Bin, Cin};
	
	decoder3_8 m(.out(decoded), .in(in), .enable(1'b1));
	
	always_comb begin
		Cout = 	1'b0;
		out = 	1'b0;
	if 	  (decoded[0] == 1) Cout = 1'b1;
	else if (decoded[1] == 1) out = 	1'b1;
	else if (decoded[2] == 1) out = 	1'b1;
	else if (decoded[3] == 1) Cout = 1'b1;
	else if (decoded[4] == 1) out = 	1'b1;
	else if (decoded[5] == 1) Cout = 1'b1;
	else if (decoded[6] == 1) Cout = 1'b1;
	else if (decoded[7] == 1) out = 	1'b1;
	else begin 
			out = 1'bx;
			Cout = 1'bx;
		end	
	end
	
	
	endmodule
	
	
	
	
module subtractor_testbench();
	logic Ain, Bin, Cin;
	logic Cout, out;
	logic B;
	assign B = ~Bin;

 subtractor dut (Ain, Bin, Cin, Cout, out);
 
 
 
 
 integer i;
 initial begin
 
 Cin = 1'b1;
 for(i = 0; i <4; i++) begin 
 {Ain, Bin} = i; #10;
 end
 end
endmodule 
