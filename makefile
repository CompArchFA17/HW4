all: register_test mux_test decoder_test regfile_test

register_test: register.t.v register.v
	iverilog -Wall -o register_test register.t.v
mux_test: multiplexer.t.v multiplexer.v
	iverilog -Wall -o mux_test multiplexer.t.v
decoder_test: decoders.t.v decoders.v
	iverilog -Wall -o decoder_test decoders.t.v
regfile_test: regfile.t.v regfile.v register.v multiplexer.v decoders.v
	iverilog -Wall -o regfile_test regfile.t.v
