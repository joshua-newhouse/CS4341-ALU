`include "ALU.v"

module TestBench;
	reg [15:0] in1, in2;
	wire [15:0] out, A;
	reg [4:0] opcode;
	reg inv, sub, ovwA, clk;
	wire zero, of, neg;

	integer i;

	ALU alu(in1, in2, opcode, inv, sub, ovwA, clk, out, A, zero, of, neg);

	initial begin

		/*$monitor("in1: %d %b\nin2: %d %b opcode: %d %b inv: %d sub: %d\nout: %d %b zero: %d of: %d neg: %d\nA: %d",
				in1, in1, in2, in2, opcode, opcode, inv, sub, out, out, zero, of, neg, A);

		for(i = 0; i < 10; i = i + 1) begin
			$display("NO OP");
			in1 = $urandom % 40000;
			in2 = $urandom % 40000;
			ovwA = 0;
			opcode = 0;
			sub = 0;
			inv = 0;
			#1 clk = 1; #1 clk = 0;

			#1 $display("ADD"); opcode = 5'b00001;
			#1 clk = 1; #1 clk = 0;
			#1 $display("SUB"); sub = 1;
			#1 clk = 1; #1 clk = 0;
			#1 $display("MULT"); opcode = 5'b00010;
			#1 clk = 1; #1 clk = 0;
			#1 $display("AND"); opcode = 5'b00100;
			#1 clk = 1; #1 clk = 0;
			#1 $display("OR"); opcode = 5'b01000;
			#1 clk = 1; #1 clk = 0;
			#1 $display("XOR"); opcode = 5'b10000;
			#1 clk = 1; #1 clk = 0;
			#1 $display("NOT"); inv = 1;

			$display("-------------------------------------------------");*/
		in1=5;
		in2=5;
		ovwA=1;
		opcode=5'b00001;
		sub=0;
		inv=0;


		#1 clk = 1; #1 clk = 0;
		#1 $display("5+5=%d, A is %d", out, $signed(A));

		in1=6;
		in2=12;
		ovwA=0;
		sub=1;
		$display("A is %d", A);
		#1 clk = 1; #1 clk = 0;
		#1 $display("-12=%d, neg is %d, A is %d", $signed(out), neg, $signed(A));

		in1=20;
		in2=5;
		ovwA=1;
		opcode=5'b00010;
		#1 clk = 1; #1 clk = 0;
		#1 $display("20*5=%d", out);

		//end
	end

	initial begin
	end
endmodule
