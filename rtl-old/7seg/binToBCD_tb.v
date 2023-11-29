`timescale 1ps/1ps
module binToBCD_tb;
	//Input and outputs
	reg [5:0] bin;
	wire [7:0] BCD;
	//used for testing for loop
	integer i;
	
	binToBCD dut(
		.bin(bin),
		.BCD(BCD)
	);

	initial begin
//		//Initialize starting value
//		bin = 0;
//		#10; //10 time unit delay before starting testing
//		
		//Testing all integer values from 0 to 63
		for(i=0; i < 64; i=i+1) 
		begin
			bin = i;
			#10;
			
			$display("BCD%b",BCD);
		end
		
		$stop;
	end
	
endmodule
	

