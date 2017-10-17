#!/bin/bash

iverilog -Wall -o regfile.out regfile.t.v
vvp regfile.out
