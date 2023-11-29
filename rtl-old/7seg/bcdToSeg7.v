module bcdToSeg7 (bcd, seg7OnesOut, seg7TensOut);

	input [7:0] bcd;
	output reg [6:0] seg7OnesOut;
	output reg [6:0] seg7TensOut;
	
	always@(bcd)
	begin
		case(bcd[3:0])
			//seven-segment cathode display Ones place value (Ex. 10 <-- will display 0)
			4'b0000 : begin seg7OnesOut = 7'b0000001; end
			4'b0001 : begin seg7OnesOut = 7'b0110000; end
			4'b0010 : begin seg7OnesOut = 7'b1101101; end
			4'b0011 : begin seg7OnesOut = 7'b1111001; end
			4'b0100 : begin seg7OnesOut = 7'b0110011; end
			4'b0101 : begin seg7OnesOut = 7'b1011011; end
			4'b0110 : begin seg7OnesOut = 7'b1011111; end
			4'b0111 : begin seg7OnesOut = 7'b1110000; end
			4'b1000 : begin seg7OnesOut = 7'b1111111; end
			4'b1001 : begin seg7OnesOut = 7'b1111011; end
			default : begin seg7OnesOut = 7'b0000000; end
		endcase
		
		case(bcd[7:4])
			//seven-segment cathode display Ones place value (Ex. 10 <-- will display 1)
			4'b0000 : begin seg7TensOut = 7'b0000001; end
			4'b0001 : begin seg7TensOut = 7'b0110000; end
			4'b0010 : begin seg7TensOut = 7'b1101101; end
			4'b0011 : begin seg7TensOut = 7'b1111001; end
			4'b0100 : begin seg7TensOut = 7'b0110011; end
			4'b0101 : begin seg7TensOut = 7'b1011011; end
			4'b0110 : begin seg7TensOut = 7'b1011111; end
			4'b0111 : begin seg7TensOut = 7'b1110000; end
			4'b1000 : begin seg7TensOut = 7'b1111111; end
			4'b1001 : begin seg7TensOut = 7'b1111011; end
			default : begin seg7TensOut = 7'b0000000; end
		endcase
	end


endmodule
