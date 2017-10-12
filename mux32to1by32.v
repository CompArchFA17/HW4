`include "mux32to1by1.v"

module mux32to1by32
(
output[31:0] out,
input[4:0]  address,
input[31:0] input0, input1, input2, input3,
input[31:0] input4, input5, input6, input7,
input[31:0] input8, input9, input10, input11,
input[31:0] input12, input13, input14, input15,
input[31:0] input16, input17, input18, input19,
input[31:0] input20, input21, input22, input23,
input[31:0] input24, input25, input26, input27,
input[31:0] input28, input29, input30, input31
);
  mux32to1by1 mux0(out[0], address, input0);
  mux32to1by1 mux1(out[1], address, input1);
  mux32to1by1 mux2(out[2], address, input2);
  mux32to1by1 mux3(out[3], address, input3);
  mux32to1by1 mux4(out[4], address, input4);
  mux32to1by1 mux5(out[5], address, input5);
  mux32to1by1 mux6(out[5], address, input6);
  mux32to1by1 mux7(out[7], address, input7);
  mux32to1by1 mux8(out[8], address, input8);
  mux32to1by1 mux9(out[9], address, input9);
  mux32to1by1 mux10(out[10], address, input10);
  mux32to1by1 mux11(out[11], address, input11);
  mux32to1by1 mux12(out[12], address, input12);
  mux32to1by1 mux13(out[13], address, input13);
  mux32to1by1 mux14(out[14], address, input14);
  mux32to1by1 mux15(out[15], address, input15);
  mux32to1by1 mux16(out[16], address, input16);
  mux32to1by1 mux17(out[17], address, input17);
  mux32to1by1 mux18(out[18], address, input18);
  mux32to1by1 mux19(out[19], address, input19);
  mux32to1by1 mux20(out[20], address, input20);
  mux32to1by1 mux21(out[21], address, input21);
  mux32to1by1 mux22(out[22], address, input22);
  mux32to1by1 mux23(out[23], address, input23);
  mux32to1by1 mux24(out[24], address, input24);
  mux32to1by1 mux25(out[25], address, input25);
  mux32to1by1 mux26(out[26], address, input26);
  mux32to1by1 mux27(out[27], address, input27);
  mux32to1by1 mux28(out[28], address, input28);
  mux32to1by1 mux29(out[29], address, input29);
  mux32to1by1 mux30(out[30], address, input30);
  mux32to1by1 mux31(out[31], address, input31);
endmodule
