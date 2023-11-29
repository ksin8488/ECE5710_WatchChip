module backlight_controller(input clk,
	input reset,
	input btn_backlight,
	output reg light);

	parameter DURATION = 3'd3; // 3 seconds 
	reg start_counter;
	wire light_clk;
	reg [2:0] current_count;
	reg light_mode;

	clk_divider		seconds_clk(.clk(clk), 
								.reset(start_counter),
								.clk_seconds(light_clk));

	always @(posedge clk or posedge reset) begin
		// Reset condition
		if(reset) begin
			current_count <= 2'b0;
			start_counter <= 1'b0;
			light_mode <= 1'b0;
			light <= 1'b0;
		end
		else begin
			//Check for btn_backlight, start counting if clicked
			if(btn_backlight == 1'b1) begin
				start_counter <= 1'b1;
				light_mode <= 1'b1;
			end
			else begin
				start_counter <= 1'b0;
			end
			light <= light_mode;
		end
	end

	// Count up to DURATION
	always @(negedge light_clk) begin //negedge bc it starts low
		current_count <= current_count + 1'b1;
		if(current_count == DURATION) begin
			light_mode <= 1'b0;
		end
	end
endmodule
