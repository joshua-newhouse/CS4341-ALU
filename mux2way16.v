module MUX2WAY16(input[15:0] A, B, input SEL, output reg [15:0] O);

	always @*
	case(SEL)
		1'b0 : O = A;
		1'b1 : O = B;
	endcase
endmodule
