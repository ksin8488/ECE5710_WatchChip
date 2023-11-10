`timescale 1s/1s
module Seg7Display_tb();

	reg reset;
	reg [2:0] state; //states given by watch_fsm for which "mode" the watch is in
	reg [5:0] current_s; //24-hr clock so need 24dec digits which uses 6-bits
	reg [5:0] current_m; //6-bit for 0-63 values as well as 2digit BCD conversion
	reg [5:0] current_h;
	reg [5:0] stopwatch_s;
	reg [5:0] stopwatch_m;
	reg [5:0] stopwatch_h;
	wire [6:0] display_s1; //7-segment display wire (1 is first digit, 2 is second digit) 00:00:00
	wire [6:0] display_m1;
	wire [6:0] display_h1;
	wire [6:0] display_s2;
	wire [6:0] display_m2;
	wire [6:0] display_h2;
	wire second; //MAY REMOVE! for blinking : ?

	integer i, j, k, l;
	
	Seg7Display dut(
		.state(state),
		.current_s(current_s),
		.current_m(current_m),
		.current_h(current_h),
		.stopwatch_s(stopwatch_s),
		.stopwatch_m(stopwatch_m),
		.stopwatch_h(stopwatch_h),
		.display_s1(display_s1),
		.display_s2(display_s2),
		.display_m1(display_m1),
		.display_h1(display_h1),
		.display_h2(display_h2),
		.second(second)
	);
	
	initial begin
		for(i=0; i < 25; i=i+1) begin //0-24 for a 24-hour clock
			for(j=0; j < 60; j=j+1) begin //0-59 for minutes on a clock
				for(k=0; k < 60; k=k+1) begin //0-59 for seconds on a clock
					for(l=0; k < 7; l=l+1) begin //The 6 different states of the WristWatch
						state = l;
						current_s = k;
						current_m = j;
						current_h = i;
						stopwatch_s = k;
						stopwatch_m = j;
						stopwatch_h = i;
						#10
						
						$display("state%d", "current_s%b", "current_m%b", "current_h%b",
							"stopwatch_s%b", "stopwatch_m%b", "stopwatch_h%b", state, 
							current_s, current_m, current_h, stopwatch_s, stopwatch_m,
							stopwatch_h);
					end
				end
			end
		end
	end
endmodule
