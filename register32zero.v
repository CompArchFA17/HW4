module register32zero #(
  parameter WIDTH = 32
) (
    output reg [WIDTH-1:0] q,
    input      [WIDTH-1:0] d,
    input                  wrenable,
    input                  clk
);
	q = '0;
endmodule