// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg  q,
input       d,
input       wrenable,
input       clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end

endmodule

module register32
(

    output[31:0] reg    q,
    input[31:0]         d,
    input               wrenable,
    input               clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end

endmodule

module register32zero
(
    output[31:0] reg    q,
    input[31:0]         d,
    input               wrenable.
    input               clk
);

    q = 32'b0;

endmodule