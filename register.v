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


// 32-bit D Flip Flop Register with Enable
// Positive edfe triggered
module register32
(
output reg [31:0] q,
input [31:0] d,
input wrenable,
input clk
);

	always @(posedge clk) begin
		if(wrenable) begin
			q[31:0]=d[31:0];
		end
	end
endmodule



// 32-bit Register that always outputs 0
// register does not have write capability
module register32zero(output reg [31:0] q,);
	q[31:0] = 0;
endmodule