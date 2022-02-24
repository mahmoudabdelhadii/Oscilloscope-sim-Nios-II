module asyncsig (
    input logic clk,
    input logic async_sig,
    output logic out_sync_sig
);

wire in1,in2,in3;

flopr FDC_1 (
.clk(clk),
.reset(1'b0),
.d(out_sync_sig),
.q(in1)
);
flopr FDCu1 (
.clk(async_sig),
.reset(in1),
.d(1'b1),
.q(in2)
);
flopr FDCu2 (
.clk(clk),
.reset(1'b0),
.d(in2),
.q(in3)
);
flopr FDCu3 (
.clk(clk),
.reset(1'b0),
.d(in3),
.q(out_sync_sig)
);

endmodule 


module flopr(
        input logic clk,
        input logic reset,
        input logic  d,
        output logic q
        );

always_ff@(posedge clk, posedge reset)
if (reset) q<=1'b0;
else  q<= d;
endmodule

