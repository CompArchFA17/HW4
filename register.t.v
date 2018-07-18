`timescale 1 ns / 1 ps
`include "register.v"

module test32BitRegister ();
    reg[31:0] d;
    reg wrenable, clk;
    wire[31:0] q;
    wire[31:0] zeroQ;

    register32 register (q, d, wrenable, clk);
    register32zero zeroRegister (zeroQ, d, wrenable, clk);

    initial begin
    $display("d   wrenable   clk   |    q");
    d=32'b00000000000000000000000000000001;wrenable=1;clk=1; #1000
    $display("%b   %b   %b   |   %b", d, wrenable, clk, q);

    d=32'b00000000000000000000000000000011;wrenable=1;clk=0; #1000
    $display("%b   %b   %b   |   %b", d, wrenable, clk, q);

    $display("testing zero register");
    d=32'b00000000000000000000000000000001;wrenable=1;clk=1; #1000
    $display("%b   %b   %b   |   %b", d, wrenable, clk, zeroQ);
    end
endmodule
