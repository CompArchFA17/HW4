`include "gates.v"

//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

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
  wire[31:0] wrEn;
  wire[31:0] bus[31:0];
  decoder1to32 wrEnDecode(wrEn, RegWrite, WriteRegister);
  mux32to1by32 port1Mux(ReadData1, ReadRegister1, bus[0],  bus[1],  bus[2],  bus[3],  bus[4],  bus[5],  bus[6],  bus[7],
                                                      bus[8], bus[9],  bus[10],  bus[11],  bus[12],  bus[13],  bus[14],  bus[15],
                                                      bus[16],  bus[17],  bus[18],  bus[19],  bus[20],  bus[21],  bus[22],  bus[23],
                                                      bus[24],  bus[25],  bus[26],  bus[27],  bus[28],  bus[29],  bus[30],  bus[31]);
  mux32to1by32 port2Mux(ReadData2, ReadRegister2, bus[0],  bus[1],  bus[2],  bus[3],  bus[4],  bus[5],  bus[6],  bus[7],
                                                      bus[8], bus[9],  bus[10],  bus[11],  bus[12],  bus[13],  bus[14],  bus[15],
                                                      bus[16],  bus[17],  bus[18],  bus[19],  bus[20],  bus[21],  bus[22],  bus[23],
                                                      bus[24],  bus[25],  bus[26],  bus[27],  bus[28],  bus[29],  bus[30],  bus[31]);

  register32zero zeroReg(bus[0], WriteData, wrEn[0], Clk);
  generate
    for(i=1; i<32; i=i+1) begin: registers
      register32 reg_inst(bus[i], WriteData, wrEn[i], Clk);
    end
  endgenerate
endmodule
