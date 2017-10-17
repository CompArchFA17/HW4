// 32-bit D Flip-Flop with enable
// Positive edge triggered

// This is included in register.v

module register32
(
output reg [size-1:0]	q,
input [size-1:0]	d,
input 		wrenable,
input		clk
);


	parameter size = 32;

	genvar i;
	generate
	for (i=1; i<size; i=i+1)
        begin: registerbits
    		always @(posedge clk) begin
      			if(wrenable) begin
         		   q[i] = d[i];
			end
		end
        end
   	endgenerate 
endmodule
