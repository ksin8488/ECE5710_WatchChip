module Digital_Clock(
	clk,	   //fast clock
    Clk_1sec,  //Clock with 1 Hz frequency
    reset,     //active high reset
    clock_enable, // used to determine mode output
    min_inc,
    min_dec,
    hour_inc,
    hour_dec,
    seconds,
    minutes,
    hours);

//What are the Inputs?
	input clk;
    input Clk_1sec;  
    input reset;
    input clock_enable; // if value == 1 it's current time : if value == 0 it's stopwatch time
    input min_inc;
    input min_dec;
    input hour_inc;
    input hour_dec;
//What are the Outputs? 
    output reg [5:0] seconds; // 6 bits needed for binary representation of 60 2^6 = 64
    output reg [5:0] minutes; // 6 bits needed for binary representation of 60 2^6 = 64
    output reg [5:0] hours; // 5 bits needed for binary representation of 24 2^5 = 32. *Changed to 6 bits for easy BCD

 //for edge deteciton inside the alway sblock below
 reg old_clk_1sec;

   //Execute the always blocks when the Clock or reset inputs are 
    //changing from 0 to 1(positive edge of the signal)
 always @(posedge(clk) or posedge(reset)) //sensitivity list
 begin
	 if(reset == 1'b1) begin  //check for active high reset.
		 //reset the time.
		 seconds <= 0;
		 minutes <= 0;
		 hours <= 0;  
		 old_clk_1sec <= 1'b0;
	 end
	 else if(Clk_1sec == 1'b1 && old_clk_1sec == 1'b0) begin  //at the beginning of each second
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
		 old_clk_1sec <= Clk_1sec;
	 end
	 old_clk_1sec <= Clk_1sec;
end
	
// next else if block for other signal
always @(posedge(min_inc)) begin 
	if(minutes == 59) begin
		minutes <= 0;
	end
	else begin
		minutes <= minutes + 1;
	end
end

// minute decrement
always @(posedge(min_dec)) begin 
	if(minutes == 0) begin
		minutes <= 59;
	end
	else begin
		minutes <= minutes - 1;
	end
end

// hour increment		
always @(posedge(hour_inc)) begin 
	if(hours == 23) begin
		hours <= 0;
	end
	else begin
		hours <= hours + 1;
	end
end

// hour decrement
always @(posedge(hour_dec)) begin 
	if(hours == 0) begin
		hours <= 23;
	end
	else begin
		hours <= hours - 1;
	end
end




endmodule
