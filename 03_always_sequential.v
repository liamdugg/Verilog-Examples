// executes on every rising edge of i_clock
always @ (posedge i_clock)
	begin
		and_gate <= in1 & in2;
	end