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
 

## Submission ##

All tests are contained in regfile.t.v
