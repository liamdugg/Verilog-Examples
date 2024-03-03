// always is used for
//	- define block of combinational logic (clk not needed)
//	- define block of sequential logic (clk needed)

always @ (in1 or in2) // sensitivity list
	// a change on in1 or in2 will make the always block execute.
	begin
		and_gate = in1 & in2;
	end