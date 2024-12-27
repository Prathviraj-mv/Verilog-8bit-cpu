module instruction_memory_tb;

    reg [7:0] a;
    reg [7:0] b;
    reg [2:0] opcode;
    reg clk;
    reg reset;

    wire [7:0] alu_out;
    wire carry_out;
    wire [7:0] data_out;
    wire[2:0] alu_sel;

    
    instruction_memory uut (a,b,opcode,alu_sel,alu_out,carry_out,clk,reset,data_out);
    initial 
        begin forever
            clk =0;#10;
            clk =~clk;#10;
        end   


    initial
      begin

        //add
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b000;reset=0;#20;

        //sub
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b001;reset=0;#20;
        
        
          
        //and
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b010;reset=0;#20;
       

        //or
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b011;reset=0;#20;
       

        //xor
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b100;reset=0;#20; 
 
        //mul
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b101;reset=0;#20;

        //div  
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b110;reset=0;#20;

        //comp
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b111;reset=0;#20;



    end

endmodule
