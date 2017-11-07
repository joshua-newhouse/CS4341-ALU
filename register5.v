module REGISTER5(input [4:0] D, input clk, output reg [4:0] Q);
	always @(posedge clk) begin
		Q = D;
	end
endmodule