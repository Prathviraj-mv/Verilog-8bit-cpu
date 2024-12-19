module control_unit_tb(opcode,alu_sel);
  reg opcode;
  wire alu_sel;

  control_unit  uut(opcode,alu_sel);
  initial
    begin
      opcode=3'b000;#10;
       opcode=3'b001;#10;
       opcode=3'b010;#10;
       opcode=3'b011;#10;
       opcode=3'b100;#10;
       opcode=3'b101;#10;
       opcode=3'b110;#10;
       opcode=3'b111;#10;
    end
endmodule





