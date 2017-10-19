//-------------------------------
// Unit test the decoder module
//-------------------------------

`include "decoders.v"

module decoder1to32Test();
	wire[31:0] out;
	reg enable;
	reg[4:0] address;

	decoder1to32 DUT (out, enable, address);

	initial begin
		// Test Case 1: do not enable writing to any register.
		enable = 0; address = 5'd14;
		if (out != 0) begin
			$display("Decoder Test Case 1 failed");
		end //

		// Test Case 2: enable writing to one register only.
		enable = 1; address = 5'd14;
		if (out[31:15] != 0 || out[14] != 1 || out[13:0] != 0) begin
			$display("Decoder Test Case 2 failed");
		end
	end //
endmodule // decoder1to32Test