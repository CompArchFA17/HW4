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

endmodule
/*
Deliverable 6:
If enable is 0, enable<<address will always be zero.
If enable is 1, enable<<address will be mostly zero,
except its addressth bit will be 1. This is exactly
the behaviour of a decoder. The addressth bit of the output
will be equal to 1 if enable is high, otherwise it will be zero.
All the other bits of out will always be zero.
*/
