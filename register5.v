module REGISTER5(input [4:0] D, input clk, rst, output reg [4:0] Q);
	always @(posedge clk) begin
		Q = rst ? 0 : D;
	end
endmodule
