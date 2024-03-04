module led_blink (
	i_clk,
	i_ena,
	i_sw1,
	i_sw2,
	o_led_drive
);
	
	input 	i_clk;
	input 	i_ena;
	input 	i_sw1;
	input 	i_sw2;
	output 	o_led_drive;

	parameter cnt_100hz	= 125;
	parameter cnt_50hz 	= 250;
	parameter cnt_10hz 	= 1250;
	parameter cnt_1hz 	= 12500;

	reg [31:0] reg_100hz = 0;
	reg [31:0] reg_50hz = 0;
	reg [31:0] reg_10hz = 0;
	reg [31:0] reg_1hz = 0;

	reg toggle_100hz = 1'b0;
	reg toggle_50hz  = 1'b0;
	reg toggle_1hz 	 = 1'b0;
	reg toggle_1hz 	 = 1'b0;

	reg	 r_led_select;
	wire w_led_sel;

	begin

		always @ (posedge i_clk)
		begin
			if(reg_100hz == cnt_100hz-1)
				begin
					toggle_100hz <= !toggle_100hz;
					reg_100hz <= 0;
				end
			else
				reg_100hz <= reg_100hz + 1;
		end

		always @ (posedge i_clk)
		begin
			if(reg_50hz == cnt_50hz-1)
				begin
					toggle_50hz <= !toggle_50hz;
					reg_50hz <= 0;
				end
			else
				reg_50hz <= reg_50hz + 1;
		end

		always @ (posedge i_clk)
		begin
			if(reg_10hz == cnt_10hz-1)
				begin
					toggle_10hz <= !toggle_10hz;
					reg_10hz <= 0;
				end
			else
				reg_10hz <= reg_10hz + 1;
		end

		always @ (posedge i_clk)
		begin
			if(reg_1hz == cnt_1hz-1)
				begin
					toggle_1hz <= !toggle_1hz;
					reg_1hz <= 0;
				end
			else
				reg_1hz <= reg_1hz + 1;
		end

		// multiplexer
		always @ (*)
		begin
			case ({i_sw1, i_sw2})
				2'b11 : r_led_select <= toggle_1hz;
				2'b10 : r_led_select <= toggle_10hz;
				2'b01 : r_led_select <= toggle_50hz;
				2'b00 : r_led_select <= toggle_100hz;
			endcase
		end

		assign o_led_drive <= r_led_select & i_ena;

	end

endmodule