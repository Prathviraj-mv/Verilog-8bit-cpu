`timescale 1ns / 1ps

module tb_register_module;
  reg clk;
  reg rst;
  reg [7:0] alu_out;
  wire [7:0] data_out;

  
  register_module uut (clk,rst,alu_out,data_out);

  initial begin
    clk = 0;
    forever #5 clk = ~clk; 
  end

  initial begin
    
    rst = 0;
    alu_out = 8'd0;

    #10 rst = 1;
    #10 rst = 0;

  
    #10;
    if (data_out !== 8'b00000000) $display("Test 1 Failed");

    // Test 2: Load alu_out value into data_out
    alu_out = 8'b10101010;
    #10; // Wait for a clock edge
    if (data_out !== 8'b10101010) $display("Test 2 Failed");

    // Test 3: Change alu_out and verify update
    alu_out = 8'b11110000;
    #10; // Wait for a clock edge
    if (data_out !== 8'b11110000) $display("Test 3 Failed");

    // Test 4: Verify reset during operation
    rst = 1;
    #10;
    if (data_out !== 8'b00000000) $display("Test 4 Failed");
    rst = 0;

    // End simulation
    #10 $finish;
  end
endmodule
