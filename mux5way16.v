module MUX5WAY16(input [15:0] A, B, C, D, E, input [4:0] SEL, output [15:0] O);
	reg O;

	always @*
	case(SEL)
		5'b00001 : O = A;
		5'b00010 : O = B;
		5'b00100 : O = C;
		5'b01000 : O = D;
		5'b10000 : O = E;
		default : O = 0;
	endcase
endmodule

/*
module TestBench;
	reg [15:0] add, mult, a, o, xo;
	reg [4:0] instr;
	output [15:0] out;

	MUX5WAY16 mux(add, mult, a, o, xo, instr, out);

	initial begin
		add = $urandom;
		mult = $urandom;
		a = $urandom;
		o = $urandom;
		xo = $urandom;
		instr = 0;

		$display("add: %d mult: %d a: %d o: %d xo: %d",
			add, mult, a, o, xo);

		$monitor("Selector: %b Output: %d", instr, out);

		#10 instr = 5'b00001;
		#10 instr = 5'b00010;
		#10 instr = 5'b00100;
		#10 instr = 5'b01000;
		#10 instr = 5'b10000;
	end
endmodule
*/
