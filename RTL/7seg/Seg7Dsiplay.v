/**
 * @brief 7Segment Display module with BCD logic for LED Cathode display
 *
 * @author Kashish Singh
 * @date 11/8/2023
 */
module Seg7Display(clk, reset, seconds_clk, state,
current_s, current_m, current_h, stopwatch_s, stopwatch_m, stopwatch_h,
display_s1, display_m1, display_h1, display_s2, display_m2, display_h2, second);

	input clk;
	input seconds_clk;
	input reset;
	input [2:0] state; //states given by watch_fsm for which "mode" the watch is in
	input [5:0] current_s; //24-hr clock so need 24dec digits which uses 6-bits
	input [5:0] current_m; //6-bit for 0-63 values as well as 2digit BCD conversion
	input [5:0] current_h;
	input [5:0] stopwatch_s;
	input [5:0] stopwatch_m;
	input [5:0] stopwatch_h;
	output reg [6:0] display_s1; //7-segment display output reg (1 is first digit, 2 is second digit) 00:00:00
	output reg [6:0] display_m1;
	output reg [6:0] display_h1;
	output reg [6:0] display_s2;
	output reg [6:0] display_m2;
	output reg [6:0] display_h2;
	output second; //MAY REMOVE! for blinking : ?
	
	//---Registers for internal use---
	//BCD values stored
	reg [7:0] bcdCurrSec;
	reg [7:0] bcdCurrMin;
	reg [7:0] bcdCurrHour;
	reg [7:0] bcdStopSec;
	reg [7:0] bcdStopMin;
	reg [7:0] bcdStopHour;
	//Seven-Segment values stored
	//Current
	reg[6:0] segCurrSec1;
	reg[6:0]	segCurrSec2;
	reg[6:0] segCurrMin1;
	reg[6:0]	segCurrMin2;
	reg[6:0]	segCurrHour1;
	reg[6:0]	segCurrHour2;
	//Stopwatch
	reg[6:0] segStopSec1;
	reg[6:0]	segStopSec2;
	reg[6:0] segStopMin1;
	reg[6:0]	segStopMin2;
	reg[6:0]	segStopHour1;
	reg[6:0]	segStopHour2;
	
	//---Parameters for different State settings from watch_fsm module output---
	parameter S_STOPWATCH_HIDE_STOPPED	= 3'b000; //Stopwatch is stopped and hidden from view
	parameter S_SET_H							= 3'b001; //Time-setting mode where user can set the hour
	parameter S_SET_M							= 3'b010; //Time-setting mode where minute is set
	parameter S_STOPWATCH_SHOW_STOPPED	= 3'b011; //Show the stopwatch which has stopped and isn't running
	parameter S_STOPWATCH_SHOW_RUNNING	= 3'b100; //Show stopwatch, no blinking?
	parameter S_STOPWATCH_RESET			= 3'b101; //Show stopwatch, time reset?
	parameter S_STOPWATCH_HIDE_RUNNING	= 3'b110; //Show current time and stopwatch is still running in background
		
	//---Module Instantiations---
	//BCD re-evaluates through always@(bin) statement in binToBCD module
	//Current Face binToBCD modules
	binToBCD bcdCurrS(
	.bin (current_s),
	.BCD (bcdCurrSec)
	);
	
	binToBCD bcdCurrM(
	.bin (current_m),
	.BCD (bcdCurrMin)
	);
	
	binToBCD bcdCurrH(
	.bin (current_h),
	.BCD (bcdCurrHour)
	);
	
	//Stopwatch binToBCD modules
	binToBCD bcdStopS(
	.bin (stopwatch_s),
	.BCD (bcdStopSec)
	);
	
	binToBCD bcdStopM(
	.bin (stopwatch_m),
	.BCD (bcdStopMin)
	);
	
	binToBCD bcdStopH(
	.bin (stopwatch_h),
	.BCD (bcdStopHour)
	);
	
	//BCD to 7Seg binary modules
	//Current Face modules
	bcdToSeg7 bToS_CurrSec(
	.bcd (bcdCurrSec),
	.seg7OnesOut (segCurrSec1),
	.seg7TensOut (segCurrSec2)
	);
	
	bcdToSeg7 bToS_CurrMin(
	.bcd (bcdCurrMin),
	.seg7OnesOut (segCurrMin1),
	.seg7TensOut (segCurrMin2)
	);

	bcdToSeg7 bToS_CurrHour(
	.bcd (bcdCurrHour),
	.seg7OnesOut (segCurrHour1),
	.seg7TensOut (segCurrHour2)
	);

	//Stopwatch
	bcdToSeg7 bToS_StopSec(
	.bcd (bcdCurrSec),
	.seg7OnesOut (segStopSec1),
	.seg7TensOut (segStopSec2)
	);

	bcdToSeg7 bToS_StopMin(
	.bcd (bcdCurrSec),
	.seg7OnesOut (segStopMin1),
	.seg7TensOut (segStopMin2)
	);

	bcdToSeg7 bToS_StopHour(
	.bcd (bcdCurrSec),
	.seg7OnesOut (segStopHour1),
	.seg7TensOut (segStopHour2)
	);
	
	reg enable_7seg;
	reg last_seconds_clk;
	always@(posedge clk or posedge reset)
	begin
		if(reset) begin
			enable_7seg <= 1'b1;
		end
		else begin

			// Toggle enable_7seg on posedge seconds_clk, for blinking display
			// as needed at 1Hz 
			if(seconds_clk !== last_seconds_clk) begin
				if(seconds_clk == 1'b1) begin
					enable_7seg <= ~enable_7seg;
				end
				last_seconds_clk <= seconds_clk;
			end
			case(state)
				S_STOPWATCH_HIDE_STOPPED: begin //Shows the current time
					display_s1 <= segCurrSec1;
					display_s2 <= segCurrSec1;
					display_m1 <= segCurrMin1;
					display_m2 <= segCurrMin2;
					display_h1 <= segCurrHour1;
					display_h2 <= segCurrHour2;
				end
				
				S_SET_M: begin	//Shows current time, blink minutes 
					display_s1 <= segCurrSec1;
					display_s2 <= segCurrSec1;
					display_h1 <= segCurrHour1;
					display_h2 <= segCurrHour2;
					if(enable_7_seg) begin
						display_m1 <= segCurrMin1;
						display_m2 <= segCurrMin2;
					end
					else begin
						display_m1 <= 7'b0;
						display_m2 <= 7'b0;
					end
				end

				S_SET_H: begin	//Shows current time, blink hours
					display_s1 <= segCurrSec1;
					display_s2 <= segCurrSec1;
					display_m1 <= segCurrMin1;
					display_m2 <= segCurrMin2;
					if(enable_7_seg) begin
						display_h1 <= segCurrHour1;
						display_h2 <= segCurrHour2;
					end
					else begin
						display_h1 <= 7'b0;
						display_h2 <= 7'b0;
					end
				end
				
				S_STOPWATCH_SHOW_STOPPED: begin //Shows stopwatch time, blink it all
					if(enable_7_seg) begin
						display_s1 <= segStopSec1;
						display_s2 <= segStopSec1;
						display_m1 <= segStopMin1;
						display_m2 <= segStopMin2;
						display_h1 <= segStopHour1;
						display_h2 <= segStopHour2;
					end
					else begin
						display_s1 <= 7'b0;
						display_s2 <= 7'b0;
						display_m1 <= 7'b0;
						display_m2 <= 7'b0;
						display_h1 <= 7'b0;
						display_h2 <= 7'b0;
					end
				end
				
				S_STOPWATCH_SHOW_RUNNING: begin //shows stopwatch time, no blink
					display_s1 <= segStopSec1;
					display_s2 <= segStopSec1;
					display_m1 <= segStopMin1;
					display_m2 <= segStopMin2;
					display_h1 <= segStopHour1;
					display_h2 <= segStopHour2;
				end
				
				S_STOPWATCH_RESET: begin //shows stopwatch time
					display_s1 <= segStopSec1;
					display_s2 <= segStopSec1;
					display_m1 <= segStopMin1;
					display_m2 <= segStopMin2;
					display_h1 <= segStopHour1;
					display_h2 <= segStopHour2;
				end
				
				S_STOPWATCH_HIDE_RUNNING: begin //shows current time, no blink
					display_s1 <= segCurrSec1;
					display_s2 <= segCurrSec1;
					display_m1 <= segCurrMin1;
					display_m2 <= segCurrMin2;
					display_h1 <= segCurrHour1;
					display_h2 <= segCurrHour2;
				end
				
				default: begin //All outputs set to 0 for default case
					display_s1 <= 0;
					display_s2 <= 0;
					display_m1 <= 0;
					display_m2 <= 0;
					display_h1 <= 0;
					display_h2 <= 0;
				end
			endcase
	end
			
	end
endmodule
