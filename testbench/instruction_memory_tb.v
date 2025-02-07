module instruction_memory_tb;

    reg [7:0] a;
    reg [7:0] b;
    reg [2:0] opcode;
    reg save;
    reg reset;

    wire [7:0] alu_out;
    wire carry_out;
    wire [7:0] data_out;
    wire[2:0] alu_sel;
    instruction_memory uut (a,b,opcode,alu_sel,alu_out,carry_out,save,reset,data_out);



    initial
      begin

        //add
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b000;save =0;reset=1;#20;

        //sub
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b001;save=1;reset=0;#20;
        reset =1;#20;
        
          
        //and
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b010;save=1;reset=0;#20;
        reset =1;#20;

        //or
       a = 8'b00000101;b = 8'b00000011;opcode = 3'b011;save=1;reset=0;#20;
       reset =1;#20;

        //xor
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b100;save =1;reset=0;#20; 
 
        //mul
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b101;save=1;reset=0;#20;

        //div  
        a = 8'b00000101;b = 8'b00000011;opcode = 3'b110;save=1;reset=0;#20;

        //comp
          a = 8'b00000101;b = 8'b00000011;opcode = 3'b111;save=1;reset=0;#20;



    end

endmodule
