
module instruction_memory (a,b,opcode,alu_sel,alu_out,carry_out,clk,reset,data_out);

  
  input wire [7:0] a;          // Operand A (8 bits)
  input wire [7:0] b;          // Operand B (8 bits)
  input wire [2:0] opcode;     // ALU Operation select signal
  input wire clk; 
  input wire reset; 
  
  output wire [2:0] alu_sel;     
  output wire[7:0] alu_out;     // Output of ALU 
  output wire [7:0] carry_out ;  // CARRY out values
  output wire [7:0] data_out;  // data stored in the registers
  
  // control unit instance 
  control_unit c1(opcode,alu_sel);
  
  // arithematic logic instance
  alu_8bit a1(a ,b ,alu_sel,alu_out,carry_out);
  
  //register module for saving the output
  register_module r1(clk,reset,alu_out,data_out);
  
endmodule



//control unit module
module control_unit (opcode,alu_sel);

  
input [2:0] opcode;
  
output [2:0] alu_sel;
reg [2:0] alu_sel;

    always @(opcode)
    begin
    case (opcode)
        3'b000: alu_sel = 3'b000;//addition
        3'b001: alu_sel = 3'b001;//subtraction
        3'b010: alu_sel = 3'b010;//and
        3'b011: alu_sel = 3'b011;//or
        3'b100: alu_sel = 3'b100;//exor
        3'b101: alu_sel = 3'b101;//multiplication
        3'b110: alu_sel = 3'b110;//divison
        3'b111: alu_sel = 3'b111;//comparison
        default: alu_sel = 3'b000;//addition as default
    endcase
end

  
endmodule



// alu module
module alu_8bit (a ,b ,alu_sel ,alu_out ,carry_out);

  
input [7:0] a;
input [7:0]b;
input [2:0] alu_sel;
  
output  [7:0] alu_out;
output carry_out;
reg  [7:0] alu_out;
reg carry_out;
    
    always @(alu_sel) 
    begin
    case (alu_sel)
        3'b000://add
        begin
            {carry_out, alu_out} = a + b;
        end
        3'b001://sub
        begin
            {carry_out, alu_out} = a - b;
        end
        3'b010://and
        begin
            alu_out = a & b;
            carry_out = 0;
        end
        3'b011://or
        begin
            alu_out = a | b;
            carry_out = 0;
        end
        3'b100://xor
        begin
            alu_out = a ^ b;
            carry_out = 0;
        end
        3'b101://mul
        begin
            {carry_out, alu_out} = a * b;
        end
        3'b110://div
        begin
            if (b != 0) 
            begin
                alu_out = a / b;
                carry_out = 0;
            end 
            else 
            begin
                alu_out = 8'b00000000;
                carry_out = 1;
            end
        end
        3'b111://comp
        begin
            alu_out = (a == b) ? 8'b00000001 : 8'b00000000;
            carry_out = 0;
        end
        default:
        begin
            alu_out = 8'b00000000;
            carry_out = 0;
        end
    endcase
end
  
endmodule

//register module

module register_module (clk,reset,alu_out,data_out);
  
  input wire clk;
  input wire reset;
  input wire [7:0] alu_out;
  
  output  [7:0] data_out;
  reg  [7:0] data_out;

  initial
  begin
    data_out =8'd0;
  end
  always @(posedge clk, reset) 
  begin
    if (clk == 1) //save the value
      begin
        data_out = alu_out;
      end
    else if(reset ==1)  //reset the value
      begin
        data_out = 8'b00000000;
      end
    else
      begin
        data_out = 8'b00000000;
      end    
end

endmodule
