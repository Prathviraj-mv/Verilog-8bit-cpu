module instruction_memory_tb;

    reg [7:0] a;
    reg [7:0] b;
    reg [2:0] opcode;
    reg clk;
    reg rst;

    wire [7:0] result_out;
    wire carry_out;
    wire [7:0] data_out;
    wire[2:0] alu_sel;
    instruction_memory uut (a,b,opcode,alu_sel,result_out,carry_out,clk,rst,data_out);

    // // Clock generation
    // initial 
    //   begin
    //     forever
    //     clk = 0;#10;
    //     clk = ~clk;#10; // Toggle clock every 5 time units
    // end

    initial
      begin

        // Test Case 1: Addition (a + b)
        a = 8'b00000101; // 5
        b = 8'b00000011; // 3
        opcode = 3'b000; // Add
        clk = 1;
        rst = 0;
        #10;

        
        // Test Case 2: AND operation (a&b)
        a = 8'b11001100;
        b = 8'b10101010;
        opcode = 3'b010; // AND
        clk =1;
        rst =0;
        #10;

        

    end

endmodule
