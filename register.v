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


// 32-bit D Flip-Flop with enable
// Positive edge triggered

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



// take in inputs like above, but always output zero
module register32zero
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
         		   q[i] = 0;
			end
		end
        end
   	endgenerate 



endmodule


