`timescale 1 ns / 1 ps
`include "register.v"

module registerTest();
	reg[31:0] inputs;
	reg wrenable;
	reg clk;
	wire[31:0] out32;
	wire[31:0] out0;

	register32 reg32(out32[31:0], inputs[31:0], wrenable,  clk);
	register32zero reg32zero(out0[31:0], inputs[31:0], wrenable, clk);

	initial begin
		$display("register32");
		$display("Input                             Enable  Output");
		inputs=32'b00000000111111110000000011111111;
		wrenable=1;
		clk=1;
		#5000
		$display("%b   %b     %b", inputs[31:0], wrenable, out32);

		inputs=32'b11111111000000001111111100000000; #5000
		$display("%b   %b     %b", inputs[31:0], wrenable, out32);

		clk=0;
		clk=1; #5000
		$display("%b   %b     %b", inputs[31:0], wrenable, out32);

		$display("register32zero");
		$display("Input                             Enable  Output                     Clock");
		wrenable=1; 
		clk=0;
		#5000
		$display("%b   %b     %b       %b", inputs[31:0], wrenable, out0, clk);

		clk=1;
		#5000
		$display("%b   %b     %b       %b", inputs[31:0], wrenable, out0, clk);
	end

endmodule