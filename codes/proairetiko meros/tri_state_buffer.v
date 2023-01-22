// tri state buffer to achive high impendance in a signal

module tristate_buffer (data_out, data_in, enable);
output data_out;
input  data_in;
input  enable;

assign data_out = enable ? data_in : 1'bz;

endmodule