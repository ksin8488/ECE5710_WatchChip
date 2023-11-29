module stateTb();

	
	reg clk, reset, btn_mode, btn_inc, btn_dec, btn_ts;
	wire [2:0] state;
	wire run_stopwatch, reset_stopwatch, run_time, inc_m, dec_m, inc_h, dec_h;

	watch_fsm fsm(
			.clk(clk),
			.reset(reset),
			.btn_mode(btn_mode),
			.btn_increment(btn_inc),
			.btn_decrement(btn_dec),
			.btn_time_set(btn_ts),
			.state(state),
			.run_stopwatch(run_stopwatch),
			.reset_stopwatch(reset_stopwatch),
			.run_time(run_time),
			.inc_m(inc_m),
			.dec_m(dec_m),
			.inc_h(inc_h),
			.dec_h(dec_h)
		);

	// Clock generation
	always #1000 begin
		clk = ~clk;
	end

	initial begin
		// Reset condition
		clk = 1'b0;
		btn_mode = 1'b0;
		btn_inc = 1'b0;
		btn_dec = 1'b0;
		btn_ts = 1'b0;
		reset = 1'b0;
		#2000;
		reset = 1'b1;
		#2000;
		reset = 1'b0;
		#2000;

		// Test stimuli:
		// Initial conditions:
		if(state !== fsm.S_STOPWATCH_HIDE_STOPPED) begin
			$display("ERROR: state is not S_STOPWATCH_HIDE_STOPPED at marker %d", 47);
			$stop;
		end
		if(run_stopwatch !== 1'b0) begin
			$display("ERROR: run_stopwatch is not 1'b0 at marker %d", 51);
			$stop;
		end
		if(reset_stopwatch !== 1'b0) begin
			$display("ERROR: reset_stopwatch is not 1'b0 at marker %d", 55);
			$stop;
		end
		if(run_time !== 1'b1) begin
			$display("ERROR: run_time is not 1'b1 at marker %d", 59);
			$stop;
		end
		if(inc_m !== 1'b0) begin
			$display("ERROR: inc_m is not 1'b0 at marker %d", 63);
			$stop;
		end
		if(dec_m !== 1'b0) begin
			$display("ERROR: dec_m is not 1'b0 at marker %d", 67);
			$stop;
		end
		if(inc_h !== 1'b0) begin
			$display("ERROR: inc_h is not 1'b0 at marker %d", 71);
			$stop;
		end
		if(dec_h !== 1'b0) begin
			$display("ERROR: dec_h is not 1'b0 at marker %d", 75);
			$stop;
		end

		// Press mode:
		btn_mode = 1'b1;
		#1000;
		btn_mode = 1'b0;
		#1000;
		// Should now be in S_STOPWATCH_SHOW_STOPPED
		if(state !== fsm.S_STOPWATCH_SHOW_STOPPED) begin
			$display("ERROR: state is not S_STOPWATCH_SHOW_STOPPED at marker %d", 88);
			$stop;
		end
		if(run_stopwatch !== 1'b0) begin
			$display("ERROR: run_stopwatch is not 1'b0 at marker %d", 92);
			$stop;
		end
		if(reset_stopwatch !== 1'b0) begin
			$display("ERROR: reset_stopwatch is not 1'b0 at marker %d", 96);
			$stop;
		end
		if(run_time !== 1'b1) begin
			$display("ERROR: run_time is not 1'b1 at marker %d", 97);
			$stop;
		end
		if(inc_m !== 1'b0) begin
			$display("ERROR: inc_m is not 1'b0 at marker %d", 101);
			$stop;
		end
		if(dec_m !== 1'b0) begin
			$display("ERROR: dec_m is not 1'b0 at marker %d", 105);
			$stop;
		end
		if(inc_h !== 1'b0) begin
			$display("ERROR: inc_h is not 1'b0 at marker %d", 109);
			$stop;
		end
		if(dec_h !== 1'b0) begin
			$display("ERROR: dec_h is not 1'b0 at marker %d", 113);
			$stop;
		end

		// Press btn_increment:
		btn_inc = 1'b1;
		#1000;
		btn_inc = 1'b0;
		#1000;
		// Should now be in S_STOPWATCH_SHOW_RUNNING
		if(state !== fsm.S_STOPWATCH_SHOW_RUNNING) begin
			$display("ERROR: state is not S_STOPWATCH_SHOW_RUNNING at marker %d", 123);
			$stop;
		end
		if(run_stopwatch !== 1'b1) begin
			$display("ERROR: run_stopwatch is not 1'b1 at marker %d", 127);
			$stop;
		end
		if(reset_stopwatch !== 1'b0) begin
			$display("ERROR: reset_stopwatch is not 1'b0 at marker %d", 131);
			$stop;
		end
		if(run_time !== 1'b1) begin
			$display("ERROR: run_time is not 1'b1 at marker %d", 135);
			$stop;
		end
		if(inc_m !== 1'b0) begin
			$display("ERROR: inc_m is not 1'b0 at marker %d", 139);
			$stop;
		end
		if(dec_m !== 1'b0) begin
			$display("ERROR: dec_m is not 1'b0 at marker %d", 143);
			$stop;
		end
		if(inc_h !== 1'b0) begin
			$display("ERROR: inc_h is not 1'b0 at marker %d", 147);
			$stop;
		end
		if(dec_h !== 1'b0) begin
			$display("ERROR: dec_h is not 1'b0 at marker %d", 151);
			$stop;
		end

		// Press btn_increment to get back to SHOW_STOPPED:
		btn_inc = 1'b1;
		#1000;
		btn_inc = 1'b0;
		#1000;
		// Should now be in S_STOPWATCH_SHOW_STOPPED
		if(state !== fsm.S_STOPWATCH_SHOW_STOPPED) begin
			$display("ERROR: state is not S_STOPWATCH_SHOW_STOPPED at marker %d", 161);
			$stop;
		end
		if(run_stopwatch !== 1'b0) begin
			$display("ERROR: run_stopwatch is not 1'b0 at marker %d", 165);
			$stop;
		end
		if(reset_stopwatch !== 1'b0) begin
			$display("ERROR: reset_stopwatch is not 1'b0 at marker %d", 169);
			$stop;
		end
		if(run_time !== 1'b1) begin
			$display("ERROR: run_time is not 1'b1 at marker %d", 173);
			$stop;
		end
		if({inc_m, dec_m, inc_h, dec_h} !== 4'b0) begin
			$display("ERROR: inc/dec is not 4'b0 at marker %d", 177);
			$stop;
		end

		// Now reset the timer:
		btn_dec = 1'b1;
		#1000;
		btn_dec = 1'b0;
		#1000;
		// Should have seen a reset signal go high, might've been during the #1000 though?
		// Do some verification.
		if(reset_stopwatch !== 1'b1) begin
			$display("ERROR: reset_stopwatch is not 1'b1 at marker %d", 188);
			$stop;
		end
		if(state !== fsm.S_STOPWATCH_RESET) begin
			$display("ERROR: state is not S_STOPWATCH_RESET at marker %d", 192);
			$stop;
		end
		if(run_stopwatch !== 1'b0) begin
			$display("ERROR: run_stopwatch is not 1'b0 at marker %d", 196);
			$stop;
		end
		if(run_time !== 1'b1) begin
			$display("ERROR: run_time is not 1'b1 at marker %d", 200);
			$stop;
		end
		if({inc_m, dec_m, inc_h, dec_h} !== 4'b0) begin
			$display("ERROR: inc/dec is not 4'b0 at marker %d", 204);
			$stop;
		end

		// Wait a clock cycle for reset to finish:
		#1000;

		// Should now be back in S_STOPWATCH_SHOW_STOPPED.
		// Start it again with btn_increment:
		btn_inc = 1'b1;
		#2000;
		btn_inc = 1'b0;
		#1000;
		// Should now be in S_STOPWATCH_SHOW_RUNNING
		if(state !== fsm.S_STOPWATCH_SHOW_RUNNING) begin
			$display("ERROR: state is not S_STOPWATCH_SHOW_RUNNING at marker %d", 215);
			$stop;
		end
		if(run_stopwatch !== 1'b1) begin
			$display("ERROR: run_stopwatch is not 1'b1 at marker %d", 219);
			$stop;
		end
		if(reset_stopwatch !== 1'b0) begin
			$display("ERROR: reset_stopwatch is not 1'b0 at marker %d", 223);
			$stop;
		end
		if(run_time !== 1'b1) begin
			$display("ERROR: run_time is not 1'b1 at marker %d", 227);
			$stop;
		end
		if({inc_m, dec_m, inc_h, dec_h} !== 4'b0) begin
			$display("ERROR: inc/dec is not 4'b0 at marker %d", 231);
			$stop;
		end

		// Go to S_STOPWATCH_HIDE_RUNNING:
		btn_mode = 1'b1;
		#1000;
		btn_mode = 1'b0;
		#1000;
		// Should now be in S_STOPWATCH_HIDE_RUNNING
		if(state !== fsm.S_STOPWATCH_HIDE_RUNNING) begin
			$display("ERROR: state is not S_STOPWATCH_HIDE_RUNNING at marker %d", 241);
			$stop;
		end
		if(run_stopwatch !== 1'b1) begin
			$display("ERROR: run_stopwatch is not 1'b1 at marker %d", 245);
			$stop;
		end
		if(reset_stopwatch !== 1'b0) begin
			$display("ERROR: reset_stopwatch is not 1'b0 at marker %d", 249);
			$stop;
		end
		if(run_time !== 1'b1) begin
			$display("ERROR: run_time is not 1'b1 at marker %d", 253);
			$stop;
		end
		if({inc_m, dec_m, inc_h, dec_h} !== 4'b0) begin
			$display("ERROR: inc/dec is not 4'b0 at marker %d", 257);
			$stop;
		end

		// Go to S_SET_H:
		btn_ts = 1'b1;
		#1000;
		btn_ts = 1'b0;
		#1000;
		// Should now be in S_SET_H
		if(state !== fsm.S_SET_H) begin
			$display("ERROR: state is not S_SET_H at marker %d", 267);
			$stop;
		end
		if(run_stopwatch !== 1'b1) begin
			$display("ERROR: run_stopwatch is not 1'b1 at marker %d", 271);
			$stop;
		end
		if(reset_stopwatch !== 1'b0) begin
			$display("ERROR: reset_stopwatch is not 1'b0 at marker %d", 275);
			$stop;
		end
		if(run_time !== 1'b0) begin
			$display("ERROR: run_time is not 1'b0 at marker %d", 279);
			$stop;
		end
		if({inc_m, dec_m, inc_h, dec_h} !== 4'b0) begin
			$display("ERROR: inc/dec is not 4'b0 at marker %d", 283);
			$stop;
		end

		// Test each button:
		btn_inc = 1'b1;
		#1000;
		if(inc_h !== 1'b1) begin
			$display("ERROR: inc_h is not 1'b1 at marker %d", 290);
			$stop;
		end
		btn_inc = 1'b0;
		#1000;

		btn_dec = 1'b1;
		#1000;
		if(dec_h !== 1'b1) begin
			$display("ERROR: dec_h is not 1'b1 at marker %d", 298);
			$stop;
		end
		btn_dec = 1'b0;

		// Go into next mode
		btn_ts = 1'b1;
		#2000;
		btn_ts = 1'b0;
		#1000;
		// Should now be in S_SET_M
		if(state !== fsm.S_SET_M) begin
			$display("ERROR: state is not S_SET_M at marker %d", 309);
			$stop;
		end
		if(run_stopwatch !== 1'b1) begin
			$display("ERROR: run_stopwatch is not 1'b1 at marker %d", 313);
			$stop;
		end
		if(reset_stopwatch !== 1'b0) begin
			$display("ERROR: reset_stopwatch is not 1'b0 at marker %d", 317);
			$stop;
		end
		if(run_time !== 1'b0) begin
			$display("ERROR: run_time is not 1'b0 at marker %d", 321);
			$stop;
		end
		if({inc_m, dec_m, inc_h, dec_h} !== 4'b0) begin
			$display("ERROR: inc/dec is not 4'b0 at marker %d", 325);
			$stop;
		end

		// Test buttons again
		btn_inc = 1'b1;
		#1000;
		if(inc_m !== 1'b1) begin
			$display("ERROR: inc_m is not 1'b1 at marker %d", 332);
			$stop;
		end
		btn_inc = 1'b0;
		#1000;
		btn_dec = 1'b1;
		#1000;
		if(dec_m !== 1'b1) begin
			$display("ERROR: dec_m is not 1'b1 at marker %d", 339);
			$stop;
		end
		btn_dec = 1'b0;
		
		$display("All tests passed!");
		$stop;
	end
endmodule
