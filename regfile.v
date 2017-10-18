`include "register.v"
`include "mux.v"
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
   wire [31:0] 	d [31:0];
   
   genvar 	i;
   generate
      register32zero zeroreg(d[0], WriteData, 0, Clk);
      wire 	[31:0] expaddr;
      assign expaddr = 1 << WriteRegister;
      
      for(i = 1; i < (1<<5); i= i + 1) begin: registers
	 wire select, wrenable;
	 wire [4:0] addr ;
	 assign addr = i;
	 mux32to1by1 muxselect(select, addr, expaddr);
	 assign wrenable = select & RegWrite; 
	 register32 regist(d[i], WriteData, wrenable,Clk);
      end
   endgenerate
   mux32to1by32 read1(ReadData1, ReadRegister1, d[0], d[1], d[2], d[3], d[4], d[5], d[6], d[7], d[8], d[9], d[10], d[11], d[12], d[13], d[14], d[15], d[16], d[17], d[18], d[19], d[20], d[21], d[22], d[23], d[24], d[25], d[26], d[27], d[28], d[29], d[30], d[31]);
   mux32to1by32 read2(ReadData2, ReadRegister2, d[0], d[1], d[2], d[3], d[4], d[5], d[6], d[7], d[8], d[9], d[10], d[11], d[12], d[13], d[14], d[15], d[16], d[17], d[18], d[19], d[20], d[21], d[22], d[23], d[24], d[25], d[26], d[27], d[28], d[29], d[30], d[31]);
   
  // These two lines are clearly wrong.  They are included to showcase how the 
  // test harness works. Delete them after you understand the testing process, 
  // and replace them with your actual code.
  //assign ReadData1 = 42;
  //assign ReadData2 = 42;

endmodule
