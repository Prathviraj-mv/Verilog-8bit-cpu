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
