// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg	q,
input		d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end

endmodule // register

module register32
(
output [31:0] q,
input[31:0] d,
input wrenable, 
input clk
);
	// TODO: figure out how to use register module here.
	genvar i;
	for (i = 0; i < 32; i = i + 1) begin
		register singleRegister (q[i], d[i], wrenable, clk);
	end

endmodule // register32