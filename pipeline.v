`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2025 22:55:48
// Design Name: 
// Module Name: pipeline
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


module pipelined_processor (
    input  clk,          // Clock signal
    input  rst,          // Reset signal
    input  [7:0] instr,  // 8-bit instruction input
    output reg [7:0] res  // 8-bit output result
);

    // Pipeline registers for different stages
    reg [7:0] IF_ID_instr;    // Instruction Fetch to Instruction Decode stage register
    reg [2:0] ID_EX_op1, ID_EX_op2;  // Operands in the Instruction Decode to Execute stage
    reg [1:0] ID_EX_opcode;   // Opcode in the Instruction Decode to Execute stage
    reg [7:0] EX_WB_result;   // Execution to Write-back stage register

    // Opcode definitions
    parameter ADD  = 2'b00;  // Addition operation
    parameter SUB  = 2'b01;  // Subtraction operation
    parameter LOAD = 2'b10;  // Load immediate operation

    // Instruction Fetch (IF) Stage
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            IF_ID_instr <= 8'b0;  // Reset instruction register
        end else begin
            IF_ID_instr <= instr; // Fetch instruction
        end
    end

    // Instruction Decode (ID) Stage
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ID_EX_op1 <= 3'b0;    // Reset operand 1
            ID_EX_op2 <= 3'b0;    // Reset operand 2
            ID_EX_opcode <= 2'b0; // Reset opcode
        end else begin
            ID_EX_opcode <= IF_ID_instr[7:6]; // Extract opcode
            ID_EX_op1 <= IF_ID_instr[5:3];   // Extract first operand
            ID_EX_op2 <= IF_ID_instr[2:0];   // Extract second operand
        end
    end

    // Execution (EX) Stage
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            EX_WB_result <= 8'b0; // Reset execution result
        end else begin
            case (ID_EX_opcode)
                ADD:  EX_WB_result <= ID_EX_op1 + ID_EX_op2; // Perform addition
                SUB:  EX_WB_result <= ID_EX_op1 - ID_EX_op2; // Perform subtraction
                LOAD: EX_WB_result <= {5'b0, ID_EX_op2}; // Load immediate value
                default: EX_WB_result <= 8'b0; // Default case
            endcase
        end
    end

    // Write-back (WB) Stage
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            res <= 8'b0; // Reset final result
        end else begin
            res <= EX_WB_result; // Write execution result to output
        end
    end

endmodule
