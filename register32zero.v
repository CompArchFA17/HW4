// 32 Bit dummy register with enable
//   Positive edge triggered
module register32zero
(
    output reg[31:0]    q,
    input[31:0]         d,
    input               wrenable,
    input               clk
    );

    always @(posedge clk) begin
        if(wrenable) begin
            q = 0;
        end
    end

endmodule
