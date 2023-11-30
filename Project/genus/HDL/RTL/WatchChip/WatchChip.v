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

	   output wire h1_6,
	   output wire h1_5,
	   output wire h1_4,
	   output wire h1_3,
	   output wire h1_2,
	   output wire h1_1,
	   output wire h1_0,

	   output wire h0_6,
	   output wire h0_5,
	   output wire h0_4,
	   output wire h0_3,
	   output wire h0_2,
	   output wire h0_1,
	   output wire h0_0,

	   output wire m1_6,
	   output wire m1_5,
	   output wire m1_4,
	   output wire m1_3,
	   output wire m1_2,
	   output wire m1_1,
	   output wire m1_0,

	   output wire m0_6,
	   output wire m0_5,
	   output wire m0_4,
	   output wire m0_3,
	   output wire m0_2,
	   output wire m0_1,
	   output wire m0_0,

	   output wire s1_6,
	   output wire s1_5,
	   output wire s1_4,
	   output wire s1_3,
	   output wire s1_2,
	   output wire s1_1,
	   output wire s1_0,

	   output wire s0_6,
	   output wire s0_5,
	   output wire s0_4,
	   output wire s0_3,
	   output wire s0_2,
	   output wire s0_1,
	   output wire s0_0,

	   output wire colon,
	   output wire light);

   wire [6:0] h1, h0, m1, m0, s1, s0;
   /*
   assign h1 = {h1_6, h1_5, h1_4, h1_3, h1_2, h1_1, h1_0};
   assign h0 = {h0_6, h0_5, h0_4, h0_3, h0_2, h0_1, h0_0};
   assign m1 = {m1_6, m1_5, m1_4, m1_3, m1_2, m1_1, m1_0};
   assign m0 = {m0_6, m0_5, m0_4, m0_3, m0_2, m0_1, m0_0};
   assign s1 = {s1_6, s1_5, s1_4, s1_3, s1_2, s1_1, s1_0};
   assign s0 = {s0_6, s0_5, s0_4, s0_3, s0_2, s0_1, s0_0};
   */

  // this got messy during debugging :/ but there you go
   assign h0_0 = h0[0];
   assign h0_1 = h0[1];
   assign h0_2 = h0[2];
   assign h0_3 = h0[3];
   assign h0_4 = h0[4];
   assign h0_5 = h0[5];
   assign h0_6 = h0[6];

   assign h1_0 = h1[0];
   assign h1_1 = h1[1];
   assign h1_2 = h1[2];
   assign h1_3 = h1[3];
   assign h1_4 = h1[4];
   assign h1_5 = h1[5];
   assign h1_6 = h1[6];

   assign m0_0 = m0[0];
   assign m0_1 = m0[1];
   assign m0_2 = m0[2];
   assign m0_3 = m0[3];
   assign m0_4 = m0[4];
   assign m0_5 = m0[5];
   assign m0_6 = m0[6];

   assign m1_0 = m1[0];
   assign m1_1 = m1[1];
   assign m1_2 = m1[2];
   assign m1_3 = m1[3];
   assign m1_4 = m1[4];
   assign m1_5 = m1[5];
   assign m1_6 = m1[6];

   assign s0_0 = s0[0];
   assign s0_1 = s0[1];
   assign s0_2 = s0[2];
   assign s0_3 = s0[3];
   assign s0_4 = s0[4];
   assign s0_5 = s0[5];
   assign s0_6 = s0[6];

   assign s1_0 = s1[0];
   assign s1_1 = s1[1];
   assign s1_2 = s1[2];
   assign s1_3 = s1[3];
   assign s1_4 = s1[4];
   assign s1_5 = s1[5];
   assign s1_6 = s1[6];

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
   Digital_Clock	clock(.clk(clk),
	   .Clk_1sec(clk_seconds),
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
   Digital_Clock	stopwatch(.clk(clk),
	   .Clk_1sec(clk_seconds),
	   .reset(stopwatch_reset),
	   .clock_enable(stopwatch_enable),
	   .seconds(sw_seconds),
	   .minutes(sw_minutes),
	   .hours(sw_hours),
	   .min_inc(1'b0), // is this allowed.
	   .min_dec(1'b0),
	   .hour_inc(1'b0),
	   .hour_dec(1'b0));

   // Time display
   Seg7Display		displayer(.clk(clk),
	   .reset(rst),
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
