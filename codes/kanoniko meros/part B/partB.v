//part B odigisi data sto ixeio tis FPGA

module speaker(clkout_sys, clkout_mic, reset, speaker_button, addr_count_new, data_in, data_out, audEnPWM, new_button_playback);

input clkout_sys, reset, speaker_button, clkout_mic;
input [31:0] data_in;
output data_out;
//output reg [15:0] addr_count;
output [15:0] addr_count_new;
output reg audEnPWM;
output reg new_button_playback;
/* PISO variables */
reg [31:0] tmp;
//reg [31:0] data_in;   
reg load;    

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

always @(posedge clkout_sys or posedge reset)
begin
    if(reset)
        counter_shifter <= 0;
    else if(counter_shifter_enable)
    begin
        if (counter_shifter == 7'd99)
            counter_shifter <= 0;
        else
            counter_shifter <= counter_shifter + 7'd1;
    end
    else
        counter_shifter <= 0;
end


always @(posedge clkout_sys or posedge reset)
begin
   if(reset)
      new_button_playback <= 0;
   else
   begin
      if (counter == 11'd2000)      // thelei allo xrono
        new_button_playback <= 0;
      else if (speaker_button)
        new_button_playback <= 1;
   end
end

/*Parrarel input Serial output */
always @(posedge clkout_sys or posedge reset)
begin
    if(reset)
        tmp <= 32'b0;
    else
    begin
        if(load)
            tmp <= data_in;
        else if (counter_shifter == 7'd99)
            tmp <= tmp << 1;
            //tmp <= {tmp[30:0], 0};
    end
end

assign data_out = tmp[31];


// FSM
parameter idle_state = 3'b000,
            first_load = 3'b001,
            serialisation = 3'b010,
            addr_add = 3'b011,
            last_bits_serialization = 3'b100,
            loading = 3'b101;


always @(posedge clkout_sys or posedge reset)
begin
    if(reset)
        current_state <= idle_state;
    else
        current_state <= next_state;
end

always @(current_state  or counter or new_button_playback)
begin
    addr_enable = 0;
    counter_enable = 1;
    load = 0;
    audEnPWM = 1;
    next_state = current_state;
    counter_shifter_enable = 1;
    counter_playback_enable = 1;
    
    case(current_state)
    idle_state: 
    begin
        counter_playback_enable = 0;
        audEnPWM = 0;
        //load = 1;
        counter_shifter_enable = 0; 
        counter_enable = 0;
        if(new_button_playback)  
            next_state = first_load;
        else
            next_state = current_state;
    end

    // audio_enable:       // mallon peritoviva
    // begin
    //     audEnPWM = 1;
    //     next_state = first_load;
    // end

    first_load:
    begin
        load = 1;
        counter_shifter_enable = 1; 
        //if(counter == 5'd30)
        //if(counter == 11'd1278)
        next_state = serialisation;
        // else
        //     next_state = current_state;
    end

    serialisation:
    begin
        //load = 1;
        //if(counter == 5'd16)
        //if(counter == 11'd640)
        if(counter == 12'd1599)
            next_state = addr_add;
        else
            next_state = current_state;
    end

    addr_add:     // mesi toy minimatos gia na allaxei noris i dieuthinsi tis BRAM
    begin
        addr_enable = 1;
        next_state = last_bits_serialization;
    end

    last_bits_serialization:
    begin
        //load = 1;
        //addr_enable = 1;
        if(counter_playback >= 30'd1000000000)
            next_state = idle_state;
        else if(counter == 12'd3198) // -3 gia na ipologiso ola ta states
            next_state = loading;     
        else
            next_state = current_state;
    end

    // first_load:
    // begin
    //     //if(counter == 5'd30)
    //     if(counter == 11'd1278)
    //         next_state = loading;
    //     else
    //         next_state = current_state;
    // end
    loading:
    begin
        load = 1;
        counter_enable = 0;
        //counter_shifter_enable = 0;
        next_state = serialisation;
    end
    endcase
end


/*counter for time */
always @(posedge clkout_sys or posedge reset)
begin
    if(reset)
        counter <= 12'b0;
    else
    begin
        if(counter_enable == 1)
            counter <= counter + 12'b1;
        else
            counter <= 12'b0;
    end
end

/* counter for addr */
always @(posedge clkout_sys or posedge reset)
begin
    if(reset)
        addr_count <= 10'b0;
    else
    begin
        if (addr_count == 10'd868)  // -2 gia na ipologiso kai ton kiklo allagis 
            addr_count <= 10'b0;
        else if (addr_enable == 1)      // gia na kanei reset kathe fora
            addr_count <= addr_count + 10'b1;
    end
end

assign addr_count_new = {1'b1, addr_count, 5'b00000};
//assign addr_count_new = 16'b0000000000100000;

/* counter poy metraei 5 sec gia na stamatisei na paizei to minima */
always @(posedge clkout_sys or posedge reset)
begin
    if(reset)
        counter_playback <= 30'b0;
    else
    begin
        if(counter_playback_enable == 1)
            counter_playback <= counter_playback + 30'b1;
        else
            counter_playback <= 30'b0;
    end
end


endmodule