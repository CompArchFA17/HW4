#!/bin/bash
# Run the test scripts for the register file

make && 
./register_test &&
./mux_test &&
./decoder_test &&
./regfile_test