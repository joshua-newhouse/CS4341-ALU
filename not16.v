module NOT16(input [15:0] A, input neg, output [15:0] O);
	assign O = neg == 1 ? ~A : A;
endmodule

/*
module TestBench;
	reg [15:0] A;
	output [15:0] O;
	reg n;

	integer i;

	NOT16 a(A, n, O);

	initial begin
		n = 0;
		$monitor("A: %16b\nO: %16b neg?: %d\n", A, O, n);
		for(i = 0; i < 10; i = i + 1) begin
			A = $urandom;
			n = ~n;
			#1;
		end
	end
endmodule
*/
