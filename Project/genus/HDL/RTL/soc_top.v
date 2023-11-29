module soc_top (

	input clk,
	input reset,

	input btn_mode,
	input btn_set,
	input btn_inc,
	input btn_dec,
	input btn_light,

	output h1_6,
	output h1_5,
	output h1_4,
	output h1_3,
	output h1_2,
	output h1_1,
	output h1_0,

	output h0_6,
	output h0_5,
	output h0_4,
	output h0_3,
	output h0_2,
	output h0_1,
	output h0_0,

	output m1_6,
	output m1_5,
	output m1_4,
	output m1_3,
	output m1_2,
	output m1_1,
	output m1_0,

	output m0_6,
	output m0_5,
	output m0_4,
	output m0_3,
	output m0_2,
	output m0_1,
	output m0_0,

	output s1_6,
	output s1_5,
	output s1_4,
	output s1_3,
	output s1_2,
	output s1_1,
	output s1_0,

	output s0_6,
	output s0_5,
	output s0_4,
	output s0_3,
	output s0_2,
	output s0_1,
	output s0_0,

	output colon,
	output light);

pad_in clk_pad    (.pad(clk),    .DataIn(clk_PAD));
pad_in reset_pad  (.pad(reset),  .DataIn(reset_PAD));

pad_in btn_mode_pad  (.pad(btn_mode),  .DataIn(btn_mode_PAD));
pad_in btn_set_pad   (.pad(btn_set),   .DataIn(btn_set_PAD));
pad_in btn_inc_pad   (.pad(btn_inc),   .DataIn(btn_inc_PAD));
pad_in btn_dec_pad   (.pad(btn_dec),   .DataIn(btn_dec_PAD));
pad_in btn_light_pad (.pad(btn_light), .DataIn(btn_light_PAD));

pad_out h1_pad_0 (.pad(h1_0), .DataOut(h1_PAD_0));
pad_out h1_pad_1 (.pad(h1_1), .DataOut(h1_PAD_1));
pad_out h1_pad_2 (.pad(h1_2), .DataOut(h1_PAD_2));
pad_out h1_pad_3 (.pad(h1_3), .DataOut(h1_PAD_3));
pad_out h1_pad_4 (.pad(h1_4), .DataOut(h1_PAD_4));
pad_out h1_pad_5 (.pad(h1_5), .DataOut(h1_PAD_5));
pad_out h1_pad_6 (.pad(h1_6), .DataOut(h1_PAD_6));

pad_out h0_pad_0 (.pad(h0_0), .DataOut(h0_PAD_0));
pad_out h0_pad_1 (.pad(h0_1), .DataOut(h0_PAD_1));
pad_out h0_pad_2 (.pad(h0_2), .DataOut(h0_PAD_2));
pad_out h0_pad_3 (.pad(h0_3), .DataOut(h0_PAD_3));
pad_out h0_pad_4 (.pad(h0_4), .DataOut(h0_PAD_4));
pad_out h0_pad_5 (.pad(h0_5), .DataOut(h0_PAD_5));
pad_out h0_pad_6 (.pad(h0_6), .DataOut(h0_PAD_6));

pad_out m1_pad_0 (.pad(m1_0), .DataOut(m1_PAD_0));
pad_out m1_pad_1 (.pad(m1_1), .DataOut(m1_PAD_1));
pad_out m1_pad_2 (.pad(m1_2), .DataOut(m1_PAD_2));
pad_out m1_pad_3 (.pad(m1_3), .DataOut(m1_PAD_3));
pad_out m1_pad_4 (.pad(m1_4), .DataOut(m1_PAD_4));
pad_out m1_pad_5 (.pad(m1_5), .DataOut(m1_PAD_5));
pad_out m1_pad_6 (.pad(m1_6), .DataOut(m1_PAD_6));

