module REGISTER16(input [15:0] D, input clk, rst, output reg [15:0] Q);
	always @(posedge clk) begin
		Q = rst ? 0 : D;
	end
endmodule
