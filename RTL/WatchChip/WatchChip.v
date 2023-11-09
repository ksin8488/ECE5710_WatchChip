/**
 * This is the top-level module for the Watch Chip project.
 * It instantiates the various modules in other directories as needed.
 *
 * @author Ella Moss
 */

module WatchChip(
	input clk,
	input rst,
	input btn_mode,
	input btn_set,
	input btn_inc,
	input btn_dec,
	input btn_light,
	output [6:0] h1,
	output [6:0] h0,
	output [6:0] m1,
	output [6:0] m0,
	output [6:0] s1,
	output [6:0] s0,
	output colon,
	output light);

// Instantiate modules:
// Clock divider
wire clk_seconds;
clk_divider		cd(.clk(clk),
					.reset(rst),
					.clk_seconds(clk_seconds));

// State controller
wire [2:0] state;
wire stopwatch_enable;
wire stopwatch_reset;
wire time_enable;
wire min_inc;
wire min_dec;
wire hour_inc;
wire hour_dec;
watch_fsm		fsm(.clk(clk),
					.reset(rst),
					.btn_mode(btn_mode),
					.btn_increment(btn_inc),
					.btn_decrement(btn_dec),
					.btn_time_set(btn_set),
					.state(state),
					.run_stopwatch(stopwatch_enable),
					.reset_stopwatch(stopwatch_reset),
					.run_time(time_enable),
					.inc_m(min_inc),
					.dec_m(min_dec),
					.inc_h(hour_inc),
					.dec_h(hour_dec));

// Timekeeping modules
wire [5:0] t_seconds, t_minutes, t_hours;
Digital_Clock	clock(.Clk_1sec(clk_seconds),
					.reset(rst),
					.clock_enable(time_enable),
					.seconds(t_seconds),
					.minutes(t_minutes),
					.hours(t_hours),
					.min_inc(min_inc),
					.min_dec(min_dec),
					.hour_inc(hour_inc),
					.hour_dec(hour_dec));
wire [5:0] sw_seconds, sw_minutes, sw_hours;
Digital_Clock	stopwatch(.Clk_1sec(clk_seconds),
					.reset(stopwatch_reset),
					.clock_enable(stopwatch_enable),
					.seconds(sw_seconds),
					.minutes(sw_minutes),
					.hours(sw_hours),
					.min_inc(0), // is this allowed.
					.min_dec(0),
					.hour_inc(0),
					.hour_dec(0));

// Time display
Seg7Display		displayer(.clk(clk),
					.seconds_clk(clk_seconds),
					.state(state),
					.current_s(t_seconds),
					.current_m(t_minutes),
					.current_h(t_hours),
					.stopwatch_s(sw_seconds),
					.stopwatch_m(sw_minutes),
					.stopwatch_h(sw_hours),
					.display_s2(s1), // oops, different conventions
					.display_s1(s0),
					.display_m2(m1),
					.display_m1(m0),
					.display_h2(h1),
					.display_h1(h0),
					.second(colon));

// Backlight controller
backlight_controller	backlight(.clk(clk),
							.reset(rst),
							.btn_backlight(btn_light),
							.light(light));
endmodule
