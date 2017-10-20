#!/bin/bash
# Compile and run the test modules for the register file.

echo "building tests..."
make &&
echo "running register unit tests..." &&
./register_test &&
echo "running multiplexer unit tests..." &&
./mux_test &&
echo "running decoder unit tests..." &&
./decoder_test &&
echo "running regfile test bench..." &&
./regfile_test