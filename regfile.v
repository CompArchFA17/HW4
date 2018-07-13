//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------


`include "register.v"
`include "mux.v"
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

// create the decoder
	wire[31:0] decoderout;
	decoder1to32 decode(decoderout, RegWrite, WriteRegister);
	
	// going to want to generate 32 registers, where register0 always outputs 0 and the other registers all behave normally.

	// also need to create the outputs of the register/inputs for the mux
	wire [31:0] InForMux0;
	wire [31:0] InForMux1;
	wire [31:0] InForMux2;
	wire [31:0] InForMux3;
	wire [31:0] InForMux4;
	wire [31:0] InForMux5;
	wire [31:0] InForMux6;
	wire [31:0] InForMux7;
	wire [31:0] InForMux8;
	wire [31:0] InForMux9;
	wire [31:0] InForMux10;
	wire [31:0] InForMux11;
	wire [31:0] InForMux12;
	wire [31:0] InForMux13;
	wire [31:0] InForMux14;
	wire [31:0] InForMux15;
	wire [31:0] InForMux16;
	wire [31:0] InForMux17;
	wire [31:0] InForMux18;
	wire [31:0] InForMux19;
	wire [31:0] InForMux20;
	wire [31:0] InForMux21;
	wire [31:0] InForMux22;
	wire [31:0] InForMux23;
	wire [31:0] InForMux24;
	wire [31:0] InForMux25;
	wire [31:0] InForMux26;
	wire [31:0] InForMux27;
	wire [31:0] InForMux28;
	wire [31:0] InForMux29;
	wire [31:0] InForMux30;
	wire [31:0] InForMux31;

	register32zero  reg0(InForMux0, WriteData, decoderout[0], Clk);
	register32 	reg1(InForMux1, WriteData, decoderout[1], Clk);
	register32 	reg2(InForMux2, WriteData, decoderout[2], Clk);
	register32 	reg3(InForMux3, WriteData, decoderout[3], Clk);
	register32 	reg4(InForMux4, WriteData, decoderout[4], Clk);
	register32 	reg5(InForMux5, WriteData, decoderout[5], Clk);
	register32 	reg6(InForMux6, WriteData, decoderout[6], Clk);
	register32 	reg7(InForMux7, WriteData, decoderout[7], Clk);
	register32 	reg8(InForMux8, WriteData, decoderout[8], Clk);
	register32 	reg9(InForMux9, WriteData, decoderout[9], Clk);
	register32 	reg10(InForMux10, WriteData, decoderout[10], Clk);
	register32 	reg11(InForMux11, WriteData, decoderout[11], Clk);
	register32 	reg12(InForMux12, WriteData, decoderout[12], Clk);
	register32 	reg13(InForMux13, WriteData, decoderout[13], Clk);
	register32 	reg14(InForMux14, WriteData, decoderout[14], Clk);
	register32 	reg15(InForMux15, WriteData, decoderout[15], Clk);
	register32 	reg16(InForMux16, WriteData, decoderout[16], Clk);
	register32 	reg17(InForMux17, WriteData, decoderout[17], Clk);
	register32 	reg18(InForMux18, WriteData, decoderout[18], Clk);
	register32 	reg19(InForMux19, WriteData, decoderout[19], Clk);
	register32 	reg20(InForMux20, WriteData, decoderout[20], Clk);
	register32 	reg21(InForMux21, WriteData, decoderout[21], Clk);
	register32 	reg22(InForMux22, WriteData, decoderout[22], Clk);
	register32 	reg23(InForMux23, WriteData, decoderout[23], Clk);
	register32 	reg24(InForMux24, WriteData, decoderout[24], Clk);
	register32 	reg25(InForMux25, WriteData, decoderout[25], Clk);
	register32 	reg26(InForMux26, WriteData, decoderout[26], Clk);
	register32 	reg27(InForMux27, WriteData, decoderout[27], Clk);
	register32 	reg28(InForMux28, WriteData, decoderout[28], Clk);
	register32 	reg29(InForMux29, WriteData, decoderout[29], Clk);
	register32 	reg30(InForMux30, WriteData, decoderout[30], Clk);
	register32 	reg31(InForMux31, WriteData, decoderout[31], Clk);

	
// Use the muxes to get two outputs - ReadData1 and ReadData2
	mux32to1by32 mux1(ReadData1, ReadRegister1, InForMux0, InForMux1, InForMux2, InForMux3, InForMux4, InForMux5, InForMux6, InForMux7, InForMux8, InForMux9, InForMux10, InForMux11, InForMux12, InForMux13, InForMux14, InForMux15, InForMux16, InForMux17, InForMux18, InForMux19, InForMux20, InForMux21, InForMux22, InForMux23, InForMux24, InForMux25, InForMux26, InForMux27, InForMux28, InForMux29, InForMux30, InForMux31);

	mux32to1by32 mux2(ReadData2, ReadRegister2, InForMux0, InForMux1, InForMux2, InForMux3, InForMux4, InForMux5, InForMux6, InForMux7, InForMux8, InForMux9, InForMux10, InForMux11, InForMux12, InForMux13, InForMux14, InForMux15, InForMux16, InForMux17, InForMux18, InForMux19, InForMux20, InForMux21, InForMux22, InForMux23, InForMux24, InForMux25, InForMux26, InForMux27, InForMux28, InForMux29, InForMux30, InForMux31);

endmodule
