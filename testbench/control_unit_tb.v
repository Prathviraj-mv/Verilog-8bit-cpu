// control unit test bench

module control_unit_tb;
   reg [2:0] opcode;
   wire [2:0] alu_sel;

  control_unit  uut(opcode,alu_sel);
      initial
           begin
                 opcode = 3'b000; #10; //add
                 opcode = 3'b001; #10; //sub
                 opcode = 3'b010; #10; //and
                 opcode = 3'b011; #10; //or
                 opcode = 3'b100; #10; //xor
                 opcode = 3'b101; #10; //product
                 opcode = 3'b110; #10; //div
                 opcode = 3'b111; #10; //compare
           end
endmodule





