module tb_clock;

       // Inputs
    reg Clk_1sec;
    reg reset;
    reg clock_enable;

    // Outputs
    wire [5:0] seconds;
    wire [5:0] minutes;
    wire [5:0] hours;

    // Instantiate the Unit Under Test (UUT)
    Digital_Clock uut (
        .Clk_1sec(Clk_1sec), 
        .reset(reset), 
        .seconds(seconds), 
        .minutes(minutes), 
        .hours(hours),
        .clock_enable(clock_enable)
    );
    
    //Generating the Clock with `1 Hz frequency
    initial Clk_1sec = 0;
    always #50 Clk_1sec = ~Clk_1sec;  //Every 0.5 sec toggle the clock.

    initial begin
        reset = 1;
        clock_enable = 1; // I just manually toggled this and verified with Modelsim that the enable affects the mode output
        // Wait 100 ns for global reset to finish
        #100; 
        reset = 0; 
	//clock_enable = 0; 
    end

endmodule
