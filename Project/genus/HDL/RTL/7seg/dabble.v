/**
 * Homework 2 problem 1: Double Dabble - binary to BCD converter
 *
 * @author Ella Moss
 */

module bin2bcd(
	input [5:0] d_in,
	input d_in_ready,
	input clk,
	input rst,
	output [7:0] d_out,
	output ready);
	
	wire next_bit;
	wire [7:0] val_next;
	wire [7:0] val_now;

	dd_incoming		incoming(.d_in(d_in),
						.load(d_in_ready),
						.clk(clk),
						.rst(rst),
						.msb(next_bit));

	latch			outgoing(.clk(clk),
						.rst(rst),
						.d(val_next),
						.q(val_now));
	
	dd_ctrl			ctrl(.clk(clk),
						.rst(rst),
						.d_ready(d_in_ready),
						.msb(next_bit),
						.val_next(val_next),
						.val_now(val_now),
						.d_out(d_out),
						.ready(ready));
endmodule

/**
 * Shift register module for incoming binary data.
 */
module dd_incoming(
	input [5:0] d_in,
	input load,
	input clk,
	input rst,
	output msb);

	reg [5:0] shifter;

	assign msb = shifter[5];

	always@(posedge clk) begin
		if(rst) shifter <= 6'b0;
		else if(load) shifter <= d_in;
		else begin
			shifter <= {shifter[4:0], 1'b0};
		end
	end
endmodule

/**
 * Latch for the "scratch space" for double dabble algorithm.
 */
module latch(
	input clk,
	input rst,
	input [7:0] d,
	output reg [7:0] q);

	// i know this is probably bad practice but it works now !
	always@(negedge clk) begin
		if(rst) q <= 8'b0;
		else q <= d;
	end
endmodule

/**
 * Control/FSM for double-dabble algorithm.
 */
module dd_ctrl(
	input clk,
	input rst,
	input msb,
	input d_ready,
	input [7:0] val_now,
	output reg [7:0] val_next,
	output reg [7:0] d_out,
	output reg ready);

	reg [3:0] counter;

	// State parameters
	parameter STATE_IDLE	= 2'd0;
	parameter STATE_SHIFT   = 2'd1;
	parameter STATE_READY   = 2'd2;

	reg [1:0] this_state;
	reg [1:0] next_state;

	reg [3:0] tens;
	reg [3:0] ones;

	// assign val_next = rst ? 12'b0 : ({huns, tens, ones} << 1) + msb;

	always@(posedge clk) begin 
		if(rst) begin
			next_state = STATE_IDLE;
			val_next <= 8'b0;
		end
		this_state <= next_state;
		if(this_state === STATE_SHIFT) begin
			counter <= counter + 1'b1;
			if(counter < 4'd1)
				val_next <= msb;
			else
				val_next <= ({tens, ones} << 1) + msb;
		end
		else if(this_state === STATE_IDLE) begin
			counter <= 4'd0;
		end
	end

	// next-state and output combinational logic
	always@(*) begin
		if(rst) begin
			d_out <= 8'd0;
			tens <= 4'b0;
			ones <= 4'b0;
		end
		else begin
			case(this_state)
				STATE_IDLE: begin
					ready <= 1'b0;
					tens <= 4'b0;
					ones <= 4'b0;
					d_out <= 8'b0;
					if(d_ready) next_state <= STATE_SHIFT;
					else next_state <= STATE_IDLE;
				end
				STATE_SHIFT: begin
					d_out <= 8'b0;
					// done?
					if(counter === 4'd5) next_state <= STATE_READY;
					else next_state <= STATE_SHIFT;
					// else begin
						// add to tens place
						if(val_now[7:4] >= 4'd5) begin
							// val_next <= {val_now[10:0]+(4'd3<<4), msb};
							tens <= val_now[7:4] + 4'd3;
						end
						else tens <= val_now[7:4];

						// add to ones place
						if(val_now[3:0] >= 4'd5) begin
							// val_next <= {val_now[10:0]+4'd3, msb};
							ones <= val_now[3:0] + 4'd3;
						end
						else ones <= val_now[3:0];
					// end
				end
				STATE_READY: begin
					d_out <= val_next;
					ready <= 1'b1;
					if(d_ready) begin
						next_state <= STATE_SHIFT;
						ready <= 1'b0;
						tens <= 4'b0;
						ones <= 4'b0;
					end
					else begin
						next_state <= STATE_READY;
						tens <= 4'b0;
						ones <= 4'b0;
					end
				end
				default: begin
					d_out <= 8'b0;
					ready <= 1'b0;
					next_state <= STATE_IDLE;
					ready <= 1'b0;
					tens <= 4'b0;
					ones <= 4'b0;
				end
			endcase
		end
	end

endmodule




