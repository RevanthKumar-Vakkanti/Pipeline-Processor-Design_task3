`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2025 23:01:21
// Design Name: 
// Module Name: pipeline_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module pipelined_processor_tb;

    reg clk;      
    reg rst;                 
    reg [7:0] instr;         
    wire [7:0] res;

    pipelined_processor dut ( clk, rst, instr, res);

    // Clock generation: toggles every 5 time units
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus block: applies reset and test instructions
    initial begin
        rst = 1;         // Apply reset
        instr = 8'b0;    // Initialize instruction to zero

        #10 rst = 0;     // Release reset after 10 time units

        // Test Case 1: ADD operation (opcode 00, operands 3 and 2)
        #10 instr = {2'b00, 3'd3, 3'd2}; 
        #20; // Wait for the pipeline to process

        // Test Case 2: SUB operation (opcode 01, operands 5 and 1)
        #10 instr = {2'b01, 3'd5, 3'd1}; 
        #20;

        // Test Case 3: LOAD operation (opcode 10, immediate value 2)
        #10 instr = {2'b10, 3'd0, 3'd2}; 
        #20;

        #40 $finish;
    end

    initial begin
        $monitor("Time: %0t | Instruction: %b | Result: %d", $time, instr, res);
    end

endmodule








/*module pipelined_processor_tb;

    // Inputs
    reg clk;
    reg rst;
    reg [15:0] instr;

    // Outputs
    wire [7:0] result;

    // Instantiate the pipelined processor
    pipelined_processor uut (
        .clk(clk),
        .rst(rst),
        .instr(instr),
        .result(result)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Test procedure
    initial begin
        // Initialize inputs
        rst = 1;
        instr = 16'b0;

        // Release reset after 10 time units
        #10 rst = 0;

        // Test case 1: ADD operation (instr = ADD op1=5, op2=3)
        #10 instr = {3'b000, 5'd5, 3'd0, 5'd3}; // ADD 5, 3
        #20; // Wait for pipeline to process

        // Test case 2: SUB operation (instr = SUB op1=8, op2=2)
        #10 instr = {3'b001, 5'd8, 3'd0, 5'd2}; // SUB 8, 2
        #20;

        // Test case 3: LOAD operation (instr = LOAD imm=10)
        #10 instr = {3'b010, 8'd10}; // LOAD 10

        // End simulation
       #50 $stop;
      
    end

    // Monitor outputs
    initial begin
      $monitor("Time: %0t | Instruction: %b | Result: %b", $time, instr, result);
    end
endmodule */
