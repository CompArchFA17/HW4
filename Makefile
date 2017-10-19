test: build
	./regfile

build: regfile.t.v regfile.v gates.v register.v decoders.v
	iverilog -o regfile regfile.t.v

clean:
	rm alu
