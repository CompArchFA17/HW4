//------------------------------------------------------------------------------
// Test harness validates hw4testbench by connecting it to various functional
// or broken register files, and verifying that it correctly identifies each
//------------------------------------------------------------------------------

`include "regfile.v"

module hw4testbenchharness();

  wire[31:0]	ReadData1;	// Data from first register read
  wire[31:0]	ReadData2;	// Data from second register read
  wire[31:0]	WriteData;	// Data to write to register
  wire[4:0]	ReadRegister1;	// Address of first register to read
  wire[4:0]	ReadRegister2;	// Address of second register to read
  wire[4:0]	WriteRegister;  // Address of register to write
  wire		RegWrite;	// Enable writing of register when High
  wire		Clk;		// Clock (Positive Edge Triggered)

  reg		begintest;	// Set High to begin testing register file
  wire		dutpassed;	// Indicates whether register file passed tests

  // Instantiate the register file being tested.  DUT = Device Under Test
  regfile DUT
  (
    .ReadData1(ReadData1),
    .ReadData2(ReadData2),
    .WriteData(WriteData),
    .ReadRegister1(ReadRegister1),
    .ReadRegister2(ReadRegister2),
    .WriteRegister(WriteRegister),
    .RegWrite(RegWrite),
    .Clk(Clk)
  );

  // Instantiate test bench to test the DUT
  hw4testbench tester
  (
    .begintest(begintest),
    .endtest(endtest),
    .dutpassed(dutpassed),
    .ReadData1(ReadData1),
    .ReadData2(ReadData2),
    .WriteData(WriteData),
    .ReadRegister1(ReadRegister1),
    .ReadRegister2(ReadRegister2),
    .WriteRegister(WriteRegister),
    .RegWrite(RegWrite),
    .Clk(Clk)
  );

  // Test harness asserts 'begintest' for 1000 time steps, starting at time 10
  initial begin
    begintest=0;
    #10;
    begintest=1;
    #1000;
  end

  // Display test results ('dutpassed' signal) once 'endtest' goes high
  always @(posedge endtest) begin
    $display("DUT passed?: %b", dutpassed);
  end

endmodule


//------------------------------------------------------------------------------
// Your HW4 test bench
//   Generates signals to drive register file and passes them back up one
//   layer to the test harness. This lets us plug in various working and
//   broken register files to test.
//
//   Once 'begintest' is asserted, begin testing the register file.
//   Once your test is conclusive, set 'dutpassed' appropriately and then
//   raise 'endtest'.
//------------------------------------------------------------------------------

module hw4testbench
(
// Test bench driver signal connections
input	   		begintest,	// Triggers start of testing
output reg 		endtest,	// Raise once test completes
output reg 		dutpassed,	// Signal test result

// Register File DUT connections
input[31:0]		ReadData1,
input[31:0]		ReadData2,
output reg[31:0]	WriteData,
output reg[4:0]		ReadRegister1,
output reg[4:0]		ReadRegister2,
output reg[4:0]		WriteRegister,
output reg		RegWrite,
output reg		Clk
);

  // Initialize register driver signals
  initial begin
    WriteData=32'd0;
    ReadRegister1=5'd0;
    ReadRegister2=5'd0;
    WriteRegister=5'd0;
    RegWrite=0;
    Clk=0;
  end

  // Once 'begintest' is asserted, start running test cases
  always @(posedge begintest) begin
    endtest = 0;
    dutpassed = 1;
    #10

  // All test cases also test if any of the data is x's, as suggested by Will Derksen,
  // because apparently x's will still pass an equivalence test in Verilog. I felt that
  // this additional test is necessary because depending on the way something is broken,
  // there might be something set to x and that will still be considered True (unbroken).

  // Test Case 1:
  //   Write '42' to register 2, verify with Read Ports 1 and 2
  //   (Passes because example register file is hardwired to return 42)
  WriteRegister = 5'd2;
  WriteData = 32'd42;
  RegWrite = 1;
  ReadRegister1 = 5'd2;
  ReadRegister2 = 5'd2;
  #5 Clk=1; #5 Clk=0;	// Generate single clock pulse

  // Verify expectations and report test result
  if((ReadData1 != 42) || (ReadData2 != 42) || (ReadData1 === 32'bx) || (ReadData2 === 32'bx)) begin
    dutpassed = 0;	// Set to 'false' on failure
    $display("Test Case 1 Failed");
  end

  // Test Case 2:
  //   Write '15' to register 2, verify with Read Ports 1 and 2
  //   (Fails with example register file, but should pass with yours)
  WriteRegister = 5'd2;
  WriteData = 32'd15;
  RegWrite = 1;
  ReadRegister1 = 5'd2;
  ReadRegister2 = 5'd2;
  #5 Clk=1; #5 Clk=0;

  if((ReadData1 != 15) || (ReadData2 != 15) || (ReadData1 === 32'bx) || (ReadData2 === 32'bx)) begin
    dutpassed = 0;
    $display("Test Case 2 Failed");
  end

  // Test Case 3a:
  // Write '40' to register 2, RegWrite is '1', verify with Read Ports 1 and 2
  WriteRegister = 5'd2;
  WriteData = 32'd40;
  RegWrite = 1;
  ReadRegister1 = 5'd2;
  ReadRegister2 = 5'd2;
  #5 Clk=1; #5 Clk=0;

  if((ReadData1 != 40) || (ReadData2 != 40) || (ReadData1 === 32'bx) || (ReadData2 === 32'bx)) begin
    dutpassed = 0;
    $display("Test Case 3a Failed");
  end

  // Write Enable is broken / ignored – Register is always written to.
  // Write '10' to register 2, RegWrite is '0', verify with Read Ports 1 and 2
  WriteRegister = 5'd2;
  WriteData = 32'd10;
  RegWrite = 0;
  ReadRegister1 = 5'd2;
  ReadRegister2 = 5'd2;
  #5 Clk=1; #5 Clk=0;

  if((ReadData1 == 10) || (ReadData2 == 10) || (ReadData1 === 32'bx) || (ReadData2 === 32'bx)) begin
    dutpassed = 0;
    $display("Test Case 3b Failed");
  end

  // Test Case 4:
  // Decoder is broken – All registers are written to
  // Write '11' to register 2, don't write '11' to register 4, verify with Read Ports 1 and 2
  // I don't check whether Port 2 is all x's because in this case I only care if it is equal to 11,
  // and then it fails - it doesn't matter if nothing it written to it/if it is x's.
  WriteRegister = 5'd2;
  WriteData = 32'd11;
  RegWrite = 1;
  ReadRegister1 = 5'd2;
  ReadRegister2 = 5'd4;
  #5 Clk=1; #5 Clk=0;

  if((ReadData1 != 11) || (ReadData2 == 11) || (ReadData1 === 32'bx)) begin
    dutpassed = 0;
    $display("Test Case 4 Failed");
  end

  // Test Case 5:
  // Register Zero is actually a register instead of the constant value zero.
  // Write '12' to register 0, verify with Read Ports 1 and 2
  // I don't care about Port 2 being x's in this case - only Port 1 which is
  // writing to Register Zero
  WriteRegister = 5'd0;
  WriteData = 32'd12;
  RegWrite = 1;
  ReadRegister1 = 5'd0;
  ReadRegister2 = 5'd4;
  #5 Clk=1; #5 Clk=0;

  if((ReadData1 != 0) || (ReadData1 === 32'bx)) begin
    dutpassed = 0;
    $display("Test Case 5 Failed");
  end

  // Test Case 6:
  // Port 2 is broken and always reads register 14 (for example)
  // Write '10' to register 2, verify with Read Ports 1
  WriteRegister = 5'd14;
  WriteData = 32'd13;
  RegWrite = 1;
  ReadRegister1 = 5'd2;
  ReadRegister2 = 5'd14;
  #5 Clk=1; #5 Clk=0;

  if((ReadData1 == 13) || (ReadData1 === 32'bx) || (ReadData2 === 32'bx)) begin
    dutpassed = 0;
    $display("Test Case 6 Failed");
  end

  // All done!  Wait a moment and signal test completion.
  #5
  endtest = 1;

end

endmodule
