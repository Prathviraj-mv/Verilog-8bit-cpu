// Testbench for ALU 

module alu_8bit_tb;
  reg [7:0]a , b;
  reg [2,0]alu_sel;

  wire [7:0]alu_out;
  wire carry_out;

  alu_8bit uut(a,b,alu_sel,alu_out,carry_out);
  initial
    begin
      
  
      alu_sel=3'd0;
      
