module REGISTER16(input [15:0] D, input clk, output reg [15:0] Q);
	always @(posedge clk) begin
		Q = D;
	end
endmodule