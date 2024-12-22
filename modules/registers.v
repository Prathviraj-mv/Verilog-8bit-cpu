
module register_module (save,reset,alu_out,data_out);
  input save;
  input  reset;
  input  [7:0] alu_out;
  output  [7:0] data_out;
  reg  [7:0] data_out;

  
  always @(save, reset) 
  begin
    if (save ==1 & reset =0)
      begin
        data_out = alu_out;
      end
    else if(reset ==1 & save =0)
      begin
        data_out = 8'b00000000;
      end
    else
      begin
        data_out = 8'b00000000;
      end    
end

endmodule
