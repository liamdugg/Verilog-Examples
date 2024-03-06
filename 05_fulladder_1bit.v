module fulladder_1bit (
	input  a,
	input  b,
	input  ci,
	output s,
	output co );

	assign s = a ^ b ^ cin;
	assign co = a & b | a & ci | b & ci;

endmodule