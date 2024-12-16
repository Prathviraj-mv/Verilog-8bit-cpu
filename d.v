module alu_8bit (
    input [7:0] a, b,
    input [2:0] alu_sel,
    output reg [7:0] alu_out,
    output reg carry_out
);

always @(*) begin
    case (alu_sel)
        3'b000: begin
            {carry_out, alu_out} = a + b;
        end
        3'b001: begin
            {carry_out, alu_out} = a - b;
        end
        3'b010: begin
            alu_out = a & b;
            carry_out = 0;
        end
        3'b011: begin
            alu_out = a | b;
            carry_out = 0;
        end
        3'b100: begin
            alu_out = a ^ b;
            carry_out = 0;
        end
        3'b101: begin
            {carry_out, alu_out} = a * b;
        end
        3'b110: begin
            if (b != 0) begin
                alu_out = a / b;
                carry_out = 0;
            end else begin
                alu_out = 8'b00000000;
                carry_out = 1;
            end
        end
        3'b111: begin
            alu_out = (a == b) ? 8'b00000001 : 8'b00000000;
            carry_out = 0;
        end
        default: begin
            alu_out = 8'b00000000;
            carry_out = 0;
        end
    endcase
end

endmodule

module control_unit (
    input [2:0] opcode,
    output reg [2:0] alu_sel
);

always @(*) begin
    case (opcode)
        3'b000: alu_sel = 3'b000;
        3'b001: alu_sel = 3'b001;
        3'b010: alu_sel = 3'b010;
        3'b011: alu_sel = 3'b011;
        3'b100: alu_sel = 3'b100;
        3'b101: alu_sel = 3'b101;
        3'b110: alu_sel = 3'b110;
        3'b111: alu_sel = 3'b111;
        default: alu_sel = 3'b000;
    endcase
end

endmodule