pad_out m0_pad_0 (.pad(m0_0), .DataOut(m0_PAD_0));
pad_out m0_pad_1 (.pad(m0_1), .DataOut(m0_PAD_1));
pad_out m0_pad_2 (.pad(m0_2), .DataOut(m0_PAD_2));
pad_out m0_pad_3 (.pad(m0_3), .DataOut(m0_PAD_3));
pad_out m0_pad_4 (.pad(m0_4), .DataOut(m0_PAD_4));
pad_out m0_pad_5 (.pad(m0_5), .DataOut(m0_PAD_5));
pad_out m0_pad_6 (.pad(m0_6), .DataOut(m0_PAD_6));

pad_out s1_pad_0 (.pad(s1_0), .DataOut(s1_PAD_0));
pad_out s1_pad_1 (.pad(s1_1), .DataOut(s1_PAD_1));
pad_out s1_pad_2 (.pad(s1_2), .DataOut(s1_PAD_2));
pad_out s1_pad_3 (.pad(s1_3), .DataOut(s1_PAD_3));
pad_out s1_pad_4 (.pad(s1_4), .DataOut(s1_PAD_4));
pad_out s1_pad_5 (.pad(s1_5), .DataOut(s1_PAD_5));
pad_out s1_pad_6 (.pad(s1_6), .DataOut(s1_PAD_6));

pad_out s0_pad_0 (.pad(s0_0), .DataOut(s0_PAD_0));
pad_out s0_pad_1 (.pad(s0_1), .DataOut(s0_PAD_1));
pad_out s0_pad_2 (.pad(s0_2), .DataOut(s0_PAD_2));
pad_out s0_pad_3 (.pad(s0_3), .DataOut(s0_PAD_3));
pad_out s0_pad_4 (.pad(s0_4), .DataOut(s0_PAD_4));
pad_out s0_pad_5 (.pad(s0_5), .DataOut(s0_PAD_5));
pad_out s0_pad_6 (.pad(s0_6), .DataOut(s0_PAD_6));

pad_out colon_pad (.pad(colon), .DataOut(colon_PAD));
pad_out light_pad (.pad(light), .DataOut(light_PAD));

WatchChip	chip(.clk(clk_PAD), 
	.rst(reset_PAD), 
	.btn_mode(btn_mode_PAD),
	.btn_set(btn_set_PAD),
	.btn_inc(btn_inc_PAD),
	.btn_dec(btn_dec_PAD),
	.btn_light(btn_light_PAD),

	.h1_6(h1_PAD_6),
	.h1_5(h1_PAD_5),
	.h1_4(h1_PAD_4),
	.h1_3(h1_PAD_3),
	.h1_2(h1_PAD_2),
	.h1_1(h1_PAD_1),
	.h1_0(h1_PAD_0),
	.h0_6(h0_PAD_6),
	.h0_5(h0_PAD_5),
	.h0_4(h0_PAD_4),
	.h0_3(h0_PAD_3),
	.h0_2(h0_PAD_2),
	.h0_1(h0_PAD_1),
	.h0_0(h0_PAD_0),
	.m1_6(m1_PAD_6),
	.m1_5(m1_PAD_5),
	.m1_4(m1_PAD_4),
	.m1_3(m1_PAD_3),
	.m1_2(m1_PAD_2),
	.m1_1(m1_PAD_1),
	.m1_0(m1_PAD_0),
	.m0_6(m0_PAD_6),
	.m0_5(m0_PAD_5),
	.m0_4(m0_PAD_4),
	.m0_3(m0_PAD_3),
	.m0_2(m0_PAD_2),
	.m0_1(m0_PAD_1),
	.m0_0(m0_PAD_0),
	.s1_6(s1_PAD_6),
	.s1_5(s1_PAD_5),
	.s1_4(s1_PAD_4),
	.s1_3(s1_PAD_3),
	.s1_2(s1_PAD_2),
	.s1_1(s1_PAD_1),
	.s1_0(s1_PAD_0),
	.s0_6(s0_PAD_6),
	.s0_5(s0_PAD_5),
	.s0_4(s0_PAD_4),
	.s0_3(s0_PAD_3),
	.s0_2(s0_PAD_2),
	.s0_1(s0_PAD_1),
	.s0_0(s0_PAD_0),
	
	.colon(colon_PAD),
	.light(light_PAD));


endmodule
