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

endmodule

module register32zero 
(
    output reg [31:0] q,
    input      [31:0] d,
    input             wrenable,
    input             clk
);
  always @(posedge clk) begin
    q = 0;
  end
endmodule

module register32 #(
  parameter WIDTH = 32
) (
    output reg [WIDTH-1:0] q,
    input      [WIDTH-1:0] d,
    input                  wrenable,
    input                  clk
);
  always @(posedge clk) begin
    if(wrenable) begin
      q = d;
    end
  end
endmodule