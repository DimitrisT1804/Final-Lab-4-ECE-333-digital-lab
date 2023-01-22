//part B odigisi data sto ixeio tis FPGA

module speaker(clkout_mic, reset, data_in, speaker_out, audEnPWM, mic_data);

input clkout_mic, reset, mic_data;
input [31:0] data_in;
wire data_out;
//output reg [15:0] addr_count;
output audEnPWM;
output speaker_out;
/* PISO variables */
reg [31:0] tmp;
//reg [31:0] data_in;   
reg load;    

wire mic_data_reverse;

assign audEnPWM = 1;

/* FSM variables */
reg counter_enable, addr_enable;
reg [11:0] counter;
reg [2:0] current_state, next_state;

reg [9:0] addr_count;
reg [6:0] counter_shifter;
reg counter_shifter_enable;

/* metavlites gia counter playback */
reg [29:0] counter_playback;
reg counter_playback_enable;

always @(posedge clkout_mic or posedge reset)
begin
    if(reset)
    begin
        counter_shifter <= 0;
        load <= 0;
    end
    else if (counter_shifter == 7'd32)
    begin
        load <= 1;
        counter_shifter <= 0;
    end
    else
    begin
        counter_shifter <= counter_shifter + 7'b1;
        load <= 0;
    end
end

/*Parrarel input Serial output */
always @(posedge clkout_mic or posedge reset)
begin
    if(reset)
        tmp <= 32'b0;
    else if (load)
        tmp <= data_in;
    else
    begin
            tmp <= tmp << 1;
            //tmp <= {tmp[30:0], 0};
    end
end

assign data_out = tmp[31];
assign mic_data_reverse = ~mic_data;

tristate_buffer tristate_buffer_inst(.data_out(speaker_out), .data_in(data_out), .enable(mic_data_reverse));



endmodule