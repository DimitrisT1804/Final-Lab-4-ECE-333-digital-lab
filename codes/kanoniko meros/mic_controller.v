// mic controller
module sounddriver(clk, reset, recordBtnEN, micGenCLK, micDataPDM, micLRselPDM, playbackBtnEN, audDataPWM, audEnPWM);
input reset;
input clk;

// Recording Interface //
input recordBtnEN;
input micDataPDM;
output micGenCLK;
output micLRselPDM;

// Playback Interface //
input playbackBtnEN;
output audDataPWM;
output audEnPWM;  // den jero pou na to xrisimopoiiso

// for instantiations variables //
//output micGenCLK;
wire clkout_sys;    // to kano output gia to testbecnh

/* gia tin bram metavlites */
wire [3:0] WEA;
wire [15:0] addr, addr_count;
wire bram_enable;
wire [31:0] data_out;
wire [31:0] data_bram;

//wire data_for_speaker;

reg [15:0] addr_for_bram;
wire new_button_rec, new_button_playback;

always @(posedge clkout_sys)
begin
    if(new_button_rec)
        addr_for_bram <= addr;
    else
        addr_for_bram <= addr_count;
end

assign micLRselPDM = 1;

/* MMCM instantiation */
clocks_mmcm clocks_mmcm_inst (.clk(clk), .reset(reset), .clkout_sys(clkout_sys), .clkout_mic(micGenCLK));

/* BRAM instantiation */
bram bram_inst (.clk(clkout_sys), .reset(reset), .bram_enable(bram_enable), .addr(addr_for_bram), .WEA(WEA), .data_in(data_bram), .data_out(data_out));

/* microphone istantiation */
microphone_controller microphone_controller_inst(.reset(reset), .record_button(recordBtnEN), .mic_data(micDataPDM), .clkout_sys(clkout_sys), .clkout_mic(micGenCLK), .addr_new(addr), .WEA(WEA), .bram_enable(bram_enable), .data_bram(data_bram), .new_button(new_button_rec));

/* Speaker instantiation */
speaker speaker_inst (.clkout_sys(clkout_sys), .clkout_mic(micGenCLK), .reset(reset), .speaker_button(playbackBtnEN), .addr_count_new(addr_count), .data_in(data_out), .data_out(audDataPWM),.audEnPWM(audEnPWM), .new_button_playback(new_button_playback));

endmodule
