//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------
`include "register32.v";
`include "register32zero.v";
`include "decoders.v";
`include "mux32to1by32.v";

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

  genvar i;
  wire[31:0] whichWrite;
  reg [31:0] register[31:0];
  
  decoder1to32 chooseWrite(whichWrite, RegWrite, WriteRegister);
  for(i = 0; i < 32; i= i+1) begin
    register32 writeToReg(register[i], WriteData, whichWrite[i], Clk);
  end
  
  register32zero setZero(register[0], WriteData, 1, Clk); // Make sure register[0] is always zero
  
  mux32to1by32 read1(ReadData1, ReadRegister1, register[0],register[1], register[2], register[3], register[4], register[5], register[6], register[7], register[8], register[9], register[10], register[11], register[12], register[13], register[14], register[15], register[16], register[17], register[18], register[19], register[20], register[21], register[22], register[23], register[24], register[25], register[26], register[27], register[28], register[29], register[30],register[31]);
  mux32to1by32 read2(ReadData2, ReadRegister2, register[0],register[1], register[2], register[3], register[4], register[5], register[6], register[7], register[8], register[9], register[10], register[11], register[12], register[13], register[14], register[15], register[16], register[17], register[18], register[19], register[20], register[21], register[22], register[23], register[24], register[25], register[26], register[27], register[28], register[29], register[30],register[31]);

endmodule
