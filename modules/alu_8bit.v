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
