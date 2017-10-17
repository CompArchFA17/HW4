`include "register.v"

module testregister();
	reg d_1bit, wrenable, clk;
    wire q_1bit;

    reg[31:0] d;
    wire[31:0] q;
    wire[31:0] q_zeroes;

    register reg_1bit(q_1bit, d_1bit, wrenable, clk);
    register32 reg_32bit(q, d, wrenable, clk);
    register32zero reg_zeroes(q_zeroes, d, wrenable, clk);
    
    initial begin 
    	$dumpfile("register.vcd");
    	$dumpvars(0,reg_1bit);
    	$display("register module");
    	d_1bit = 1'b1; wrenable = 1'b1; clk = 1'b1; #5000
	    $display("d_1bit: %b | wrenable: %b | clk = %b | q: %b", d_1bit, wrenable, clk, q_1bit);
    	
    	d_1bit = 1'b0; wrenable = 1'b1; clk = 1'b1; #5000
	    $display("d_1bit: %b | wrenable: %b | clk = %b | q: %b", d_1bit, wrenable, clk, q_1bit);
    	
    	d_1bit = 1'b1; wrenable = 1'b1; clk = 1'b1; #5000
	    $display("d_1bit: %b | wrenable: %b | clk = %b | q: %b", d_1bit, wrenable, clk, q_1bit);

    	d_1bit = 1'b0; wrenable = 1'b1; clk = 1'b1; #5000
	    $display("d_1bit: %b | wrenable: %b | clk = %b | q: %b", d_1bit, wrenable, clk, q_1bit);
	    $display("");
	    $display("register32 module");
	    // q is undefined at first
	    d = 32'b1; wrenable = 1'b1; clk = 1'b0; #5000
	    $display("d: %b | wrenable: %b | clk = %b | q: %b", d, wrenable, clk, q);
    	
    	d = 32'b0; wrenable = 1'b1; clk = 1'b0; #5000
	    $display("d: %b | wrenable: %b | clk = %b | q: %b", d, wrenable, clk, q);
    	
    	// q should change to d's value (10)
    	$display("Clock changes from 0 to 1: ");
    	d = 32'd10; wrenable = 1'b1; clk = 1'b1; #5000
	    $display("d: %b | wrenable: %b | clk = %b | q: %b", d, wrenable, clk, q);
	    // q should not change to d's value (stays at 10)
    	d = 32'b0; wrenable = 1'b1; clk = 1'b1; #5000
	    $display("d: %b | wrenable: %b | clk = %b | q: %b", d, wrenable, clk, q);
    	// q should change to d's value (0)
    	d = 32'b0; wrenable = 1'b1; clk = 1'b0; #5000
	    $display("d: %b | wrenable: %b | clk = %b | q: %b", d, wrenable, clk, q);

		$display("");
	    $display("register32zero module");
	    d = 32'b1; wrenable = 1'b1; clk = 1'b0; #5000
	    $display("d: %b | wrenable: %b | clk = %b | q: %b", d, wrenable, clk, q_zeroes);
	    d = 32'b0; wrenable = 1'b1; clk = 1'b1; #5000
	    $display("d: %b | wrenable: %b | clk = %b | q: %b", d, wrenable, clk, q_zeroes);

    end 
endmodule


