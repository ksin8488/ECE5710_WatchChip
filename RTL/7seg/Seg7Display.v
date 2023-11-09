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
	input [2:0] state; //TODO: Work out which state to use H/M/S for timer switching
	input [5:0] current_s; //24-hr clock so need 24dec digits which uses 6-bits
	input [5:0] current_m; //6-bit for 0-63 values as well as 2digit BCD conversion
	input [5:0] current_h;
	input [5:0] stopwatch_s;
	input [5:0] stopwatch_m;
	input [5:0] stopwatch_h;
	output reg [7:0] display_s1; //7-segment display output reg (1 is first digit, 2 is second digit) 00:00:00
	output reg [7:0] display_m1;
	output reg [7:0] display_h1;
	output reg [7:0] display_s2;
	output reg [7:0] display_m2;
	output reg [7:0] display_h2;
	output second; //MAY REMOVE! for blinking :
	
	wire [7:0] bcdSec;
	wire [7:0] bcdMin;
	wire [7:0] bcdHour;
	
	//For whenever the state changes
//	always@(state)
//	begin
//		
//	end

		//NOTE: every time any timer is updates the BCD needs to re-evaluate. But can't instantiate inside an always block
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
	
	//NOT FINAL CODE! Just some basic outlines and plenty of spaghetti...
	always@(posedge clk)
	begin
		
		//https://www.fpga4student.com/2017/09/seven-segment-led-display-controller-basys3-fpga.htm
		case(bcdSec[3:0])
			//seven-segment cathode display
			4'b0000 : begin display_s1 = 7'b0000001; end
			4'b0001 : begin display_s1 = 7'b0110000; end
			4'b0010 : begin display_s1 = 7'b1101101; end
			4'b0011 : begin display_s1 = 7'b1111001; end
			4'b0100 : begin display_s1 = 7'b0110011; end
			4'b0101 : begin display_s1 = 7'b1011011; end
			4'b0110 : begin display_s1 = 7'b1011111; end
			4'b0111 : begin display_s1 = 7'b1110000; end
			4'b1000 : begin display_s1 = 7'b1111111; end
			4'b1001 : begin display_s1 = 7'b1111011; end
			default : begin display_s1 = 7'b0000000; end
		endcase
		
		case(bcdSec[7:4])
			4'b0000 : begin display_s2 = 7'b0000001; end
			4'b0001 : begin display_s2 = 7'b0000001; end
			4'b0010 : begin display_s2 = 7'b0000001; end
			4'b0011 : begin display_s2 = 7'b0000001; end
			4'b0100 : begin display_s2 = 7'b0000001; end
			4'b0101 : begin display_s2 = 7'b0000001; end
			4'b0110 : begin display_s2 = 7'b0000001; end
			4'b0111 : begin display_s2 = 7'b0000001; end
			4'b1000 : begin display_s2 = 7'b0000001; end
			4'b1001 : begin display_s2 = 7'b0000001; end
			default : begin display_s2 = 7'b0000000; end
		endcase
			
	end
endmodule





//case(current_s)
//			//seven-segment cathode display
//			4'b0000 : begin display_s1 = 7'b0000001; display_s2 = 7'b0000001; end
//			4'b0001 : begin display_s1 = 7'b0110000; display_s2 = 7'b0000001; end
//			4'b0010 : begin display_s1 = 7'b1101101; display_s2 = 7'b0000001; end
//			4'b0011 : begin display_s1 = 7'b1111001; display_s2 = 7'b0000001; end
//			4'b0100 : begin display_s1 = 7'b0110011; display_s2 = 7'b0000001; end
//			4'b0101 : begin display_s1 = 7'b1011011; display_s2 = 7'b0000001; end
//			4'b0110 : begin display_s1 = 7'b1011111; display_s2 = 7'b0000001; end
//			4'b0111 : begin display_s1 = 7'b1110000; display_s2 = 7'b0000001; end
//			4'b1000 : begin display_s1 = 7'b1111111; display_s2 = 7'b0000001; end
//			4'b1001 : begin display_s1 = 7'b1111011; display_s2 = 7'b0000001; end
//			default : begin display_s1 = 7'b0000000; display_s2 = 7'b0000000; end
//endcase
