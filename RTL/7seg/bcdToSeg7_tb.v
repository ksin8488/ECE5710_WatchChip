`timescale 1ps/1ps
module bcdToSeg7_tb();

	reg [7:0] bcd;
	wire [6:0] seg7OnesOut;
	wire [6:0] seg7TensOut;
	
	integer i, j;
	
	bcdToSeg7 dut(
		.bcd(bcd),
		.seg7OnesOut(seg7OnesOut),
		.seg7TensOut(seg7TensOut)
	);

	initial begin
	
	//Only testing 0-9 because those are the only digits for a BCD to use for each number place
	//So this testbench tests BCD values from 0-99
	for(i = 0; i < 10; i=i+1) begin
		for(j=0; j < 10; j=j+1) begin
			//set bcd to a BCD format that will be tested
			bcd[3:0] = j;
			bcd[7:4] = i;
			#10;
				
			$display("seg7OnesOut%b", "seg7TensOut%b", seg7OnesOut, seg7TensOut);
		end
	end
	
	
	end
endmodule
