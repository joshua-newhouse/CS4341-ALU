module XOR16(input [15:0] A, B, output [15:0] O);
	assign O = A ^ B;
endmodule

/*
module TestBench;
	reg [15:0] A, B;
	output [15:0] O;

	integer i;

	XOR16 a(A, B, O);

	initial begin
		$monitor("A: %16b\nB: %16b\nO: %16b\n", A, B, O);
		for(i = 0; i < 10; i = i + 1) begin
			A = $urandom;
			B = $urandom;
			#1;
		end
	end
endmodule
*/
