//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "register.v"
`include "decoders.v"
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
  wire[31:0] regouts[31:0];
  wire[31:0] regselect;

  register32zero reg0(regouts[0], WriteData, regselect[0], Clk);
  genvar i;
  generate
  	for (i = 1; i < 32; i = i + 1)
  	begin: createregisters
  		register32 areg(regouts[i], WriteData, regselect[i], Clk);
  	end
  endgenerate

  decoder1to32 decoder(regselect, RegWrite, WriteRegister);
  mux32to1by32 mux1(ReadData1, ReadRegister1, regouts);
  mux32to1by32 mux2(ReadData2, ReadRegister2, regouts);

endmodule