`timescale 1ns/1ps
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

soc_top	watch(.clk(clk),
	.reset(reset),
	.btn_mode(btn_mode),
	.btn_set(btn_set),
	.btn_inc(btn_inc),
	.btn_dec(btn_dec),
	.btn_light(btn_light),

	.h1_6(h2[6]),
	.h1_5(h2[5]),
	.h1_4(h2[4]),
	.h1_3(h2[3]),
	.h1_2(h2[2]),
	.h1_1(h2[1]),
	.h1_0(h2[0]),

    .h0_6(h1[6]),
    .h0_5(h1[5]),
    .h0_4(h1[4]),
    .h0_3(h1[3]),
    .h0_2(h1[2]),
    .h0_1(h1[1]),
    .h0_0(h1[0]),

    .m1_6(m2[6]),
    .m1_5(m2[5]),
    .m1_4(m2[4]),
    .m1_3(m2[3]),
    .m1_2(m2[2]),
    .m1_1(m2[1]),
    .m1_0(m2[0]),

    .m0_6(m1[6]),
    .m0_5(m1[5]),
    .m0_4(m1[4]),
    .m0_3(m1[3]),
    .m0_2(m1[2]),
    .m0_1(m1[1]),
    .m0_0(m1[0]),

    .s1_6(s2[6]),
    .s1_5(s2[5]),
    .s1_4(s2[4]),
    .s1_3(s2[3]),
    .s1_2(s2[2]),
    .s1_1(s2[1]),
    .s1_0(s2[0]),

    .s0_6(s1[6]),
    .s0_5(s1[5]),
    .s0_4(s1[4]),
    .s0_3(s1[3]),
    .s0_2(s1[2]),
    .s0_1(s1[1]),
    .s0_0(s1[0]),

	.colon(colon),
	.light(light));

// Clk generation
always #5 clk = ~clk;

initial begin
	// Reset state
	#20;
	reset = 1'b1;
	clk = 1'b0;
	btn_mode = 1'b0;
	btn_set = 1'b0;
	btn_inc = 1'b0;
	btn_dec = 1'b0;
	btn_light = 1'b0;
	#20;
	reset = 1'b0;
	#20;
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
	btn_mode = 1'b1;
	#20;
	btn_mode = 1'b0;
end
endmodule
