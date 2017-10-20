//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "decoders.v"
`include "register.v"
`include "mux.v"

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

//create register to assign 
  wire [31:0] activeregister;
  decoder1to32 decoder(activeregister, RegWrite, WriteRegister); 

  wire[31:0] q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15,q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31;


//Assign appropriate data to appropriate register
  register32zero register0(q0, WriteData, activeregister[0], Clk);
  register32 register1( q1,  WriteData, activeregister[1], Clk);
  register32 register2( q2,  WriteData, activeregister[2], Clk);
  register32 register3( q3,  WriteData, activeregister[3], Clk);
  register32 register4( q4,  WriteData, activeregister[4], Clk);
  register32 register5( q5,  WriteData, activeregister[5], Clk);
  register32 register6( q6,  WriteData, activeregister[6], Clk);
  register32 register7( q7,  WriteData, activeregister[7], Clk);
  register32 register8( q8,  WriteData, activeregister[8], Clk);
  register32 register9( q9,  WriteData, activeregister[9], Clk);
  register32 register10(q10, WriteData, activeregister[10], Clk);
  register32 register11(q11, WriteData, activeregister[11], Clk);
  register32 register12(q12, WriteData, activeregister[12], Clk);
  register32 register13(q13, WriteData, activeregister[13], Clk);
  register32 register14(q14, WriteData, activeregister[14], Clk);
  register32 register15(q15, WriteData, activeregister[15], Clk);
  register32 register16(q16, WriteData, activeregister[16], Clk);
  register32 register17(q17, WriteData, activeregister[17], Clk);
  register32 register18(q18, WriteData, activeregister[18], Clk);
  register32 register19(q19, WriteData, activeregister[19], Clk);
  register32 register20(q20, WriteData, activeregister[20], Clk);
  register32 register21(q21, WriteData, activeregister[21], Clk);
  register32 register22(q22, WriteData, activeregister[22], Clk);
  register32 register23(q23, WriteData, activeregister[23], Clk);
  register32 register24(q24, WriteData, activeregister[24], Clk);
  register32 register25(q25, WriteData, activeregister[25], Clk);
  register32 register26(q26, WriteData, activeregister[26], Clk);
  register32 register27(q27, WriteData, activeregister[27], Clk);
  register32 register28(q28, WriteData, activeregister[28], Clk);
  register32 register29(q29, WriteData, activeregister[29], Clk);
  register32 register30(q30, WriteData, activeregister[30], Clk);
  register32 register31(q31, WriteData, activeregister[31], Clk);

// Use MUX tp select registers to read
mux32to1by32 mux1(ReadData1, ReadRegister1, q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31 );

mux32to1by32 mux2(ReadData2, ReadRegister2, q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31);

endmodule