module register(q,d,wrenable,clk);

	output reg q;
	input d;
	input wrenable;
	input clk;

    always @(posedge clk) begin
        if(wrenable) begin
            q = d;
        end
    end
endmodule

module register32(q,d,wrenable,clk);

	output reg [31:0] q;
	input [31:0] d;
	input wrenable;
	input clk;
	
	always @(posedge clk) begin
		if(wrenable) begin
			q = d;
		end
	end
endmodule

module register32zero(q,d,wrenable,clk);

	output [31:0] q;
	input [31:0] d;
	input wrenable;
	input clk;
	
	assign q = 32'b0;
	
endmodule

module mux32to1by1(out,address,inputs);
	
	output out;
	input [4:0] address;
	input [31:0] inputs;
	
	assign out  = inputs[address];
	
endmodule

module mux32to1by32(out,address,input31,input30,input29,input28,input27,input26,input25,input24,input23,input22,input21,input20,input19,input18,input17,input16,input15,input14,input13,input12,input11,input10,input9,input8,input7,input6,input5,input4,input3,input2,input1,input0);

  output [31:0] out;
  input [4:0] address;
  input [31:0] input31,input30,input29,input28,input27,input26,input25,input24,input23,input22,input21,input20,input19,input18,input17,input16,input15,input14,input13,input12,input11,input10,input9,input8,input7,input6,input5,input4,input3,input2,input1,input0;

  wire[31:0] mux[31:0];			// Create a 2D array of wires
  assign mux[0] = input0;
  assign mux[1] = input1;
  assign mux[2] = input2;
  assign mux[3] = input3;
  assign mux[4] = input4;
  assign mux[5] = input5;
  assign mux[6] = input6;
  assign mux[7] = input7;
  assign mux[8] = input8; 
  assign mux[9] = input9;
  assign mux[10] = input10;
  assign mux[11] = input11;
  assign mux[12] = input12;
  assign mux[13] = input13;
  assign mux[14] = input14;
  assign mux[15] = input15;
  assign mux[16] = input16;
  assign mux[17] = input17;
  assign mux[18] = input18; 
  assign mux[19] = input19; 
  assign mux[20] = input20;
  assign mux[21] = input21;
  assign mux[22] = input22;
  assign mux[23] = input23;
  assign mux[24] = input24;
  assign mux[25] = input25;
  assign mux[26] = input26;
  assign mux[27] = input27;
  assign mux[28] = input28; 
  assign mux[29] = input29;
  assign mux[30] = input30;
  assign mux[31] = input31;   
  assign out = mux[address];	// Connect the output of the array
  
endmodule

module decoder1to32(out,enable,address);
	
	output [31:0] out;
	input enable;
	input [4:0] address;
	
    assign out = enable<<address; 
	
endmodule

module regfile(ReadData1,ReadData2,WriteData,ReadRegister1,ReadRegister2,WriteRegister,RegWrite,Clk);

	output [31:0] ReadData1;      // Contents of first register read
	output [31:0] ReadData2;      // Contents of second register read
	input wire [31:0] WriteData;      // Contents to write to register
	input [4:0] ReadRegister1;  // Address of first register to read
	input [4:0] ReadRegister2;  // Address of second register to read
	input [4:0] WriteRegister;	// Address of register to write
	input RegWrite;       // Enable writing of register when HighClk 
	input Clk;            // Clock (Positive Edge Triggered)
	
	wire [31:0] EnOut,input31,input30,input29,input28,input27,input26,input25,input24,input23,input22,input21,input20,input19,input18,input17,input16,input15,input14,input13,input12,input11,input10,input9,input8,input7,input6,input5,input4,input3,input2,input1;
	
	decoder1to32 decoder(EnOut,RegWrite,WriteRegister);
	register32 register32_1(input1,WriteData,EnOut[1],Clk);
	register32 register32_2(input2,WriteData,EnOut[2],Clk);
	register32 register32_3(input3,WriteData,EnOut[3],Clk);
	register32 register32_4(input4,WriteData,EnOut[4],Clk);
	register32 register32_5(input5,WriteData,EnOut[5],Clk);
	register32 register32_6(input6,WriteData,EnOut[6],Clk);
	register32 register32_7(input7,WriteData,EnOut[7],Clk);
	register32 register32_8(input8,WriteData,EnOut[8],Clk);
	register32 register32_9(input9,WriteData,EnOut[9],Clk);
	register32 register32_10(input10,WriteData,EnOut[10],Clk);
	register32 register32_11(input11,WriteData,EnOut[11],Clk);
	register32 register32_12(input12,WriteData,EnOut[12],Clk);
	register32 register32_13(input13,WriteData,EnOut[13],Clk);
	register32 register32_14(input14,WriteData,EnOut[14],Clk);
	register32 register32_15(input15,WriteData,EnOut[15],Clk);
	register32 register32_16(input16,WriteData,EnOut[16],Clk);
	register32 register32_17(input17,WriteData,EnOut[17],Clk);
	register32 register32_18(input18,WriteData,EnOut[18],Clk);
	register32 register32_19(input19,WriteData,EnOut[19],Clk);
	register32 register32_20(input20,WriteData,EnOut[20],Clk);
	register32 register32_21(input21,WriteData,EnOut[21],Clk);
	register32 register32_22(input22,WriteData,EnOut[22],Clk);
	register32 register32_23(input23,WriteData,EnOut[23],Clk);
	register32 register32_24(input24,WriteData,EnOut[24],Clk);
	register32 register32_25(input25,WriteData,EnOut[25],Clk);
	register32 register32_26(input26,WriteData,EnOut[26],Clk);
	register32 register32_27(input27,WriteData,EnOut[27],Clk);
	register32 register32_28(input28,WriteData,EnOut[28],Clk);
	register32 register32_29(input29,WriteData,EnOut[29],Clk);
	register32 register32_30(input30,WriteData,EnOut[30],Clk);
	register32 register32_31(input31,WriteData,EnOut[31],Clk);
	mux32to1by32 mux32to1by32_1(ReadData1,ReadRegister1,input31,input30,input29,input28,input27,input26,input25,input24,input23,input22,input21,input20,input19,input18,input17,input16,input15,input14,input13,input12,input11,input10,input9,input8,input7,input6,input5,input4,input3,input2,input1,32'b0);
	mux32to1by32 mux32to1by32_2(ReadData2,ReadRegister2,input31,input30,input29,input28,input27,input26,input25,input24,input23,input22,input21,input20,input19,input18,input17,input16,input15,input14,input13,input12,input11,input10,input9,input8,input7,input6,input5,input4,input3,input2,input1,32'b0);
	
endmodule