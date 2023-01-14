// clock testbench
`timescale 1ns/1ps
module testbench_clk;
reg clk, reset;
wire clkout_sys, clkout_mic;

microphone_controller microphone_controller_inst(clk, reset, clkout_sys, clkout_mic);

initial 
begin
    clk = 0;
    reset = 1;
    #100 reset = 0;
end

always #5 clk = ~clk;

endmodule
