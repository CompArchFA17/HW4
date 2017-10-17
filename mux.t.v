`timescale 1 ns / 1 ps
`include "mux.v"

module testMultiplexer ();

parameter size = 432;
reg [size-1:0] inputs;
wire out;
reg [1:0] address;

mux32to1by1 testingfour(out, address, inputs);

initial begin

// tests with just four-bit input and 2-bit address
// tests were successful
/*
$display("Inputs | Address | Output ");
inputs = 4'b0101; address = 2'b00; #1000
$display("%b   | %b | %b ", inputs, address, out);

inputs = 4'b0101; address = 2'b01; #1000
$display("%b   | %b | %b ", inputs, address, out);

inputs = 4'b0101; address = 2'b10; #1000
$display("%b   | %b | %b ", inputs, address, out);

inputs = 4'b0101; address = 2'b11; #1000
$display("%b   | %b | %b ", inputs, address, out);

$display("Inputs | Address | Output ");
inputs = 4'b1010; address = 2'b00; #1000
$display("%b   | %b | %b ", inputs, address, out);

inputs = 4'b1010; address = 2'b01; #1000
$display("%b   | %b | %b ", inputs, address, out);

inputs = 4'b1010; address = 2'b10; #1000
$display("%b   | %b | %b ", inputs, address, out);

inputs = 4'b1010; address = 2'b11; #1000
$display("%b   | %b | %b ", inputs, address, out);
end
*/

endmodule
