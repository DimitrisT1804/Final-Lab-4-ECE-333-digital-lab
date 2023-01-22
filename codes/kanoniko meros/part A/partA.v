// microphone controller
module microphone_controller(reset, record_button, mic_data, clkout_sys, clkout_mic, WEA, addr_new, bram_enable, data_bram, new_button);
input reset, record_button, mic_data;
input clkout_sys, clkout_mic;

output [3:0] WEA;
output reg [15:0] addr_new;
output bram_enable;


reg [31:0] data_shift;
output reg [31:0] data_bram;

reg [2:0] current_state, next_state;

reg [23:0] counter_record;
reg [11:0] counter;
reg addr_count;

reg counter_enable, counter_record_enable, mic_on, enable_shift;

/* gia tin bram metavlites */
reg [3:0] WEA;
//reg [15:0] addr = 16'd1;
reg bram_enable = 1;
//wire [31:0] data_out;

reg [9:0] addr;
output reg new_button;

parameter idle = 3'b000,
            mic_enable = 3'b001,
            bram_write = 3'b010,
            register_reset = 3'b011, 
            mic_sampling = 3'b100;       

always @(posedge clkout_sys or posedge reset)
begin
   if(reset)
      new_button <= 0;
   else
   begin
      if (counter_record == 24'd2999998)      // ama thelo na to kratiso perissotero apla anevazo ton xrono
      //if(counter_record == 24'd12822)
         new_button <= 0;
      else if (record_button)
         new_button <= 1;
   end
end

/* always block gia ton shift register pou metaferei ta dedomena stin bram */
always @(posedge clkout_mic or posedge reset)
begin
   if (reset)
      data_shift <= 32'b0;
   else
   begin
      if(enable_shift == 0)
         data_shift <= 32'b0;
      else
      begin
         data_shift <= {data_shift[30:0], mic_data};
      end
   end
end

always @(posedge clkout_sys or posedge reset)
begin
   if (reset)
      current_state <= idle;
   else
      current_state <= next_state;
end

always @(current_state or new_button or counter or counter_record)
begin
      counter_record_enable = 1;
      counter_enable = 0;
      //mic_on = 1;
      enable_shift = 1;
      WEA = 4'b0000;
      addr_count = 0;
      data_bram = 0;
      next_state = current_state;

   case (current_state)
      idle:
      begin
         counter_record_enable = 0;
         counter_enable = 0;
         //mic_on = 0;
         enable_shift = 0;
         //data_bram = 0;
         begin
            if(new_button == 1)
               next_state = mic_enable;
            else
               next_state = current_state;
         end
      end
      
      mic_enable:
      begin
         //mic_on = 1;
         // enable_shift = 1;
         counter_record_enable = 1;
         counter_enable = 1;
         //WEA = 4'b1111;
         if(counter_record == 24'd2999999)
         //if(counter_record == 24'd12822)    //214314
            next_state = idle;
         else if(counter == 12'd3149)    // -1 apo to allo roloi gia na provlepsei kai tin allagi tou state
            next_state = bram_write;
         else
            next_state = current_state;
      end

      mic_sampling:  // arxika thelei na pao stin mesi kai meta metrao xrono iso me 32*500 = 16000ns
      begin
         //mic_on = 1;
         counter_record_enable = 1;
         counter_enable = 1;
         //WEA = 4'b1111;
         if(counter_record == 24'd2999999)
         //if(counter_record == 24'd12822)
            next_state = idle;
         else if(counter == 12'd3197)    // -2 gt ipologizo kai to teleutaio state
            next_state = bram_write;
         else
            next_state = current_state;
      end

      bram_write:
      begin
         data_bram = data_shift;
         enable_shift = 1;    // gia na kanei reset o register
         counter_enable = 0;
         counter_record_enable = 1;
         WEA = 4'b1111;
         if(counter_record == 24'd2999999)
         //if(counter_record == 24'd12822)
            next_state = idle;
         else
            next_state = register_reset;
      end   

      register_reset:
      begin
         enable_shift = 0;
         addr_count = 1;
         if(counter_record == 24'd2999999)
         //if(counter_record == 24'd12822)
            next_state = idle;
         else
            next_state = mic_sampling;
      end
   endcase
end


/* coutner pou metraei ta 0.015 sec gia to record*/
always @(posedge clkout_sys or posedge reset)
begin
   if(reset)
      counter_record <= 0;
   else if(counter_record == 24'd3000000)
      counter_record <= 24'b0;
   else
   begin
      if(counter_record_enable == 1)
         counter_record <= counter_record + 24'b1;
      else
         counter_record <= 24'b0;
   end

//   if(counter_record == 24'd3000000)
//      counter_record <= 0;
end


/* counter pou metraei ton xrono mexri na paei 16 o register kai meta na ginei write stin bram */
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


/* counter pou allazei to addr gia tin bram */
always @(posedge clkout_sys or posedge reset)
begin
   if(reset)
      addr <= 10'b0;
   else
   begin
      if(addr_count == 1)
         addr <= addr + 10'b1;
   end
end
//assign addr_new = {0,addr,00000};

always @(addr)
begin
   addr_new = {1'b1, addr, 5'b00000};  // thelei 1 to MSB
end


//clocks_mmcm clocks_mmcm_inst (.clk(clk), .reset(reset), .clkout_sys(clkout_sys), .clkout_mic(clkout_mic));

//bram bram_inst (.clk(clkout_sys), .reset(reset), .bram_enable(bram_enable), .addr(addr), .WEA(WEA), .data_in(data_bram), .data_out(data_out));



endmodule