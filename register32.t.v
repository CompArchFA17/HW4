// 1 Bit alu test bench
`timescale 1 ns / 1 ps
`include "register32.v"

module testRegister32 ();
  wire[31:0] out;
  reg[31:0] in;
  reg wrenable, clk;

  register32 register (out,in,wrenable,clk);

  integer tests = 0;
  integer passed_tests = 0;

  function integer test;
    input test_case;
    integer test_case;
    begin
      tests = tests + 1;
      if (test_case) begin
        test = 1;
        $display("Passed test with: %b %b | %b", in, wrenable, out);
      end
      else begin
        test = 0;
        $display("Failed test with: %b %b | %b*", in, wrenable, out);
      end
    end
  endfunction

  initial begin

    in = 4'b0000;
    wrenable = 1;
    #5 clk = 0; #5 clk=1;
    passed_tests = test(out == in);
    // Test ADD
    // $display("ADD:");
    // op=3'b000;
    // // without cin
    // cin = 0;
    // for (i=0; i<2; i=i+1) begin
    //     for (j=0; j<2; j=j+1) begin
    //         a=i;b=j;#1000
    //         tests = tests + 1;
    //         if (((a + b) == out) & ((a & b) == cout)) begin
    //             passed_tests = passed_tests + 1;
    //             $display("Passed test with: %b  %b  %b  %b | %b  %b", op, a, b, cin, out, cout);
    //         end
    //         else begin
    //             $display("Failed test with: %b  %b  %b  %b | %b  %b*", op, a, b, cin, out, cout); end
    //     end
    // end
    // // with cin
    // cin = 1;
    // for (i=0; i<2; i=i+1) begin
    //     for (j=0; j<2; j=j+1) begin
    //         a=i;b=j;#1000
    //         tests = tests + 1;
    //         if (((a ~^ b) == out) & ((a | b) == cout)) begin
    //             passed_tests = passed_tests + 1;
    //             $display("Passed test with: %b  %b  %b  %b | %b  %b", op, a, b, cin, out, cout);
    //         end
    //         else begin
    //             $display("Failed test with: %b  %b  %b  %b | %b  %b*", op, a, b, cin, out, cout);
    //         end
    //     end
    // end

    // // Test SUB
    // $display("SUB:");
    // op=3'b001;
    // // without cin
    // cin = 0;
    // for (i=0; i<2; i=i+1) begin
    //     for (j=0; j<2; j=j+1) begin
    //         a=i;b=j;#1000
    //         tests = tests + 1;
    //         if (((a - b) == out) & ((a < b) == cout)) begin
    //             passed_tests = passed_tests + 1;
    //             $display("Passed test with: %b  %b  %b  %b | %b  %b", op, a, b, cin, out, cout);
    //         end
    //         else begin
    //             $display("Failed test with: %b  %b  %b  %b | %b  %b*", op, a, b, cin, out, cout);
    //         end
    //     end
    // end
    // // with cin
    // cin = 1;
    // for (i=0; i<2; i=i+1) begin
    //     for (j=0; j<2; j=j+1) begin
    //         a=i;b=j;#1000
    //         tests = tests + 1;
    //         if (((a ~^ b) == out) & ((a <= b) == cout)) begin
    //             passed_tests = passed_tests + 1;
    //             $display("Passed test with: %b  %b  %b  %b | %b  %b", op, a, b, cin, out, cout);
    //         end
    //         else begin
    //             $display("Failed test with: %b  %b  %b  %b | %b  %b*", op, a, b, cin, out, cout);
    //         end
    //     end
    // end


    // // Test XOR
    // $display("XOR:");
    // op=3'b010; cin = 0;
    // for (i=0; i<2; i=i+1) begin
    //     for (j=0; j<2; j=j+1) begin
    //         a=i;b=j;#1000
    //         tests = tests + 1;
    //         if ((a ^ b) == out) begin
    //             passed_tests = passed_tests + 1;
    //             $display("Passed test with: %b  %b  %b  %b | %b  %b", op, a, b, cin, out, cout);
    //         end
    //         else begin
    //             $display("Failed test with: %b  %b  %b  %b | %b  %b*", op, a, b, cin, out, cout);
    //         end
    //     end
    // end

    // //Test SLT
    // $display("SLT:");
    // op=3'b001;
    // // without cin
    // cin = 0;
    // for (i=0; i<2; i=i+1) begin
    //     for (j=0; j<2; j=j+1) begin
    //         a=i;b=j;#1000
    //         tests = tests + 1;
    //         if (((a - b) == out) & ((a < b) == cout)) begin
    //             passed_tests = passed_tests + 1;
    //             $display("Passed test with: %b  %b  %b  %b | %b  %b", op, a, b, cin, out, cout);
    //         end
    //         else begin
    //             $display("Failed test with: %b  %b  %b  %b | %b  %b*", op, a, b, cin, out, cout);
    //         end
    //     end
    // end
    // // with cin
    // cin = 1;
    // for (i=0; i<2; i=i+1) begin
    //     for (j=0; j<2; j=j+1) begin
    //         a=i;b=j;#1000
    //         tests = tests + 1;
    //         if (((a ~^ b) == out) & ((a <= b) == cout)) begin
    //             passed_tests = passed_tests + 1;
    //             $display("Passed test with: %b  %b  %b  %b | %b  %b", op, a, b, cin, out, cout);
    //         end
    //         else begin
    //             $display("Failed test with: %b  %b  %b  %b | %b  %b*", op, a, b, cin, out, cout);
    //         end
    //     end
    // end

    // // Test AND
    // $display("AND:");
    // op=3'b100; cin = 0;
    // for (i=0; i<2; i=i+1) begin
    //     for (j=0; j<2; j=j+1) begin
    //         a=i;b=j;#1000
    //         tests = tests + 1;
    //         if ((a & b) == out) begin
    //             passed_tests = passed_tests + 1;
    //             $display("Passed test with: %b  %b  %b  %b | %b  %b", op, a, b, cin, out, cout);
    //         end
    //         else begin
    //             $display("Failed test with: %b  %b  %b  %b | %b  %b*", op, a, b, cin, out, cout);
    //         end
    //     end
    // end

    // // Test NAND
    // $display("NAND:");
    // op=3'b101; cin = 0;
    // for (i=0; i<2; i=i+1) begin
    //     for (j=0; j<2; j=j+1) begin
    //         a=i;b=j;#1000
    //         tests = tests + 1;
    //         if (~(a&b) == out) begin
    //             passed_tests = passed_tests + 1;
    //             $display("Passed test with: %b  %b  %b  %b | %b  %b", op, a, b, cin, out, cout);
    //         end
    //         else begin
    //             $display("Failed test with: %b  %b  %b  %b | %b  %b*", op, a, b, cin, out, cout);
    //         end
    //     end
    // end

    // // Test NOR
    // $display("NOR:");
    // op=3'b110; cin = 0;
    // for (i=0; i<2; i=i+1) begin
    //     for (j=0; j<2; j=j+1) begin
    //         a=i;b=j;#1000
    //         tests = tests + 1;
    //         if ((a ~| b) == out) begin
    //             passed_tests = passed_tests + 1;
    //             $display("Passed test with: %b  %b  %b  %b | %b  %b", op, a, b, cin, out, cout);
    //         end
    //         else begin
    //             $display("Failed test with: %b  %b  %b  %b | %b  %b*", op, a, b, cin, out, cout);
    //         end
    //     end
    // end

    // // Test OR
    // $display("OR:");
    // op=3'b111; cin = 0;
    // for (i=0; i<2; i=i+1) begin
    //     for (j=0; j<2; j=j+1) begin
    //         a=i;b=j;#1000
    //         tests = tests + 1;
    //         if ((a|b) == out) begin
    //             passed_tests = passed_tests + 1;
    //             $display("Passed test with: %b  %b  %b  %b | %b  %b", op, a, b, cin, out, cout);
    //         end
    //         else begin
    //             $display("Failed test with: %b  %b  %b  %b | %b  %b*", op, a, b, cin, out, cout);
    //         end
    //     end
    // end
    // $display("                  op   a  b cin|out cout ");

    $display("%2d/%2d Test Cases Passed", passed_tests, tests);

    end
endmodule
