
module register_module (clk,rst,data_in,data_out);
  input wire clk;
  input wire rst;
  input wire [7:0] alu_out;
  output reg [7:0] data_out;


  always @(clk,rst) 
  begin
    if (clk ==1)
      begin
        data_out = alu_out;
    end
    else if(rst ==1)
      begin
        data_out = 8'b00000000;
    end
end

endmodule
