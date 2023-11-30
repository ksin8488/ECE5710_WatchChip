/**
 * Testbench for the top-level Watch Chip module.
 *
 * @author Ella Moss
 */

module WatchChipTb();

reg clk, reset, btn_mode, btn_set, btn_inc, btn_dec, btn_light;
wire [6:0] h2, h1, m2, m1, s2, s1;
wire colon, light;

integer i;

WatchChip	watch(.clk(clk),
	.rst(reset),
	.btn_mode(btn_mode),
	.btn_set(btn_set),
	.btn_inc(btn_inc),
	.btn_dec(btn_dec),
	.btn_light(btn_light),
	.h1(h2),
	.h0(h1),
	.m1(m2),
	.m0(m1),
	.s1(s2),
	.s0(s1),
	.colon(colon),
	.light(light));

// Clk generation
always #5 clk = ~clk;

initial begin
	// Reset state
	reset = 1'b1;
	clk = 1'b0;
	btn_mode = 1'b0;
	btn_set = 1'b0;
	btn_inc = 1'b0;
	btn_dec = 1'b0;
	btn_light = 1'b0;
	#20;
	reset = 1'b0;
	// Test switching into each mode with different buttons
	btn_mode = 1'b1;
	#20;
	btn_mode = 1'b0;
	#20;
	// should now be in.... idk. one of the modes. stopwatch i think? idfk
	// start the stopwatch, watch it count up for a little while
	// must reset first
	btn_dec = 1'b1;
	#20;
	btn_dec = 1'b0;
	#20;
	btn_inc = 1'b1;
	#20;
	btn_inc = 1'b0;
	#50000; //idk just hang out for a while, then stop it
	btn_inc = 1'b1;
	#20;
	btn_inc = 1'b0;
	#20;
	// Reset stopwatch
	btn_dec = 1'b1;
	#20;
	btn_dec = 1'b0;
	#100; // wait a little longer for reset
	// Start stopwatch again...
	btn_inc = 1'b1;
	#20;
	btn_inc = 1'b0;
	#20;
	// Move back to current time, check in modelsim that it's still at the right time
	btn_mode = 1'b1;
	#20;
	btn_mode = 1'b0;
	// Check that the light button works. sure why not
	btn_light = 1'b1;
	#20;
	btn_light = 1'b0;
	// check that it stays on the right amt of time in modelsim if u want. idc
	// try setting hours to 4
	btn_set = 1'b1;
	#20;
	btn_set = 1'b0;
	#20;
	btn_inc = 1'b1; // 1
	#20;
	btn_inc = 1'b0;
	#20;
	btn_inc = 1'b1; // 2
	#20;
	btn_inc = 1'b0;
	#20;
	btn_inc = 1'b1; // 3
	#20;
	btn_inc = 1'b0;
	#20;
	btn_inc = 1'b1; // 4
	#20;
	btn_inc = 1'b0;
	#20;
	// move to SET_M state
	btn_set = 1'b1;
	#20;
	btn_set = 1'b0;
	#20;
	// let's check overflow condition while we're here....
	for(i = 0; i <= 60; i = i + 1) begin
		btn_inc = 1'b1;
		#20;
		btn_inc = 1'b0;
		#20;
	end
	// k cool, set time and enable the real-time clock
	btn_set = 1'b1;
	#20;
	btn_set = 1'b0;
	#20;
end
endmodule
