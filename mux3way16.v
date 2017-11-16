module MUX3WAY16(input[15:0] OUT, IN, A, input[1:0] SEL, output reg [15:0] O);

	always @*
	case(SEL)
		2'b00 : O = A;
		2'b01 : O = IN;
		2'b10 : O = OUT;
	endcase
endmodule
