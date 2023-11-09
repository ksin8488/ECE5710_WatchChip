
module tb_clock;

       // Inputs
    reg Clk_1sec;
    reg reset;
    reg clock_enable;
    reg min_inc;
    reg min_dec;
    reg hour_inc;
    reg hour_dec;

    // Outputs
    wire [5:0] seconds;
    wire [5:0] minutes;
    wire [5:0] hours;
    wire mode; // may have to modify this

    // Instantiate the Unit Under Test (UUT)
    Digital_Clock uut (
        .Clk_1sec(Clk_1sec), 
        .reset(reset), 
        .seconds(seconds), 
        .minutes(minutes), 
        .hours(hours),
        .clock_enable(clock_enable),
	.min_inc(min_inc),
	.min_dec(min_dec),
	.hour_inc(hour_inc),
	.hour_dec(hour_dec)
    );
    
    //Generating the Clock with `1 Hz frequency
    initial Clk_1sec = 0;
    always #500000000 Clk_1sec = ~Clk_1sec;  //Every 0.5 sec toggle the clock.

    initial begin
        reset = 1;
        clock_enable = 0;
        // Wait 100 ns for global reset to finish
        #100; 
        reset = 0; 
	//clock_enable = 0; 
    end

endmodule
