module dds_simulation_tb;
	reg clk, reset;
	reg [31:0] phase_inc;
	wire [11:0] sin_out, cos_out, squ_out, saw_out;

	//instantiate waveform_gen
	waveform_gen dut(.clk(clk), .reset(reset), .en(1'b1), .phase_inc(phase_inc), 
			 .sin_out(sin_out), .cos_out(cos_out), .squ_out(squ_out), .saw_out(saw_out));
	
	always begin
	#10 clk = ~clk;
	
	end

	initial begin
	clk =1'b0;
	reset =1'b0;
	#20 reset =1'b1;
	phase_inc = 32'h102;
	#10
	//phase_inc = 32'h1ae;
	#10;
	//phase_inc = 32'h56;
	//#10000;
	//$stop;
	end
endmodule

