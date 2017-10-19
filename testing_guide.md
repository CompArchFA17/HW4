# How to Run Tests
## Getting Started
Before being able to run tests, you must compile the verilog files.
To do this, at the command line enter the command `make` This will
compile any of the necessary files to create 4 executables: 
* `register_test` unit tests for the register modules.
* `mux_test` unit test for the multiplexer module.
* `decoder_test` unit tests fot the decoder modules.
* `regfile_test` the testbench for the entire register file.

# Run Single Test
Enter the command
```bash
./<binary>
```

To run a single file once it has been compiled. If all unit tests pass, nothing will be printed to the terminal. The testbench will print "DUT passed? 1" if all tests in the testbench pass. A notice that one or more tests failed will be printed to the terminal otherwise.

## Run All Tests
The script `run_tests.sh` will compile and run all of the tests at once

If you are running the script for the first time, you will need to type
```bash
chmod 755 run_tests.sh
```
In order to gain permission to run the script.

Once you have gained permission run:
```bash
./run_tests.sh
```

If all tests pass, the only output to the terminal from the script will be any commands run from the makefile and "DUT passed? 1". Otherwise, notice that one or more tests failed will be printed to the terminal.