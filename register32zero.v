module register32zero
(
output reg[31:0]	q,
input		clk
);
    always @(posedge clk) begin
        q = 32'b0;
    end
endmodule
