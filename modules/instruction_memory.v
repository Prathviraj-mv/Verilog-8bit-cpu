
module instruction_memory (a,b,opcode,alu_sel,result_out,carry_out,clk,rst,data_out);

  
  input wire [7:0] a;       // Operand A (8 bits)
  input wire [7:0] b;       // Operand B (8 bits)
  input wire [2:0] opcode;    // ALU Operation select signal
  input wire clk; //clock pulse for the registers
  input wire rst; // reset for the registers

  output wire [2:0] alu_sel;     // Output of ALU //results
  output wire [7:0] result_out;     // Output of ALU //results
  output wire [7:0] carry_out ;  // CARRY out values
  output wire [7:0] data_out;// data stored in the registers

  // control unit instance 
  control_unit c1(opcode,alu_sel);

  // arithematic logic instance
  alu_8bit a1(a ,b ,alu_sel,result_out,carry_out);

  //register module for saving the output
  register_module r1(clk,rst,alu_out,data_out);

    

endmodule
