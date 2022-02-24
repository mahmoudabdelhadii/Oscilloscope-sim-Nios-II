module fast_to_slow_tb;
    reg fast_clk,slow_clk;
    reg [11:0] d;
    wire [11:0] q;

    fast_to_slow_sync DUT(
        .fast_clk(fast_clk),
        .slow_clk(slow_clk), 
        .d(d), 
        .q(q)
        );
	intial begin 
        fast_clk=1'b0;
        slow_clk= 1'b0;
        d = 12'hFF;
    forever begin 
        #500 fast_clk = ~fast_clk;
        #50 slow_clk = ~slow_clk;
    end 
end
endmodule