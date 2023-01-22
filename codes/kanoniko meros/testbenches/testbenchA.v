// clock testbench
`timescale 1ns/1ps
module testbench_A;
reg clk, reset, record_button, mic_data;
wire clkout_sys, clkout_mic;
//reg [5:0] counter;

microphone_controller_first microphone_controller_first_sinst(.clk(clk), .reset(reset), .record_button(record_button), .mic_data(mic_data));

initial 
begin
    clk = 0;
    reset = 1;
    record_button = 0;
    #100 reset = 0;
    #250.5 record_button = 1;
    //#1000 record_button = 0;

    

    mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 0;
    record_button = 0;
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

    #1008505 mic_data = 0;
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
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;

    #13694626 mic_data = 0;
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
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 1;
    #500 mic_data = 0;
    #500 mic_data = 1;
    #500 mic_data = 0;


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





always #5 clk = ~clk;

endmodule
