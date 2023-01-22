// clock testbench
`timescale 1ns/1ps
module testbench_clk;
reg clk, reset;
wire clkout_sys, clkout_mic;

clocks_mmcm clocks_mmcm_inst(.clk(clk), .reset(reset), .clkout_sys(clkout_sys), .clkout_mic(clkout_mic));

initial 
begin
    clk = 0;
    reset = 1;
    #100 reset = 0;
end

always #5 clk = ~clk;

endmodule
