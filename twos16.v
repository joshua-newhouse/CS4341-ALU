module TWOS16(input [15:0] in, input sig, output [15:0] out);
	assign out = sig == 1 ? ~in + 1 : in;
endmodule

/*
module TestBench;
	reg [15:0] A;
	output [15:0] O;
	reg s;

	TWOS16 a(A, s, O);

	initial begin
		A = 60;
		$monitor($time, , A, , O, , s);
		#0 s = 0;
		#1 s = 1;
	end
endmodule
*/
