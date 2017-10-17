`include "mux.v"


module testmux();
	reg[4:0] address;
	reg[31:0] inputs, 
	input0, input1, input2, input3, 
	input4, input5, input6, input7,
	input8, input9, input10, input11,
	input12, input13, input14, input15,
	input16, input17, input18, input19,
	input20, input21, input22, input23,
	input24, input25, input26, input27,
	input28, input29, input30, input31;
    wire out_1bit;
    wire[31:0] out;


    mux32to1by1 mux_1bit(out_1bit, address, inputs);

    mux32to1by32 mux_32bit(out, address, 
    input0, input1, input2, input3, 
	input4, input5, input6, input7,
	input8, input9, input10, input11,
	input12, input13, input14, input15,
	input16, input17, input18, input19,
	input20, input21, input22, input23,
	input24, input25, input26, input27,
	input28, input29, input30, input31);
    initial begin 

    $display("mux module");
    address = 5'b0; inputs = 32'b1; #5000
	$display("address: %b | inputs: %b | output: %b", address, inputs, out_1bit);
    address = 5'b1; inputs = 32'd2; #5000
	$display("address: %b | inputs: %b | output: %b", address, inputs, out_1bit);
    address = 5'd31; inputs = 32'b10000000000000000000000000000000; #5000
	$display("address: %b | inputs: %b | output: %b", address, inputs, out_1bit);
    address = 5'd31; inputs = 32'b10000000000000000000000000000000; #5000
	$display("address: %b | inputs: %b | output: %b", address, inputs, out_1bit);
    


    address = 5'd2; 
    input0 = 32'b10000000000000000000000000000000;
    input1 = 32'b10000000000000000000000000000000;
    input2 = 32'b11111111111111111111111111111111;
    input3 = 32'b10000000000000000000000000000000;
    input4 = 32'b10000000000000000000000000000000;
    input5 = 32'b10000000000000000000000000000000;
    input6 = 32'b10000000000000000000000000000000;
    input7 = 32'b10000000000000000000000000000000;
    input8 = 32'b10000000000000000000000000000000;
    input9 = 32'b10000000000000000000000000000000;
    input10 = 32'b10000000000000000000000000000000;
    input11 = 32'b10000000000000000000000000000000;
    input12 = 32'b10000000000000000000000000000000;
    input13 = 32'b10000000000000000000000000000000;
    input14 = 32'b10000000000000000000000000000000;
    input15 = 32'b10000000000000000000000000000000;
    input16 = 32'b10000000000000000000000000000000;
    input17 = 32'b10000000000000000000000000000000;
    input18 = 32'b10000000000000000000000000000000;
    input19 = 32'b10000000000000000000000000000000;
    input20 = 32'b10000000000000000000000000000000;
    input21 = 32'b10000000000000000000000000000000;
    input22 = 32'b10000000000000000000000000000000;
    input23 = 32'b10000000000000000000000000000000;
    input24 = 32'b10000000000000000000000000000000;
    input25 = 32'b10000000000000000000000000000000;
    input26 = 32'b10000000000000000000000000000000;
    input27 = 32'b10000000000000000000000000000000;
    input28 = 32'b10000000000000000000000000000000;
    input29 = 32'b10000000000000000000000000000000;
    input30 = 32'b10000000000000000000000000000000;
    input31 = 32'b10000000000000000000000000000000; #5000
	$display("address: %b | output: %b (check mux.t.v for all the other inputs)", address, out);

    end 
endmodule


