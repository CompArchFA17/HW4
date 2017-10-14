# CompArch HW b0100: Register File #

### Jonah Spear

The purpose of this assignment is to build a 32 bit register in verilog. A 32 bit register is a type of memory that can hold 32 values of 32 bits each. The overall design of the register is as follows:
 
 
<img src="https://e38023e2-a-62cb3a1a-s-sites.googlegroups.com/site/ca15fall/resources/regfile.png?attachauth=ANoY7coxaffMnfwuftWJOBUSY8OdyOcpfSRp2MJMGS76O8AVIidsNCLx2synldoGKALHHXlA4n5YorYntr0jQ-oBuUX0N1rVOQOnK8ZmJ25513iH3ek-2tkEb28NN1C9iUZRQVvt4zpwB1txBKiNLXSDQ8Rb2GYo5VZNyvINrXv4SBmqHK5VPNngT5WzEyJapUDCQPcL86zR-MMyb1fKthgwZ8Q-6Y8JUg%3D%3D&attredirects=0" alt="Register File diagram">
 

Theoretically this would work – the clock signal would be steady `FALSE` when disabled, and only have positive edges when enabled.  However, "gating the clock" is a bad idea in practice – what happens if that enable signal has glitches?  Additionally, FPGAs are typically designed to only support a few distinct clocks.

### Deliverable 1 ###

Circuit diagram for two register implementations:
<img src="https://github.com/Joboman555/HW4/blob/master/RegComparison.jpg" alt="Register File diagram">

### Deliverables 2-5 ###

See containing files.

### Deliverable 6 ###

Given the following definition for a decoder, describe how this decoder works.

```verilog
module decoder1to32
(
output[31:0]  out,
input         enable,
input[4:0]    address
);
    assign out = enable<<address; 
endmodule
```

This shifts either 1 or 0 to the left by n bits, effectively setting the nth bit high.
 

### Deliverable 7 ###
Submit Verilog files that containing your register file and all supporting modules.  Note that Deliverable 8 will help you with this. 

### Deliverable 8 ###
Expand the provided test bench to catch register files with the following error types:

1. A fully perfect register file.  Return True when this is detected, false for all others.
1. Write Enable is broken / ignored – Register is always written to.
1. Decoder is broken – All registers are written to.
1. Register Zero is actually a register instead of the constant value zero.
1. Port 2 is broken and always reads register 14 (for example).

These will be graded by instantiating intentionally broken register files with your tester.  Your tester must return true (works!) or false (broken!) as appropriate.

It is to your advantage to test more than just these cases to better ensure that your good register file is actually good.

## Submission ##

Push your work to GitHub and submit a pull request to the course repo. You should include:
 - Verilog: top-level `regfile.v` and any supporting files
 - Test benches: `regfile.t.v` and any other testing files
 - Scripts to run your tests
 - "Report" with writing/drawing for deliverables 1 and 6
 
You can choose how to organize your Verilog modules (e.g. one module per file matching filename, all sizes of decoder grouped in `decoders.v`, something else) and testbenches, but the top-level of each must be named `regfile.v` and `regfile.t.v` as specified.

## Rubric ##
Code portions of this assignment will be checked automatically by scripts.  It is therefore critical to follow the module definitions exactly – same port definitions, same names.

| Deliverable |	Weight | Grading |
|-------------|--------|---------|
| 1 |	10	| Manual |
| 2	| 5	| Automatic |
| 3	| 5	| Automatic |
| 4	| 10	| Automatic |
| 5	| 10	| Automatic |
| 6	| 10	| Manual |
| 7	| 25	| Automatic |
| 8	| 25	| Automatic |
|  Total |	100	| |

## Notes ##
We are not doing any time delay related analysis for this assignment.  Please do not include time delays.
