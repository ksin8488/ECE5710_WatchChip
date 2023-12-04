// Verilog clock divider module to give 1Hz clock signal, 
// assuming incoming clk signal is 50MHz.
// so, count up to 50_000_000, then toggle output.

module clk_divider(input clk,
	input reset,
	output reg clk_seconds);

reg [25:0] count;
// parameter MAX_COUNT = 26'd25000000; //uncomment for final
// a more reasonable number for testbench
parameter MAX_COUNT	= 26'd25000;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		count <= 0;
		clk_seconds <= 0;
	end else begin
		if (count == MAX_COUNT) begin
			count <= 26'd0;
			clk_seconds <= ~clk_seconds;
		end else begin
			count <= count + 1'b1;
		end
	end
end

endmodule
