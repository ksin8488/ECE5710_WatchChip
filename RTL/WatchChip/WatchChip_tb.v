/**
 * Testbench for the top-level Watch Chip module.
 *
 * @author Ella Moss
 */

module WatchChipTb();

reg clk, reset, btn_mode, btn_set, btn_inc, btn_dec, btn_light;
wire [6:0] h2, h1, m2, m1, s2, s1;
wire colon, light;

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
	// have at it in modelsim idfk anymore
end
endmodule
