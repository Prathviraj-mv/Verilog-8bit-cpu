
module instruction_memory (a,b,alu_sel,result_out,carry_out,clk,rst,data_in,data_out);
  input wire [7:0] a;       // Operand A (8 bits)
  input wire [7:0] b;       // Operand B (8 bits)
  input wire [2:0] alu_sel;    // ALU Operation select signal
  output wire [7:0] result_out;     
  output wire [7:0] carry_out ;  
  input wire clk;
  input wire rst;
  input wire [7:0] alu_out;
  output  [7:0] data_out;

  control_unit c1(opcode,alu_sel);
  
  alu_8bit a1(a ,b ,alu_sel,result_out,carry_out);
  
  register_module r1(clk,rst,data_in,data_out);

    

endmodule
