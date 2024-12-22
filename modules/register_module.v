
module register_module (clk,rst,alu_out,data_out);
  input wire clk;
  input wire rst;
  input wire [7:0] alu_out;
  output  [7:0] data_out;
  reg  [7:0] data_out;

  
  always @(posedge clk or posedge rst) 
  begin
    if (clk )
      begin
        data_out <= alu_out;
    end
    else if(rst)
      begin
        data_out <= 8'b00000000;
    end
end

endmodule
