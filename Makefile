make_and_test:
	iverilog -o regfile regfile.t.v
	./regfile

