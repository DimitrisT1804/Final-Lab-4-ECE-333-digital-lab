// mic controller
module sounddriver(clk, reset, micGenCLK, micDataPDM, micLRselPDM, audDataPWM, audEnPWM);
input clk, reset;

// Recording Interface //
//input recordBtnEN;
input micDataPDM;
output micGenCLK;
output micLRselPDM;

// Playback Interface //
//input playbackBtnEN;
output audDataPWM;
output audEnPWM; 

wire clkout_sys;

wire [31:0] audDATA;

assign micLRselPDM = 1;
//assign audEnPWM = 1;

/* MMCM instantiation */
clocks_mmcm clocks_mmcm_inst (.clk(clk), .reset(reset), .clkout_sys(clkout_sys), .clkout_mic(micGenCLK));

convertPDMtoPWM convertPDMtoPWM_inst(.btnRST(reset), .clk_2MHz(micGenCLK), .micDataPDM_wire(micDataPDM), .audDATA(audDATA));

speaker speaker_inst(.clkout_mic(micGenCLK), .reset(reset), .data_in(audDATA), .speaker_out(audDataPWM), .audEnPWM(audEnPWM), .mic_data(micDataPDM));

/* microphone istantiation */
//microphone_controller microphone_controller_inst (.mic_data(micDataPDM), .speaker_data(audDataPWM));

endmodule
