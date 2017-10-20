//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "registers.v"
`include "muxes.v"
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

  wire[31:0] interdecoder;
  wire[31:0] intermux[31:0];

  decoder1to32 decode(interdecoder, RegWrite, WriteRegister);

  register32zero register0 (intermux[0], WriteData, RegWrite, Clk);

  genvar i;
  generate
  for (i = 1; i < 32; i = i + 1)
    begin: ripple
      register32 register1(intermux[i], WriteData, interdecoder[i], Clk);
    end
  endgenerate

  mux32to1by32 mux1(ReadData1, ReadRegister1, intermux[0], intermux[1], intermux[2], intermux[3], intermux[4], intermux[5], intermux[6], intermux[7], intermux[8], intermux[9], intermux[10], intermux[11], intermux[12], intermux[13], intermux[14], intermux[15], intermux[16], intermux[17], intermux[18], intermux[19], intermux[20], intermux[21], intermux[22], intermux[23], intermux[24], intermux[25], intermux[26], intermux[27], intermux[28], intermux[29], intermux[30], intermux[31]);
  mux32to1by32 mux2(ReadData2, ReadRegister2, intermux[0], intermux[1], intermux[2], intermux[3], intermux[4], intermux[5], intermux[6], intermux[7], intermux[8], intermux[9], intermux[10], intermux[11], intermux[12], intermux[13], intermux[14], intermux[15], intermux[16], intermux[17], intermux[18], intermux[19], intermux[20], intermux[21], intermux[22], intermux[23], intermux[24], intermux[25], intermux[26], intermux[27], intermux[28], intermux[29], intermux[30], intermux[31]);

endmodule
