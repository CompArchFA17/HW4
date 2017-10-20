//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------
`include "mux32to1by32.v"
`include "decoders.v"
`include "register32.v"
`include "register32zero.v"

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

  wire [31:0] allregs [0:31];// = {31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0, 31'b0};

  mux32to1by32 rreg1 (ReadData1, ReadRegister1, allregs[0], allregs[1], allregs[2], allregs[3], allregs[4], allregs[5], allregs[6], allregs[7], allregs[8], allregs[9], allregs[10], allregs[11], allregs[12], allregs[13], allregs[14], allregs[15], allregs[16], allregs[17], allregs[18], allregs[19], allregs[20], allregs[21], allregs[22], allregs[23], allregs[24], allregs[25], allregs[26], allregs[27], allregs[28], allregs[29], allregs[30], allregs[31]);

  mux32to1by32 rreg2 (ReadData2, ReadRegister2, allregs[0], allregs[1], allregs[2], allregs[3], allregs[4], allregs[5], allregs[6], allregs[7], allregs[8], allregs[9], allregs[10], allregs[11], allregs[12], allregs[13], allregs[14], allregs[15], allregs[16], allregs[17], allregs[18], allregs[19], allregs[20], allregs[21], allregs[22], allregs[23], allregs[24], allregs[25], allregs[26], allregs[27], allregs[28], allregs[29], allregs[30], allregs[31]);

  wire[31:0] write;
  decoder1to32 wreg (write, RegWrite, WriteRegister);
  register32zero zeroreg (allregs[0], WriteData, write[0], Clk);
  register32 reg1 (allregs[1], WriteData, write[1], Clk);
  register32 reg2 (allregs[2], WriteData, write[2], Clk);
  register32 reg3 (allregs[3], WriteData, write[3], Clk);
  register32 reg4 (allregs[4], WriteData, write[4], Clk);
  register32 reg5 (allregs[5], WriteData, write[5], Clk);
  register32 reg6 (allregs[6], WriteData, write[6], Clk);
  register32 reg7 (allregs[7], WriteData, write[7], Clk);
  register32 reg8 (allregs[8], WriteData, write[8], Clk);
  register32 reg9 (allregs[9], WriteData, write[9], Clk);
  register32 reg10 (allregs[10], WriteData, write[10], Clk);
  register32 reg11 (allregs[11], WriteData, write[11], Clk);
  register32 reg12 (allregs[12], WriteData, write[12], Clk);
  register32 reg13 (allregs[13], WriteData, write[13], Clk);
  register32 reg14 (allregs[14], WriteData, write[14], Clk);
  register32 reg15 (allregs[15], WriteData, write[15], Clk);
  register32 reg16 (allregs[16], WriteData, write[16], Clk);
  register32 reg17 (allregs[17], WriteData, write[17], Clk);
  register32 reg18 (allregs[18], WriteData, write[18], Clk);
  register32 reg19 (allregs[19], WriteData, write[19], Clk);
  register32 reg20 (allregs[20], WriteData, write[20], Clk);
  register32 reg21 (allregs[21], WriteData, write[21], Clk);
  register32 reg22 (allregs[22], WriteData, write[22], Clk);
  register32 reg23 (allregs[23], WriteData, write[23], Clk);
  register32 reg24 (allregs[24], WriteData, write[24], Clk);
  register32 reg25 (allregs[25], WriteData, write[25], Clk);
  register32 reg26 (allregs[26], WriteData, write[26], Clk);
  register32 reg27 (allregs[27], WriteData, write[27], Clk);
  register32 reg28 (allregs[28], WriteData, write[28], Clk);
  register32 reg29 (allregs[29], WriteData, write[29], Clk);
  register32 reg30 (allregs[30], WriteData, write[30], Clk);
  register32 reg31 (allregs[31], WriteData, write[31], Clk);
endmodule
