// clock testbench
`timescale 1ns/1ps
module testbench_B;
reg clk, reset, record_button, mic_data, speaker_button;
wire clkout_sys, clkout_mic;

integer i;
reg [31:0] number;
reg [5:0] counter;

wire audEnPWM = 1;
wire micLRselPDM = 1;

wire data_out;

//microphone_controller microphone_controller_inst(clk, reset, record_button, mic_data, clkout_sys, clkout_mic);

sounddriver sounddriver_inst(.clk(clk), .reset(reset), .recordBtnEN(record_button), .micGenCLK(clkout_mic), .micDataPDM(mic_data), .micLRselPDM(micLRselPDM), .playbackBtnEN(speaker_button), .audDataPWM(data_out), .audEnPWM(audEnPWM));
initial 
begin
    clk = 0;
    reset = 1;
    record_button = 0;
    i = 0;
    number = 32'b00001011110010101001110001110100;
    speaker_button = 0;
    #100 reset = 0;
    #250.5 record_button = 1;
    //#1000 record_button = 0;

    

    #5 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    //record_button = 0;
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
    record_button = 0;  
    //#100 speaker_button = 1;
    //#1000 speaker_button = 0;
    // #16494514.5 speaker_button = 1;
    // #10000 speaker_button = 0;
    #16800 speaker_button = 1;
    #10000 speaker_button = 0;


    // #1008505 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 0;
    // #500 mic_data = 0;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 1;
    // record_button = 0;
    // #16494514.5 speaker_button = 1;
    // #10000 speaker_button = 0;

    //#100 speaker_button = 1;
    //#1000 speaker_button = 0;

    // #13694626 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 0;
    // #500 mic_data = 0;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    // #500 mic_data = 1;
    // #500 mic_data = 0;
    //#16494514.5 speaker_button = 1;
    //#10000 speaker_button = 0;


end

// always @(posedge clkout_mic or posedge reset)
// begin
//     if(reset)
//         mic_data <= 1'bx;
//     else if(counter == 6'd31)
//     begin
//         number = $urandom();
//         $display("number is: %d\n", number);
//         i <= 0;
//     end
//     else 
//     begin
//         i <= i +1;
//         if(i == 31)
//             i <= 0;
//     end


// end

// always @(number or i)
// begin
//     mic_data = number[i];
// end

// always @(posedge clkout_mic or posedge reset)
// begin
//     if(reset)
//         counter <= 0;
//     else
//         counter <= counter + 1;
//     if(counter == 6'd32)
//         counter <= 0;
// end

// always @(posedge clkout_mic or posedge reset)
// begin
//     if(reset)
//         mic_data <= 1'bx;
//     else
//     begin
//         mic_data <= {$random}%2;
//         $display("%d", mic_data);
//         // mic_data <= number[i];
//         // i <= i+1;
//     end
// end

// always @(mic_data)
// begin
//     i = i + 1;
// end

always @(i)
begin
    if(i == 33)
    begin
        i = 0;
        //number = 32'b01001110011100110111011000010100;
    end
    //else if (i == 32)
        //number = 32'b01001110011100110111011000010100;

end

always @(posedge clkout_sys)
begin
    $display("time is %t and %d", $time, data_out);
end


always #5 clk = ~clk;

endmodule
