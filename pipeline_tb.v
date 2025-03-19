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
