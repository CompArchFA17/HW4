# Writeup HW 4
## Deliverable 1
![diagrams](https://github.com/TShapinsky/HW4/blob/master/diagrams.jpg?raw=true)
## Deliverable 6
```verilog
    assign out = enable<<address; 
```
Acts as a decoder because the bitshift operator is defined as shifting all the bits of a number over by n bits. In this case we are shifting `enable`, this means that if enable is low the output will always be 0 (this is the expected value) and if it is high the output will be a 1 in the bit equal to the input address. 
