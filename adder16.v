module ADDER16(input [15:0] A, B, output [15:0] S, output OF);
	assign {OF, S[15:0]} = A + B;
endmodule

/*
module TestBench;
	reg [15:0] A, B;
	output [15:0] s;

	integer i;

	ADDER16 a(A, B, s, of);

	initial begin
		$monitor($time, , A, , B, , of, , s);
		for(i = 0; i < 100; i = i + 1) begin
			A = $urandom;
			B = $urandom;
			#1;
		end
	end
endmodule
*/
