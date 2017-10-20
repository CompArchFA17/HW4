//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------
`include "register32.v"
`include "register32zero.v"
`include "mux32to1by32.v"
`include "decoders.v"

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
  wire[31:0] wrenable;
  wire[31:0] input0;
  wire[31:0] input1;
  wire[31:0] input2;
  wire[31:0] input3;
  wire[31:0] input4;
  wire[31:0] input5;
  wire[31:0] input6;
  wire[31:0] input7;
  wire[31:0] input8;
  wire[31:0] input9;
  wire[31:0] input10;
  wire[31:0] input11;
  wire[31:0] input12;
  wire[31:0] input13;
  wire[31:0] input14;
  wire[31:0] input15;
  wire[31:0] input16;
  wire[31:0] input17;
  wire[31:0] input18;
  wire[31:0] input19;
  wire[31:0] input20;
  wire[31:0] input21;
  wire[31:0] input22;
  wire[31:0] input23;
  wire[31:0] input24;
  wire[31:0] input25;
  wire[31:0] input26;
  wire[31:0] input27;
  wire[31:0] input28;
  wire[31:0] input29;
  wire[31:0] input30;
  wire[31:0] input31;
  decoder1to32 decoder(wrenable, RegWrite, WriteRegister);
  register32zero reg0(input0, Clk);
  register32 reg1(input1, WriteData, wrenable[1], Clk);
  register32 reg2(input2, WriteData, wrenable[2], Clk);
  register32 reg3(input3, WriteData, wrenable[3], Clk);
  register32 reg4(input4, WriteData, wrenable[4], Clk);
  register32 reg5(input5, WriteData, wrenable[5], Clk);
  register32 reg6(input6, WriteData, wrenable[6], Clk);
  register32 reg7(input7, WriteData, wrenable[7], Clk);
  register32 reg8(input8, WriteData, wrenable[8], Clk);
  register32 reg9(input9, WriteData, wrenable[9], Clk);
  register32 reg10(input10, WriteData, wrenable[10], Clk);
  register32 reg11(input11, WriteData, wrenable[11], Clk);
  register32 reg12(input12, WriteData, wrenable[12], Clk);
  register32 reg13(input13, WriteData, wrenable[13], Clk);
  register32 reg14(input14, WriteData, wrenable[14], Clk);
  register32 reg15(input15, WriteData, wrenable[15], Clk);
  register32 reg16(input16, WriteData, wrenable[16], Clk);
  register32 reg17(input17, WriteData, wrenable[17], Clk);
  register32 reg18(input18, WriteData, wrenable[18], Clk);
  register32 reg19(input19, WriteData, wrenable[19], Clk);
  register32 reg20(input20, WriteData, wrenable[20], Clk);
  register32 reg21(input21, WriteData, wrenable[21], Clk);
  register32 reg22(input22, WriteData, wrenable[22], Clk);
  register32 reg23(input23, WriteData, wrenable[23], Clk);
  register32 reg24(input24, WriteData, wrenable[24], Clk);
  register32 reg25(input25, WriteData, wrenable[25], Clk);
  register32 reg26(input26, WriteData, wrenable[26], Clk);
  register32 reg27(input27, WriteData, wrenable[27], Clk);
  register32 reg28(input28, WriteData, wrenable[28], Clk);
  register32 reg29(input29, WriteData, wrenable[29], Clk);
  register32 reg30(input30, WriteData, wrenable[30], Clk);
  register32 reg31(input31, WriteData, wrenable[31], Clk);
  mux32to1by32 data1(ReadData1, ReadRegister1, input0,
    input1,
    input2,
    input3,
    input4,
    input5,
    input6,
    input7,
    input8,
    input9,
    input10,
    input11,
    input12,
    input13,
    input14,
    input15,
    input16,
    input17,
    input18,
    input19,
    input20,
    input21,
    input22,
    input23,
    input24,
    input25,
    input26,
    input27,
    input28,
    input29,
    input30,
    input31
    );
  mux32to1by32 data2(ReadData2, ReadRegister2, input0,
    input1,
    input2,
    input3,
    input4,
    input5,
    input6,
    input7,
    input8,
    input9,
    input10,
    input11,
    input12,
    input13,
    input14,
    input15,
    input16,
    input17,
    input18,
    input19,
    input20,
    input21,
    input22,
    input23,
    input24,
    input25,
    input26,
    input27,
    input28,
    input29,
    input30,
    input31
    );
endmodule
