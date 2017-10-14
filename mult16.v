module MULT16(input [15:0] A, B, output [15:0] P, output OF);
	assign OF = A * B > 65535 ? 1 : 0;
	assign P = A * B;
endmodule

/*
module TestBench;
	reg [15:0] A, B;
	output [15:0] P;

	integer i;

	MULT16 a(A, B, P, OF);

	initial begin
		$monitor(A, , B, , OF, , P);
		#10 A = 65535; B = 1;
		#10 A = 256; B = 255;
		#10 B = 256;
		#10 A = 65536; B = 1;

		for(i = 0; i < 10; i = i + 1) begin
			A = $urandom % 256;
			B = $urandom % 512;
			#1;
		end
	end
endmodule
*/
