// 32 bit decoder with enable signal
//   enable=0: all output bits are 0
//   enable=1: out[address] is 1, all other outputs are 0
module decoder1to32
(
output[31:0]	out,
input		enable,
input[4:0]	address
);

    assign out = enable<<address; 
    //Deliverable 6: the operator << shifts enable by the amount address to the left. If enable is 0, the result
    // will still be zero no matter the shift. Other wise, the place specified by the address will become 1 in out.

endmodule

