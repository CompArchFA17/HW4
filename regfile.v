//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------
`include "decoders.v"
`include "register.v"
`include "mux32to1by32.v"
`include "multiplexer32.v"

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

  wire[31:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31;
  wire[31:0] decodePos;

  // Register to write to
  decoder1to32 decode(decodePos, RegWrite, WriteRegister);
  register32zero reg32_0(reg0, WriteData, decodePos[0], Clk);
  register32 reg32_1(reg1, WriteData, decodePos[1], Clk);
  register32 reg32_2(reg2, WriteData, decodePos[2], Clk);
  register32 reg32_3(reg3, WriteData, decodePos[3], Clk);
  register32 reg32_4(reg4, WriteData, decodePos[4], Clk);
  register32 reg32_5(reg5, WriteData, decodePos[5], Clk);
  register32 reg32_6(reg6, WriteData, decodePos[6], Clk);
  register32 reg32_7(reg7, WriteData, decodePos[7], Clk);
  register32 reg32_8(reg8, WriteData, decodePos[8], Clk);
  register32 reg32_9(reg9, WriteData, decodePos[9], Clk);
  register32 reg32_10(reg10, WriteData, decodePos[10], Clk);
  register32 reg32_11(reg11, WriteData, decodePos[11], Clk);
  register32 reg32_12(reg12, WriteData, decodePos[12], Clk);
  register32 reg32_13(reg13, WriteData, decodePos[13], Clk);
  register32 reg32_14(reg14, WriteData, decodePos[14], Clk);
  register32 reg32_15(reg15, WriteData, decodePos[15], Clk);
  register32 reg32_16(reg16, WriteData, decodePos[16], Clk);
  register32 reg32_17(reg17, WriteData, decodePos[17], Clk);
  register32 reg32_18(reg18, WriteData, decodePos[18], Clk);
  register32 reg32_19(reg19, WriteData, decodePos[19], Clk);
  register32 reg32_20(reg20, WriteData, decodePos[20], Clk);
  register32 reg32_21(reg21, WriteData, decodePos[21], Clk);
  register32 reg32_22(reg22, WriteData, decodePos[22], Clk);
  register32 reg32_23(reg23, WriteData, decodePos[23], Clk);
  register32 reg32_24(reg24, WriteData, decodePos[24], Clk);
  register32 reg32_25(reg25, WriteData, decodePos[25], Clk);
  register32 reg32_26(reg26, WriteData, decodePos[26], Clk);
  register32 reg32_27(reg27, WriteData, decodePos[27], Clk);
  register32 reg32_28(reg28, WriteData, decodePos[28], Clk);
  register32 reg32_29(reg29, WriteData, decodePos[29], Clk);
  register32 reg32_30(reg30, WriteData, decodePos[30], Clk);
  register32 reg32_31(reg31, WriteData, decodePos[31], Clk);

  mux32to1by32 rd1(ReadData1, ReadRegister1, reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31);
  mux32to1by32 rd2(ReadData2, ReadRegister2, reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31);
endmodule