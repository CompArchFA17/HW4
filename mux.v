
//
module mux32to1by1
(
output      out,
input[4:0]  address,
input[31:0] inputs
);
	wire[31:0] inputsofmux;
	wire       outputofmux;
	assign outputofmux=inputsofmux[address];
endmodule


module mux32to1by32
(
output[31:0]  out,
input[4:0]    address,
input[31:0]   input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31
);

  wire[31:0] mux[31:0];			// Create a 2D array of wires

  assign mux[0] = input0;		// Connect the sources of the array
  assign mux[1] = input1;		// Connect the sources of the array
  assign mux[2] = input2;		// Connect the sources of the array
  assign mux[3] = input3;		// Connect the sources of the array
  assign mux[4] = input4;		// Connect the sources of the array
  assign mux[5] = input5;		// Connect the sources of the array
  assign mux[6] = input6;		// Connect the sources of the array
  assign mux[7] = input7;		// Connect the sources of the array
  assign mux[8] = input8;		// Connect the sources of the array
  assign mux[9] = input9;		// Connect the sources of the array
  assign mux[10] = input10;		// Connect the sources of the array
  assign mux[11] = input11;		// Connect the sources of the array
  assign mux[12] = input12;		// Connect the sources of the array
  assign mux[13] = input13;		// Connect the sources of the array
  assign mux[14] = input14;		// Connect the sources of the array
  assign mux[15] = input15;		// Connect the sources of the array
  assign mux[16] = input16;		// Connect the sources of the array
  assign mux[17] = input17;		// Connect the sources of the array
  assign mux[18] = input18;		// Connect the sources of the array
  assign mux[19] = input19;		// Connect the sources of the array
  assign mux[20] = input20;		// Connect the sources of the array
  assign mux[21] = input21;		// Connect the sources of the array
  assign mux[22] = input22;		// Connect the sources of the array
  assign mux[23] = input23;		// Connect the sources of the array
  assign mux[24] = input24;		// Connect the sources of the array
  assign mux[25] = input25;		// Connect the sources of the array
  assign mux[26] = input26;		// Connect the sources of the array
  assign mux[27] = input27;		// Connect the sources of the array
  assign mux[28] = input28;		// Connect the sources of the array
  assign mux[29] = input29;		// Connect the sources of the array
  assign mux[30] = input30;		// Connect the sources of the array
  assign mux[31] = input31;		// Connect the sources of the array

  assign out = mux[address];	// Connect the output of the array
endmodule