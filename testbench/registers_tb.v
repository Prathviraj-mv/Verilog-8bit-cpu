
// control unit test bench

module register_module_tb; 
  reg save;
  reg reset;
  reg [7:0] alu_out;
  wire  [7:0] data_out;
  wire  [7:0] data_out;

  register_module  uut(save,reset,alu_out,data_out);
      initial
           begin
             save=0;
             reset=0;
             alu_out=8'b00000000;
             //Apply reset
             #10 reset = 1;
             #10 reset = 0;

             //Save first value
             alu_out = 8'b10101010;
             #10 save = 1;
             #10 save = 0;

             //Applying reset again
             #10 reset = 1;
             #10 reset = 0;
           end
endmodule





