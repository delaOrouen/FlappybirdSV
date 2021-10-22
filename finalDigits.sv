// This file will use the hex display to display the final two digits of my SID, "23"
// Switches 0-3 will be used for the final digit, and 4-7 will be used for the second to last digit
// mothodology, assign a temporary number to the orientation of the switches
module finalDigits (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
 output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
 output logic [9:0] LEDR;
 input logic [3:0] KEY;
 input logic [9:0] SW;
 logic dig7;
 logic dig6;

 // Default values, turns off the HEX displays
 assign HEX0 = 7'b1111111;
 assign HEX1 = 7'b1111111;
 assign HEX2 = 7'b1111111;
 assign HEX3 = 7'b1111111;
 assign HEX4 = 7'b1111111;
 assign HEX5 = 7'b1111111;

 // Logic to check if SW[3]..SW[0] match your bottom digit,
 assign dig6 = ~SW[7] & ~SW[6] & SW[5] & ~SW[4];
 // and SW[7]..SW[4] match the next.
 assign dig7 = ~SW[3] & ~SW[2] & SW[1] & SW[0];
 
 assign LEDR[0] = dig6 & dig7;
 
endmodule
module finalDigits_testbench();
 logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
 logic [9:0] LEDR;
 logic [3:0] KEY;
 logic [9:0] SW;
 logic dig7;
 logic dig6;

 finalDigits dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW
);

 // Try all combinations of inputs.
 integer i;
 initial begin
 SW[9] = 1'b0;
 SW[8] = 1'b0;
 for(i = 0; i <256; i++) begin
 SW[7:0] = i; #10;
 end
 end
endmodule 
