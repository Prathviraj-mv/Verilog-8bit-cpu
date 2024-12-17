// alu module
module alu_8bit (a ,b ,alu_sel ,alu_out ,carry_out);
input [7:0] a, b;
input [2:0] alu_sel;
output reg [7:0] alu_out;// reg???????????????what da hell?
output reg carry_out;
    
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

//control unit module
module control_unit (opcode,alu_sel);
input [2:0] opcode;
    output reg [2:0] alu_sel;//reg?????????

always @(*)
    begin
    case (opcode)
        3'b000: alu_sel = 3'b000;//add
        3'b001: alu_sel = 3'b001;//sub
        3'b010: alu_sel = 3'b010;//and
        3'b011: alu_sel = 3'b011;//or
        3'b100: alu_sel = 3'b100;//exor
        3'b101: alu_sel = 3'b101;//multiple
        3'b110: alu_sel = 3'b110;//div
        3'b111: alu_sel = 3'b111;//compare
        default: alu_sel = 3'b000;//add
    endcase
end

endmodule


//intruction rom
module instruction_memory (
    input wire [7:0] a,          // Operand A (8 bits)
    input wire [7:0] b,          // Operand B (8 bits)
    input wire [2:0] alu_sel,    // ALU Operation select signal
    output wire [2:0] alu_sel_out, // ALU control signal to control unit
    output wire [7:0] a_out,     // Operand A to ALU
    output wire [7:0] b_out      // Operand B to ALU
);

    
    assign alu_sel_out = alu_sel;
    assign a_out = a;
    assign b_out = b;

endmodule
