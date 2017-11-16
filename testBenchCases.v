`include "ALU.v"

module TestBench;
	reg [15:0] in1, in2;
	wire [15:0] out, A, B;
	reg [4:0] opcode;
	reg [1:0] loadA;
	reg inv, sub, clk, rst;
	wire zero, of, neg;

	integer i;

	ALU alu(in1, in2, opcode, inv, sub, clk, rst, loadA, out, A, B, zero, of, neg);

	initial begin
		$monitor("clk: %b\nin1: %b(%d)\nin2: %b(%d) opcode: %b inv: %b sub: %b\nout: %b(%d) zero: %b of: %b neg: %b\nA: %d load A: %b\nB: %d\n",
				clk, in1, in1, in2, in2, opcode, inv, sub, out, out, zero, of, neg, A, loadA, B);
		clk = 0;
		forever begin
			#1 clk = ~clk;
		end
	end

	initial begin
		$display("NO OP");
		in1 = 2;
		in2 = 7;
		loadA = 2'b01;
		opcode = 5'b00000;
		sub = 0;
		inv = 0;
		rst = 0;
			
		#2 $display("SUB"); opcode = 5'b00001; sub = 1; loadA = 2'b00;
		#2 $display("MULT"); opcode = 5'b00010; sub = 0;
		#2 $display("RESET"); inv = 0; rst = 1; opcode = 5'b00000;
		#2 $display("-------------------------------------------------");

		#2 $display("ADD BY 3"); rst = 0; opcode = 5'b00001; in1 = 5; in2 = 3;
		loadA = 2'b01;

		#2 loadA = 2'b10;

		#10 $finish;
	end
endmodule
