module tb;
	logic clk;
	logic [4:0] lfsr;
	LFSR dut(clk, lfsr); 

	initial forever begin
	clk = 1'b0; #1;
	clk = 1'b1; #1;
	end

	initial begin
	#30;
	$stop;
	end
endmodule

module LFSR (clk, rst, lfsr); 
	input clk, rst;
	output lfsr [4:0];

	//initialize output lfsr
	logic [4:0] lfsr = 5'b00001;

	always_ff @(posedge clk or posedge rst) begin
		if (rst) lfsr <= 5'b00001;
		else begin
		lfsr[4] <= lfsr[0] ^ lfsr[2];
		lfsr[3] <= lfsr[4];
		lfsr[2] <= lfsr[3];
		lfsr[1] <= lfsr[2];
		lfsr[0] <= lfsr[1];
		end
	end

endmodule
