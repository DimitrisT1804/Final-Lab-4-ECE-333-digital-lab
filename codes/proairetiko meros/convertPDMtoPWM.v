module convertPDMtoPWM(btnRST, clk_2MHz, micDataPDM_wire, audDATA);

  input btnRST;
  input clk_2MHz;
  input micDataPDM_wire;
  output reg [15:0] audDATA;

  reg [15:0] micDATA;
  reg [3:0] audEncEN;

  // convert microphone PRD data to PWM //
   always @(posedge clk_2MHz or posedge btnRST) begin
    if (btnRST) begin
      // reset
      micDATA <= 16'hFF00;
    end
    else begin
      if (micDataPDM_wire == 1'b1)
        micDATA <= {micDataPDM_wire, micDATA[15:1]};
      else
        micDATA <= {micDATA[14:0], micDataPDM_wire};
    end
  end

  // update PWM audio data based on enable //
  always @(posedge clk_2MHz or posedge btnRST) begin
    if (btnRST) begin
      // reset
      audDATA <= 16'hFF00;
    end
    else begin
      if (audEncEN == 4'h0)
        audDATA <= micDATA;
    end
  end

  // update audio data when all of them are broadcasted //
  always @(posedge clk_2MHz or posedge btnRST) begin
    if (btnRST) begin
      // reset
      audEncEN <= 4'hF;
    end
    else begin
      audEncEN <= (audEncEN == 4'h0) ? (4'hF) : (audEncEN - 1'b1);
    end
  end
endmodule
