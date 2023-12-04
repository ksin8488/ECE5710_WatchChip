/*
 * Wristwatch chip state controller.
 * 
 * University of Utah VLSI project, Fall 2023
 * 
 * State controller:
 * input clk
 * input reset
 * input btn_mode
 * input btn_time_set
 * input btn_increment
 * input btn_decrement
 * output [2:0] state
 * output run_stopwatch 
 * output reset_stopwatch
 * output run_time
 * output inc_m
 * output dec_m
 * output inc_h
 * output dec_h
 *
 * @author Ella Moss
 * @date 2023-11-10
 */

 module watch_fsm(
	input clk,
	input reset,
	input btn_mode,
	input btn_increment,
	input btn_decrement,
	input btn_time_set,
	output reg [2:0] state, // 7seg controller needs this
	output run_stopwatch,
	output reg reset_stopwatch,
	output reg run_time,
	output reg inc_m,
	output reg dec_m,
	output reg inc_h,
	output reg dec_h
);

// State definitions:
parameter S_STOPWATCH_HIDE_STOPPED	= 3'b000;
parameter S_SET_H					= 3'b001;
parameter S_SET_M					= 3'b010;
parameter S_STOPWATCH_SHOW_STOPPED	= 3'b011;
parameter S_STOPWATCH_SHOW_RUNNING	= 3'b100;
parameter S_STOPWATCH_RESET			= 3'b101;
parameter S_STOPWATCH_HIDE_RUNNING	= 3'b110;

// Next-state logic
reg [2:0] next_state;
always @(posedge clk) begin
	case (state)
		S_STOPWATCH_HIDE_STOPPED: begin
			if(btn_mode) next_state <= S_STOPWATCH_SHOW_STOPPED;
			else if(btn_time_set) next_state <= S_SET_H;
			else next_state <= S_STOPWATCH_HIDE_STOPPED;
		end
		S_SET_H: begin
			if(btn_time_set) next_state <= S_SET_M;
			else next_state <= S_SET_H;
		end
		S_SET_M: begin
			if(btn_time_set) begin
				if(run_stopwatch == 1'b1)
					next_state <= S_STOPWATCH_HIDE_RUNNING;
				else
					next_state <= S_STOPWATCH_HIDE_STOPPED;
			end
			else next_state <= S_SET_M;
		end
		S_STOPWATCH_SHOW_STOPPED: begin
			if(btn_increment) next_state <= S_STOPWATCH_SHOW_RUNNING; //start stopwatch
			else if(btn_decrement) next_state <= S_STOPWATCH_RESET;
			else if(btn_mode) next_state <= S_STOPWATCH_HIDE_STOPPED; //hide stopped stopwatch
			else next_state <= S_STOPWATCH_SHOW_STOPPED;
		end
		S_STOPWATCH_SHOW_RUNNING: begin
			if(btn_increment) next_state <= S_STOPWATCH_SHOW_STOPPED;
			else if(btn_mode) next_state <= S_STOPWATCH_HIDE_RUNNING;
			else if(btn_decrement) next_state <= S_STOPWATCH_RESET;
			else next_state <= S_STOPWATCH_SHOW_RUNNING;
		end
		S_STOPWATCH_RESET: begin
			next_state <= S_STOPWATCH_SHOW_STOPPED;
		end
		S_STOPWATCH_HIDE_RUNNING: begin
			if(btn_mode) next_state <= S_STOPWATCH_SHOW_RUNNING;
			else if(btn_time_set) next_state <= S_SET_H;
			else next_state <= S_STOPWATCH_HIDE_RUNNING;
		end
		default: next_state <= S_STOPWATCH_HIDE_STOPPED;
	endcase
end

reg change_sw, next_run_sw;
FlipFlop	swFF(.clk(clk),
	.en(change_sw),
	.D(next_run_sw),
	.Q(run_stopwatch));
// Combinational output logic
always @(*) begin
	case (state)
		S_STOPWATCH_HIDE_STOPPED: begin
			next_run_sw <= 1'b0;
			change_sw <= 1'b1;
			run_time <= 1'b1;

			inc_m <= 1'b0;
			dec_m <= 1'b0;
			inc_h <= 1'b0;
			dec_h <= 1'b0;
			reset_stopwatch <= 1'b0;
		end
		S_SET_H: begin
			// NOTE: irl you should debounce and slow these buttons, probably fine for our purposes though
			inc_h <= btn_increment;
			dec_h <= btn_decrement;
			run_time <= 1'b0;

			next_run_sw <= 1'b0; //technically don't care, just don't want to synth any latches
			change_sw <= 1'b0; //FF isn't transparent
			inc_m <= 1'b0;
			dec_m <= 1'b0;
			reset_stopwatch <= 1'b0;
		end
		S_SET_M: begin
			inc_m <= btn_increment;
			dec_m <= btn_decrement;
			run_time <= 1'b0;

			next_run_sw <= 1'b0; //technically don't care, just don't want to synth any latches
			change_sw <= 1'b0; //FF isn't transparent
			inc_h <= 1'b0;
			dec_h <= 1'b0;
			reset_stopwatch <= 1'b0;
		end
		S_STOPWATCH_SHOW_STOPPED: begin
			next_run_sw <= 1'b0;
			change_sw <= 1'b1;

			run_time <= 1'b1;
			inc_m <= 1'b0;
			dec_m <= 1'b0;
			inc_h <= 1'b0;
			dec_h <= 1'b0;
			reset_stopwatch <= 1'b0;
		end
		S_STOPWATCH_SHOW_RUNNING: begin
			next_run_sw <= 1'b1;
			change_sw <= 1'b1;

			run_time <= 1'b1;
			inc_m <= 1'b0;
			dec_m <= 1'b0;
			inc_h <= 1'b0;
			dec_h <= 1'b0;
			reset_stopwatch <= 1'b0;
		end
		S_STOPWATCH_RESET: begin
			reset_stopwatch <= 1'b1;

			next_run_sw <= 1'b0;
			change_sw <= 1'b1;
			run_time <= 1'b1;
			inc_m <= 1'b0;
			dec_m <= 1'b0;
			inc_h <= 1'b0;
			dec_h <= 1'b0;
		end
		S_STOPWATCH_HIDE_RUNNING: begin
			next_run_sw <= 1'b1;
			change_sw <= 1'b1;
			run_time <= 1'b1;
			reset_stopwatch <= 1'b0;
			inc_m <= 1'b0;
			dec_m <= 1'b0;
			inc_h <= 1'b0;
			dec_h <= 1'b0;
		end
		default: begin
			next_run_sw <= 1'b0;
			change_sw <= 1'b1;
			run_time <= 1'b1;
			reset_stopwatch <= 1'b0;
			inc_m <= 1'b0;
			dec_m <= 1'b0;
			inc_h <= 1'b0;
			dec_h <= 1'b0;
		end
	endcase
end

// Sequential state logic
always @(posedge clk) begin
	if (reset) begin
		state <= S_STOPWATCH_HIDE_STOPPED;
	end 
	else state <= next_state;
end

endmodule

module FlipFlop(input clk,
	input D,
	input en,
	output reg Q);

	always@(posedge clk) begin
		if(en) Q <= D;
		else Q <= Q;
	end
endmodule
