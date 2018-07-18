`include "register.v"
`include "decoders.v"
//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);

    wire[31:0] decoderOutputs;
    wire[31:0] input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31;

    decoder1to32 decoder(decoderOutputs, RegWrite, WriteRegister);

    register32zero zeroRegister(input0, WriteData, decoderOutputs[0], Clk);
    register32 register1(input1, WriteData, decoderOutputs[1], Clk);
    register32 register2(input2, WriteData, decoderOutputs[2], Clk);
    register32 register3(input3, WriteData, decoderOutputs[3], Clk);
    register32 register4(input4, WriteData, decoderOutputs[4], Clk);
    register32 register5(input5, WriteData, decoderOutputs[5], Clk);
    register32 register6(input6, WriteData, decoderOutputs[6], Clk);
    register32 register7(input7, WriteData, decoderOutputs[7], Clk);
    register32 register8(input8, WriteData, decoderOutputs[8], Clk);
    register32 register9(input9, WriteData, decoderOutputs[9], Clk);
    register32 register10(input10, WriteData, decoderOutputs[10], Clk);
    register32 register11(input11, WriteData, decoderOutputs[11], Clk);
    register32 register12(input12, WriteData, decoderOutputs[12], Clk);
    register32 register13(input13, WriteData, decoderOutputs[13], Clk);
    register32 register14(input14, WriteData, decoderOutputs[14], Clk);
    register32 register15(input15, WriteData, decoderOutputs[15], Clk);
    register32 register16(input16, WriteData, decoderOutputs[16], Clk);
    register32 register17(input17, WriteData, decoderOutputs[17], Clk);
    register32 register18(input18, WriteData, decoderOutputs[18], Clk);
    register32 register19(input19, WriteData, decoderOutputs[19], Clk);
    register32 register20(input20, WriteData, decoderOutputs[20], Clk);
    register32 register21(input21, WriteData, decoderOutputs[21], Clk);
    register32 register22(input22, WriteData, decoderOutputs[22], Clk);
    register32 register23(input23, WriteData, decoderOutputs[23], Clk);
    register32 register24(input24, WriteData, decoderOutputs[24], Clk);
    register32 register25(input25, WriteData, decoderOutputs[25], Clk);
    register32 register26(input26, WriteData, decoderOutputs[26], Clk);
    register32 register27(input27, WriteData, decoderOutputs[27], Clk);
    register32 register28(input28, WriteData, decoderOutputs[28], Clk);
    register32 register29(input29, WriteData, decoderOutputs[29], Clk);
    register32 register30(input30, WriteData, decoderOutputs[30], Clk);
    register32 register31(input31, WriteData, decoderOutputs[31], Clk);

    mux32to1by32 mux1(ReadData1, ReadRegister1, input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);

    mux32to1by32 mux2(ReadData2, ReadRegister2, input0, input1, input2, input3, input4, input5, input6, input7, input8, input9, input10, input11, input12, input13, input14, input15, input16, input17, input18, input19, input20, input21, input22, input23, input24, input25, input26, input27, input28, input29, input30, input31);


endmodule
