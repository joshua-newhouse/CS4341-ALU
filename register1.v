module REGISTER1(input D, input clk, output reg Q);
	always @(posedge clk) begin
		Q = D;
	end
endmodule