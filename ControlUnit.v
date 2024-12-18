//control unit module
module control_unit (opcode,alu_sel);
input [2:0] opcode;
output [2:0] alu_sel;
reg [2:0] alu_sel;

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
