module backlightTb();

reg clk, reset, btn_backlight;
wire light;

backlight_controller backlight(.clk(clk),
								.reset(reset),
								.btn_backlight(btn_backlight),
								.light(light));

// Clk generation
always #1 clk = ~clk;

initial begin
	// Reset condition
	clk = 1'b0;
	reset = 1'b1;
	btn_backlight = 1'b0;
	#5;
	reset = 1'b0;
	// Check that the light is off
	if(light !== 1'b0) begin
		$display("ERROR: Light is not off at test 1");
		$stop;
	end

	// Press the button, make sure it stays on for the given amount of time
	btn_backlight = 1'b1;
	#10;
	btn_backlight = 1'b0;
	if(light !== 1'b1) begin
		$display("ERROR: Light is not on at test 2");
		$stop;
	end

	#100000; //wait for "one second"
	if(light !== 1'b1) begin
		$display("ERROR: Light is not on at test 3");
		$stop;
	end
	else begin
		$display("Light on for one second...");
	end

	#100000;
	if(light !== 1'b1) begin
		$display("ERROR: Light is not on at test 4");
		$stop;
	end
	else begin
		$display("Light on for two seconds...");
	end

	#100000; //make sure it's still on right before 3 seconds
	if(light !== 1'b1) begin
		$display("ERROR: Light is not on at test 5");
		$stop;
	end
	else begin
		$display("Light on for three seconds...");
	end

	#100000; //make sure it's off right after 3 seconds
	if(light !== 1'b0) begin
		$display("ERROR: Light is not off at test 6, time %d", $time);
		/* $stop; */
	end
	else begin
		$display("SUCCESS! All tests passed!");
		$stop;
	end
end

endmodule
