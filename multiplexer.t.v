`timescale 1 ns / 1 ps
`include "multiplexer32.v"

module multiplexerTest();
	reg[31:0] inputs;
	reg[4:0] address;
	wire out;

	mux32to1by1 mux(out, address[4:0], inputs[31:0]);

	initial begin
		$display("Input                             Address  Output");
		inputs=32'b00000000111111110000000011111111;
		address=5'b00000;
		#5000
		$display("%b   %b     %b", inputs[31:0], address[4:0], out);

		address=5'b01001; #5000
		$display("%b   %b     %b", inputs[31:0], address[4:0], out);
	end

endmodule