//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "register32.v"
`include "register32zero.v"
`include "decoders.v"
`include "mux32to1by32.v"

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

  // These two lines are clearly wrong.  They are included to showcase how the
  // test harness works. Delete them after you understand the testing process,
  // and replace them with your actual code.

  wire[31:0] reg0out, reg1out, reg2out, reg3out;
  wire[31:0] reg4out, reg5out, reg6out, reg7out;
  wire[31:0] reg8out, reg9out, reg10out, reg11out;
  wire[31:0] reg12out, reg13out, reg14out, reg15out;
  wire[31:0] reg16out, reg17out, reg18out, reg19out;
  wire[31:0] reg20out, reg21out, reg22out, reg23out;
  wire[31:0] reg24out, reg25out, reg26out, reg27out;
  wire[31:0] reg28out, reg29out, reg30out, reg31out;
  wire[31:0] wrenable;

  decoder1to32 dec(wrenable, RegWrite, WriteRegister);
  register32zero reg0(reg0out, WriteData, wrenable[0], Clk);
  register32 reg1(reg1out, WriteData, wrenable[1], Clk);
  register32 reg2(reg2out, WriteData, wrenable[2], Clk);
  register32 reg3(reg3out, WriteData, wrenable[3], Clk);
  register32 reg4(reg4out, WriteData, wrenable[4], Clk);
  register32 reg5(reg5out, WriteData, wrenable[5], Clk);
  register32 reg6(reg6out, WriteData, wrenable[6], Clk);
  register32 reg7(reg7out, WriteData, wrenable[7], Clk);
  register32 reg8(reg8out, WriteData, wrenable[8], Clk);
  register32 reg9(reg9out, WriteData, wrenable[9], Clk);
  register32 reg10(reg10out, WriteData, wrenable[10], Clk);
  register32 reg11(reg11out, WriteData, wrenable[11], Clk);
  register32 reg12(reg12out, WriteData, wrenable[12], Clk);
  register32 reg13(reg13out, WriteData, wrenable[13], Clk);
  register32 reg14(reg14out, WriteData, wrenable[14], Clk);
  register32 reg15(reg15out, WriteData, wrenable[15], Clk);
  register32 reg16(reg16out, WriteData, wrenable[16], Clk);
  register32 reg17(reg17out, WriteData, wrenable[17], Clk);
  register32 reg18(reg18out, WriteData, wrenable[18], Clk);
  register32 reg19(reg19out, WriteData, wrenable[19], Clk);
  register32 reg20(reg20out, WriteData, wrenable[20], Clk);
  register32 reg21(reg21out, WriteData, wrenable[21], Clk);
  register32 reg22(reg22out, WriteData, wrenable[22], Clk);
  register32 reg23(reg23out, WriteData, wrenable[23], Clk);
  register32 reg24(reg24out, WriteData, wrenable[24], Clk);
  register32 reg25(reg25out, WriteData, wrenable[25], Clk);
  register32 reg26(reg26out, WriteData, wrenable[26], Clk);
  register32 reg27(reg27out, WriteData, wrenable[27], Clk);
  register32 reg28(reg28out, WriteData, wrenable[28], Clk);
  register32 reg29(reg29out, WriteData, wrenable[29], Clk);
  register32 reg30(reg30out, WriteData, wrenable[30], Clk);
  register32 reg31(reg31out, WriteData, wrenable[31], Clk);

  mux32to1by32 mux0(ReadData1, ReadRegister1, reg0out, reg1out, reg2out, reg3out, reg4out, reg5out, reg6out, reg7out, reg8out, reg9out, reg10out, reg11out, reg12out, reg13out, reg14out, reg15out, reg16out, reg17out, reg18out, reg19out, reg20out, reg21out, reg22out, reg23out, reg24out, reg25out, reg26out, reg27out, reg28out, reg29out, reg30out, reg31out);
  mux32to1by32 mux1(ReadData2, ReadRegister2, reg0out, reg1out, reg2out, reg3out, reg4out, reg5out, reg6out, reg7out, reg8out, reg9out, reg10out, reg11out, reg12out, reg13out, reg14out, reg15out, reg16out, reg17out, reg18out, reg19out, reg20out, reg21out, reg22out, reg23out, reg24out, reg25out, reg26out, reg27out, reg28out, reg29out, reg30out, reg31out);

endmodule
