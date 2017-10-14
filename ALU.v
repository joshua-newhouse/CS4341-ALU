`include "adder16.v"
`include "mult16.v"
`include "and16.v"
`include "or16.v"
`include "xor16.v"
`include "not16.v"
`include "mux5way16.v"
`include "twos16.v"

module ALU(
	input [15:0] in1, in2,
	input [4:0] opcode,
	input inv, sub,
	output [15:0] out,
	output zero, overflow, neg
	);

	wire [15:0] outTC, outADD, outM, outAND, outOR, outXOR, outMux, out;
	wire ofA, ofM;

	TWOS16 twos(in2, sub, outTC);
	ADDER16 adder(in1, outTC, outADD, ofA);
	MULT16 multiplier(in1, in2, outM, ofM);
	AND16 ander(in1, in2, outAND);
	OR16 orer(in1, in2, outOR);
	XOR16 xorer(in1, in2, outXOR);

	MUX5WAY16 mux5(outADD, outM, outAND, outOR, outXOR, opcode, outMux);

	NOT16 negator(outMux, inv, out);

	assign overflow = sub == 1 && opcode[0] == 1 ?
		0 : (ofA & opcode[0]) | (ofM & opcode[1]);
	assign zero = ~(|out);
	assign neg = ~ofA & sub & opcode[0];

endmodule
