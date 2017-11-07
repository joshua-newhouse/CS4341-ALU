`include "adder16.v"
`include "mult16.v"
`include "and16.v"
`include "or16.v"
`include "xor16.v"
`include "not16.v"
`include "mux5way16.v"
`include "mux2way16.v"
`include "twos16.v"
`include "register16.v"
`include "register5.v"
`include "register1.v"

module ALU(
	input [15:0] in1, in2,
	input [4:0] opcode,		//00001 is add, 00010 is mult, 00100 is and, 01000 is or, 10000 is xor, and 00000 is clear
	input inv, sub, ovwA, clk,
	output [15:0] out, A,
	output zero, overflow, neg
	);

	wire [15:0] outTC, outADD, outM, outAND, outOR, outXOR, outMux, out, newA, B;
	wire [4:0] curOp;
	wire ofA, ofM;

	MUX2WAY16 mux2(out, in1, ovwA, newA);									//Overwrite the A register if they want to
	REGISTER16 a(newA, clk, A);
	REGISTER16 b(in2, clk, B);
	REGISTER5 op(opcode, clk, curOp);
	REGISTER1 inverse(inv, clk, curInv);
	REGISTER1 subtract(sub, clk, curSub);

	TWOS16 twos(B, curSub, outTC);											//Negate in2 if we're subtracting
	ADDER16 adder(A, outTC, outADD, ofA);									//Add in1 and in2, then save the result and if it overflowed
	MULT16 multiplier(A, B, outM, ofM);										//Multiply in1 and in2, then save the result and if it overflowed
	AND16 ander(A, B, outAND);												//Same as above, but with And
	OR16 orer(A, B, outOR);													//Now do Or
	XOR16 xorer(A, B, outXOR);												//Now Xor

	MUX5WAY16 mux5(outADD, outM, outAND, outOR, outXOR, curOp, outMux);		//Use a Mux and the opcode to determine which result we want

	NOT16 negator(outMux, curInv, out);										//Not the output if needed


	assign overflow = (curSub == 1 && curOp[0] == 1 ?						//I don't really understand this part
		0 : (ofA & curOp[0]) | (ofM & curOp[1]));
	assign zero = ~(|out);													//Or together all bits of out and not it to find out if the result is negative
	assign neg = ~ofA & curSub & curOp[0];									//I don't understand this either

endmodule
