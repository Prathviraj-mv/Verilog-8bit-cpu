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

    // Clock generation
    initial 
      begin
        forever
        clk = 0;#10;
        clk = ~clk;#10; 
    end

    initial
      begin

        //addition (a + b)
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b000;clk =1;rst=0;#20;
          
        //sub (a-b)
        a = 8'b11001100;b = 8'b10101010;opcode = 3'b001;clk =1;rst=0;#20;
          
        //and
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b010;clk =1;rst=0;#20;
          
        //or
        a = 8'b11001100;b = 8'b10101010;opcode = 3'b011;clk =1;rst=0;#20;

        //xor
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b100;clk =1;rst=0;#20; 
          
        //mul
        a = 8'b11001100;b = 8'b10101010;opcode = 3'b101;clk =1;rst=0;#20;

        //div  
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b110;clk =1;rst=0;#20;
          
        //comp
        a = 8'b11001100;b = 8'b10101010;opcode = 3'b111;clk =1;rst=0;#20;

        


    end

endmodule
