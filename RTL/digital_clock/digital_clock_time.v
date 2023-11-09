// TODO: allow time setting with H/M increment and decrement signals
module Digital_Clock(
    Clk_1sec,  //Clock with 1 Hz frequency
    reset,     //active high reset
    clock_enable, // used to determine mode output
	min_inc,
	min_dec,
	hour_inc,
	hour_dec,
    seconds,
    minutes,
    hours
	);

//What are the Inputs?
    input Clk_1sec;  
    input reset;
    input clock_enable; // if value == 1 it's current time : if value == 0 it's stopwatch time
	input min_inc;
	input min_dec;
	input hour_inc;
	input hour_dec;
//What are the Outputs? 
    output reg unsigned [5:0] seconds; // 6 bits needed for binary representation of 60 2^6 = 64
    output reg unsigned [5:0] minutes; // 6 bits needed for binary representation of 60 2^6 = 64
    output reg unsigned [5:0] hours; // 5 bits needed for binary representation of 24 2^5 = 32. *Changed to 6 bits for easy BCD
//Internal variables.
/*
    reg [5:0] seconds; // 6 bits needed for binary representation of 60 2^6 = 64
    reg [5:0] minutes; // 6 bits needed for binary representation of 60 2^6 = 64
    reg [5:0] hours;  // 5 bits needed for binary representation of 24 2^5 = 32 *Changed to 6 bits for easy BCD
	*/

   //Execute the always blocks when the Clock or reset inputs are 
    //changing from 0 to 1(positive edge of the signal)
    always @(posedge(Clk_1sec) or posedge(reset)) //sensitivity list
    begin
        if(reset == 1'b1) begin  //check for active high reset.
           //reset the time.
            seconds <= 0;
            minutes <= 0;
            hours <= 0;  
		end
        else if(Clk_1sec == 1'b1) begin  //at the beginning of each second
			if(seconds == 59) begin
				seconds <= 0;
				if(minutes == 59) begin
					minutes <= 0;
					if(hours == 23) begin
						hours <= 0;
					end
					else begin
						hours <= hours + 1;
					end
				end
				else begin
					minutes <= minutes + 1;
				end
			end
			else begin
				seconds <= seconds + 1; //increment sec
			end
	    end
	end

endmodule
