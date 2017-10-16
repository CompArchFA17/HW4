//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "register.v"
`include "decoders.v"
`include "multiplexers.v"


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

	//prepare to create decoder
	wire [31:0] dec_out;

	//prepare to create 32 registers, each 32-bit depth
	wire [31:0] reg0;
	wire [31:0] reg1;
	wire [31:0] reg2;
	wire [31:0] reg3;
	wire [31:0] reg4;
	wire [31:0] reg5;
	wire [31:0] reg6;
	wire [31:0] reg7;
	wire [31:0] reg8;
	wire [31:0] reg9;
	wire [31:0] reg10;
	wire [31:0] reg11;
	wire [31:0] reg12;
	wire [31:0] reg13;
	wire [31:0] reg14;
	wire [31:0] reg15;
	wire [31:0] reg16;
	wire [31:0] reg17;
	wire [31:0] reg18;
	wire [31:0] reg19;
	wire [31:0] reg20;
	wire [31:0] reg21;
	wire [31:0] reg22;
	wire [31:0] reg23;
	wire [31:0] reg24;
	wire [31:0] reg25;
	wire [31:0] reg26;
	wire [31:0] reg27;
	wire [31:0] reg28;
	wire [31:0] reg29;
	wire [31:0] reg30;
	wire [31:0] reg31;

	//create decoder for handling register writing
	decoder1to32 decoder(dec_out, RegWrite, WriteRegister); //out, enable, address

	//create registers themselves
	register32zero reg_0 (reg0, WriteData, decout[0], Clk); //zero register takes sets output to zero always.
	register32 reg_1 (reg1, WriteData, decout[1], Clk);
	register32 reg_2 (reg2, WriteData, decout[2], Clk);
	register32 reg_3 (reg3, WriteData, decout[3], Clk);
	register32 reg_4 (reg4, WriteData, decout[4], Clk);
	register32 reg_5 (reg5, WriteData, decout[5], Clk);
	register32 reg_6 (reg6, WriteData, decout[6], Clk);
	register32 reg_7 (reg7, WriteData, decout[7], Clk);
	register32 reg_8 (reg8, WriteData, decout[8], Clk);
	register32 reg_9 (reg9, WriteData, decout[9], Clk);
	register32 reg_10 (reg10, WriteData, decout[10], Clk);
	register32 reg_11 (reg11, WriteData, decout[11], Clk);
	register32 reg_12 (reg12, WriteData, decout[12], Clk);
	register32 reg_13 (reg13, WriteData, decout[13], Clk);
	register32 reg_14 (reg14, WriteData, decout[14], Clk);
	register32 reg_15 (reg15, WriteData, decout[15], Clk);
	register32 reg_16 (reg16, WriteData, decout[16], Clk);
	register32 reg_17 (reg17, WriteData, decout[17], Clk);
	register32 reg_18 (reg18, WriteData, decout[18], Clk);
	register32 reg_19 (reg19, WriteData, decout[19], Clk);
	register32 reg_20 (reg20, WriteData, decout[20], Clk);
	register32 reg_21 (reg21, WriteData, decout[21], Clk);
	register32 reg_22 (reg22, WriteData, decout[22], Clk);
	register32 reg_23 (reg23, WriteData, decout[23], Clk);
	register32 reg_24 (reg24, WriteData, decout[24], Clk);
	register32 reg_25 (reg25, WriteData, decout[25], Clk);
	register32 reg_26 (reg26, WriteData, decout[26], Clk);
	register32 reg_27 (reg27, WriteData, decout[27], Clk);
	register32 reg_28 (reg28, WriteData, decout[28], Clk);
	register32 reg_29 (reg29, WriteData, decout[29], Clk);
	register32 reg_30 (reg30, WriteData, decout[30], Clk);
	register32 reg_31 (reg31, WriteData, decout[31], Clk);

	//Data reading port 1
	//Based on MUX with appropriate output, address, and inputs
	mux32to1by32 mux1(
	
		ReadData1, ReadRegister1,
		reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7,
		reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15,
		reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23,
		reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31
	);


	//Data reading port 2
	//Based on MUX with appropriate output, address, and inputs
	mux32to1by32 mux2(
	
		ReadData2, ReadRegister2,
		reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7,
		reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15,
		reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23,
		reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31
	);

	
endmodule