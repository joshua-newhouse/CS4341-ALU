`include "ALU.v"

module TestBench;
	reg [15:0] in1, in2;
	wire [15:0] out;
	reg [4:0] opcode;
	reg inv, sub;
	wire zero, of, neg;

	integer i;

	ALU alu(in1, in2, opcode, inv, sub, out, zero, of, neg);

	initial begin
		$monitor("in1: %d %b\nin2: %d %b opcode: %d %b inv: %d sub: %d\nout: %d %b zero: %d of: %d neg: %d\n",
				in1, in1, in2, in2, opcode, opcode, inv, sub, out, out, zero, of, neg);

		for(i = 0; i < 10; i = i + 1) begin
			$display("NO OP");
			in1 = $urandom % 40000;
			in2 = $urandom % 40000;
			opcode = 0;
			sub = 0;
			inv = 0;

			#1 $display("ADD"); opcode = 5'b00001;
			#1 $display("SUB"); sub = 1;
			#1 $display("MULT"); opcode = 5'b00010;
			#1 $display("AND"); opcode = 5'b00100;
			#1 $display("OR"); opcode = 5'b01000;
			#1 $display("XOR"); opcode = 5'b10000;
			#1 $display("NOT"); inv = 1;

			$display("-------------------------------------------------");

		end
	end
endmodule
