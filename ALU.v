`include "adder16.v"
`include "mult16.v"
`include "and16.v"
`include "or16.v"
`include "xor16.v"
`include "not16.v"
`include "mux5way16.v"
`include "mux3way16.v"
`include "twos16.v"
`include "register16.v"
`include "register5.v"
`include "register1.v"

module ALU(
	input [15:0] in1, in2,
	input [4:0] opcode,		//00001 is add, 00010 is mult, 00100 is and, 01000 is or, 10000 is xor, and 00000 is clear
	input inv, sub, clk, rst,
	input [1:0] loadA,
	output [15:0] out, A, B,
	output zero, overflow, neg
	);

	wire [15:0] outTC, outADD, outM, outAND, outOR, outXOR, outMux, out, newA, B;
	wire [4:0] curOp;
	wire ofA, ofM;

	MUX3WAY16 mux2(out, in1, A, loadA, newA);								//Overwrite the A register if they want to
	REGISTER16 a(newA, clk, rst, A);
	REGISTER16 b(in2, clk, rst, B);
	REGISTER5 op(opcode, clk, rst, curOp);
	REGISTER1 inverse(inv, clk, rst, curInv);
	REGISTER1 subtract(sub, clk, rst, curSub);

	TWOS16 twos(B, curSub, outTC);											//Negate reg b if we're subtracting
	ADDER16 adder(A, outTC, outADD, ofA);									//Add reg a and reg b, then save the result and if it overflowed
	MULT16 multiplier(A, outTC, outM, ofM);									//Multiply reg a and reg b, then save the result and if it overflowed
	AND16 ander(A, outTC, outAND);											//And regA and regB
	OR16 orer(A, outTC, outOR);												//Now do Or
	XOR16 xorer(A, outTC, outXOR);											//Now Xor

	MUX5WAY16 mux5(outADD, outM, outAND, outOR, outXOR, curOp, outMux);		//Use a Mux and the opcode to determine which result we want

	NOT16 negator(outMux, curInv, out);										//Not the output if needed


	assign overflow = (curSub == 1 && curOp[0] == 1 ?						//Set overflow bit if overflow occurred on add or multiply
		0 : (ofA & curOp[0]) | (ofM & curOp[1]));
	assign zero = ~(|out);													//Set zero bit if result is zero
	assign neg = ~ofA & curSub & curOp[0];									//Set negative bit if result is less than zero

endmodule
