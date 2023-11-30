/**
* THIS MODULE DOES NOT WORK
*
* it was written with blocking assignments which were not synthesizable!!
*
* See dabble.v for a working (but somewhat lengthy..) implementation
*/
module binToBCD(
	input [5:0] bin, //6-bit binary (0-63)
	output reg [7:0] BCD //8-bit binary for 2 digits);
	);

integer i; //For loop value

always @(bin)
begin
	BCD[7:0] <= 0; //BCD value starts empty
	
	for (i=0; i<6; i=i+1) begin //for loop through binary input
	
		//Check each BCD section and add 3 if greater than 5
		if (BCD[3:0] >= 5) begin
			BCD[3:0] <= BCD[3:0] + 3;
			end
			
		if (BCD[7:4] >= 5) begin
			BCD[7:4] <= BCD[7:4] + 3;
			end
		
		//NOTE: can also "shift" with concatenation
		BCD <= {BCD[7:0],bin[5-i]}; //Shifting by doing concatination of current bin bit and concat it to BCD
	end

end

endmodule
