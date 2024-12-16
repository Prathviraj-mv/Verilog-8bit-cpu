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
