module slow_to_fast_tb;
    reg fast_clk,slow_clk;
    reg [11:0] d;
    wire [11:0] q;

    slow_to_fast_sync DUT(
        .fast_clk(fast_clk),
        .slow_clk(slow_clk), 
        .d(d), 
        .q(q)
);
always begin 
	#500 slow_clk = ~slow_clk;
    end 
always begin
#50 fast_clk = ~fast_clk;
end
initial begin 
fast_clk=1'b0;
slow_clk= 1'b0;
 d = 12'hEFF;

#2500 d= 12'hEAE;
#2500 d= 12'hAAA;
#2500 d= 12'h123;
 
end
endmodule 