//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "register32.v"
`include "register32zero.v"
`include "decoder1to32.v"
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
    wire [31:0] enable;
    wire [31:0] regout[31:0];
    genvar i;

    // Instantiate decoder
    decoder1to32 en_decoder(enable[31:0], RegWrite, WriteRegister);

    // First register is always zero
    register32zero register0(regout[0], WriteData, enable[0], Clk);
    generate
    for (i = 1; i < 32; i=i+1) begin : register_generate
        register32 register (regout[i], WriteData, enable[i], Clk);
    end
    endgenerate

    //Output Muxes
    mux32to1by32 mux_d1 (ReadData1, ReadRegister1,
                                    regout[0],
                                    regout[1],
                                    regout[2],
                                    regout[3],
                                    regout[4],
                                    regout[5],
                                    regout[6],
                                    regout[7],
                                    regout[8],
                                    regout[9],
                                    regout[10],
                                    regout[11],
                                    regout[12],
                                    regout[13],
                                    regout[14],
                                    regout[15],
                                    regout[16],
                                    regout[17],
                                    regout[18],
                                    regout[19],
                                    regout[20],
                                    regout[21],
                                    regout[22],
                                    regout[23],
                                    regout[24],
                                    regout[25],
                                    regout[26],
                                    regout[27],
                                    regout[28],
                                    regout[29],
                                    regout[30],
                                    regout[31]);
    mux32to1by32 mux_d2 (ReadData1, ReadRegister2,
                                    regout[0],
                                    regout[1],
                                    regout[2],
                                    regout[3],
                                    regout[4],
                                    regout[5],
                                    regout[6],
                                    regout[7],
                                    regout[8],
                                    regout[9],
                                    regout[10],
                                    regout[11],
                                    regout[12],
                                    regout[13],
                                    regout[14],
                                    regout[15],
                                    regout[16],
                                    regout[17],
                                    regout[18],
                                    regout[19],
                                    regout[20],
                                    regout[21],
                                    regout[22],
                                    regout[23],
                                    regout[24],
                                    regout[25],
                                    regout[26],
                                    regout[27],
                                    regout[28],
                                    regout[29],
                                    regout[30],
                                    regout[31]);
endmodule
