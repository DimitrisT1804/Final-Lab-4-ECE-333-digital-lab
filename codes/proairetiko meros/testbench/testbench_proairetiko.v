// clock testbench
`timescale 1ns/1ps
module testbench_B;
reg clk, reset, mic_data;
//wire clkout_sys, clkout_mic;

wire audEnPWM;
wire micLRselPDM;

wire data_out;

//microphone_controller microphone_controller_inst(clk, reset, record_button, mic_data, clkout_sys, clkout_mic);

sounddriver sounddriver_inst(.clk(clk), .reset(reset), .micGenCLK(clkout_mic), .micDataPDM(mic_data), .micLRselPDM(micLRselPDM), .audDataPWM(data_out), .audEnPWM(audEnPWM));
initial 
begin
    clk = 0;
    reset = 0;
    //reset = 1;
    //#100 reset = 0;

    #345.5 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 0;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 0;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;

    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 0;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 0;
    #500 mic_data = 0;
    #500 mic_data = 1;

    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 0;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1; 
end

always #5 clk = ~clk;

endmodule
