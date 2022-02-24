module selection_control(clk, actual_selected_modulation, actual_selected_signal, modulation_selector, 
			 signal_selector, sin, cos, squ, saw, ASK, FSK, BPSK, LFSR, phase_inc, dds_increment);
	input clk;
	input [3:0] modulation_selector;
	input [7:0] signal_selector;
	input [11:0] sin, cos, squ, saw, ASK, FSK, BPSK, LFSR;
	input [31:0] dds_increment;
	output logic [11:0] actual_selected_modulation, actual_selected_signal;
	output logic [31:0] phase_inc;
	
	//encodings for choosing signal sent to oscilloscope
	parameter [3:0] sine_signal = 	4'b0000;
	parameter [3:0] cos_signal = 	4'b0001;
	parameter [3:0] saw_signal = 	4'b0010;
	parameter [3:0] squ_signal = 	4'b0011;
	
	//encodings for choosing modulation sent to oscilloscope
	parameter [3:0] ASK_mod = 	4'b0000;
	parameter [3:0] FSK_mod = 	4'b0001;
	parameter [3:0] BPSK_mod = 	4'b0010;
	parameter [3:0] LFSR_mod = 	4'b0011;
	
	//selecting signal
	always_comb begin
		case (signal_selector) 
        		sine_signal: actual_selected_signal = sin;
        		cos_signal: actual_selected_signal = cos;
        		saw_signal: actual_selected_signal = saw;
        		squ_signal: actual_selected_signal = squ;
       		 	default: actual_selected_signal = sin;
		endcase
	end

	assign phase_inc = (modulation_selector == FSK_mod) ? dds_increment : 32'h102;

	//selecting modulation
	always_comb begin
		case (modulation_selector)
			ASK_mod: actual_selected_modulation = ASK; 
			FSK_mod: actual_selected_modulation = FSK;
			BPSK_mod: actual_selected_modulation = BPSK;
			LFSR_mod: actual_selected_modulation = LFSR;
			default: actual_selected_modulation = ASK;
		endcase
	end
endmodule 

	