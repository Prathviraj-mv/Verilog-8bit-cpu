// Testbench for ALU 

module alu_8bit_tb;
  reg [7:0]a , b;
  reg [2:0]alu_sel;

  wire [7:0]alu_out;
  wire carry_out;

  alu_8bit uut(a,b,alu_sel,alu_out,carry_out);
  initial
    begin
        a=01101111;b=01101111;alu_sel=3'b000;#10;
       a=01101111;b=01101111;alu_sel=3'b001;#10;
       a=01101111;b=01101111;alu_sel=3'b010;#10;
       a=01101111;b=01101111;alu_sel=3'b011;#10;
       a=01101111;b=01101111;alu_sel=3'b100;#10;
       a=01101111;b=01101111;alu_sel=3'b101;#10;
       a=01101111;b=01101111;alu_sel=3'b110;#10;
       a=01101111;b=01101111;alu_sel=3'b111;#10;
    end
endmodule
      
      
