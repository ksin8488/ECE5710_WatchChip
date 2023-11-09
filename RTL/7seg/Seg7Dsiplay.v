/**
 * @brief 7Segment Display module with BCD logic for LED Cathode display
 *
 * @author Kashish Singh
 * @date 11/8/2023
 */
module Seg7Display(clk, seconds_clk, state,
current_s, current_m, current_h, stopwatch_s, stopwatch_m, stopwatch_h,
display_s1, display_m1, display_h1, display_s2, display_m2, display_h2, second);

	input clk;
	input seconds_clk;
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
	
	reg [7:0] bcdSec;
	reg [7:0] bcdMin;
	reg [7:0] bcdHour;
	
	//Parameters for different State settings from watch_fsm module output
	parameter S_STOPWATCH_HIDE_STOPPED	= 3'b000; //Stopwatch is stopped and hidden from view
	parameter S_SET_H							= 3'b001; //Time-setting mode where user can set the hour
	parameter S_SET_M							= 3'b010; //Time-setting mode where minute is set
	parameter S_STOPWATCH_SHOW_STOPPED	= 3'b011; //Show the stopwatch which has stopped and isn't running
	parameter S_STOPWATCH_SHOW_RUNNING	= 3'b100; //Show stopwatch, no blinking?
	parameter S_STOPWATCH_RESET			= 3'b101; //Show stopwatch, time reset?
	parameter S_STOPWATCH_HIDE_RUNNING	= 3'b110; //Show current time and stopwatch is still running in background
	
	//For whenever the state changes
//	always@(state)
//	begin
//		
//	end

		//BCD re-evaluates through always@(bin) statement in binToBCD module
		//Current Face binToBCD modules
		binToBCD bcdCurrS(
		.bin (current_s),
		.BCD (bcdSec)
		);
		
		binToBCD bcdCurrM(
		.bin (current_m),
		.BCD (bcdMin)
		);
		
		binToBCD bcdCurrH(
		.bin (current_h),
		.BCD (bcdHour)
		);
		
		//Stopwatch binToBCD modules
		binToBCD bcdStopS(
		.bin (stopwatch_s),
		.BCD (bcdSec)
		);
		
		binToBCD bcdStopM(
		.bin (stopwatch_m),
		.BCD (bcdMin)
		);
		
		binToBCD bcdStopH(
		.bin (stopwatch_h),
		.BCD (bcdHour)
		);
	
	//NOT FINAL CODE! Just some basic outlines and plenty of spagetti...
	always@(posedge clk)
	begin
		
		//https://www.fpga4student.com/2017/09/seven-segment-led-display-controller-basys3-fpga.htm
//		case(bcdSec[3:0])
//			//seven-segment cathode display
//			4'b0000 : begin display_s1 = 7'b0000001; end
//			4'b0001 : begin display_s1 = 7'b0110000; end
//			4'b0010 : begin display_s1 = 7'b1101101; end
//			4'b0011 : begin display_s1 = 7'b1111001; end
//			4'b0100 : begin display_s1 = 7'b0110011; end
//			4'b0101 : begin display_s1 = 7'b1011011; end
//			4'b0110 : begin display_s1 = 7'b1011111; end
//			4'b0111 : begin display_s1 = 7'b1110000; end
//			4'b1000 : begin display_s1 = 7'b1111111; end
//			4'b1001 : begin display_s1 = 7'b1111011; end
//			default : begin display_s1 = 7'b0000000; end
//		endcase
//		
//		case(bcdSec[7:4])
//			4'b0000 : begin display_s2 = 7'b0000001; end
//			4'b0001 : begin display_s2 = 7'b0000001; end
//			4'b0010 : begin display_s2 = 7'b0000001; end
//			4'b0011 : begin display_s2 = 7'b0000001; end
//			4'b0100 : begin display_s2 = 7'b0000001; end
//			4'b0101 : begin display_s2 = 7'b0000001; end
//			4'b0110 : begin display_s2 = 7'b0000001; end
//			4'b0111 : begin display_s2 = 7'b0000001; end
//			4'b1000 : begin display_s2 = 7'b0000001; end
//			4'b1001 : begin display_s2 = 7'b0000001; end
//			default : begin display_s2 = 7'b0000000; end
//		endcase
			
	end
endmodule


//Here's an idea of how I would do things.
//S_STOPWATCH_HIDE_STOPPED: in this state, the stopwatch is stopped and hidden. So you'll need to display the current time on the watch face, as normal - set digits to current_s/m/h.
//S_SET_H: Ideally we'll need some way to communicate to the user that it's in time-setting mode. Still set digits to current_s/m/h, but also think about blinking the HH digits. You can do this with seconds_clk, just alternate between the digit and 7'b0 on each posedge seconds_clk. Let me know if you have questions about how to implement that, ChatGPT may be able to get you started too but it's been down for me lately.
//S_SET_M: same idea different digits
//S_STOPWATCH_SHOW_STOPPED: show stopwatch in this state, maybe blink it here too so the user knows it's stopped?
//S_STOPWATCH_SHOW_RUNNING: show stopwatch, no blink
//S_STOPWATCH_RESET: show stopwatch
//S_STOPWATCH_HIDE_RUNNING: show current time
