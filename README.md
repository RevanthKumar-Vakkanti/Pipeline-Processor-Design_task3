# Pipeline Processor Design

*COMPANY*: CODTECH IT SOLUTIONS

*NAME*: VAKKANTI LAKSHMI REVANTH KUMAR

*INTERN ID*: CT08VZT

*DOMAIN*: VLSI

*DURATION*: 4 WEEKS

*MENTOR*: NEELA SANTOSH KUMAR

## DESCRIPTION: TASK-3

=> Design a *4-stage pipelined processor* with basic instructions like *ADD, SUB & LOAD.*

  * A pipelined processor is a type of processor that divides the execution of instructions into multiple stages.
    Instead of executing one instruction at a time, a pipelined processor overlaps different stages of multiple instructions, improving overall performance.
    It works similarly to an assembly line, where different parts of an instruction are processed simultaneously in different pipeline stages.
    
## Key Stages of a Pipeline Processor

 A basic four-stage pipeline consists of:
 
  1. Instruction Fetch (IF) – Fetches the instruction from memory.
     
  2. Instruction Decode (ID) – Decodes the instruction and identifies operands.
     
  3. Execute (EX) – Performs the required operation (e.g., addition, subtraction, load).
  
  4. Write Back (WB) – Writes the computed result back to the register.

## Implements a 4-stage pipelined processor.

   1. Registers Used in Pipeline Stages

      * *IF_ID_instr* → Holds the instruction after fetch.

      * *ID_EX_op1, ID_EX_op2, ID_EX_opcode* → Stores operands and opcode after the decode stage.
      
      * *EX_WB_result* → Holds the result after execution, before writing back.
   
   2. Local Parameters for Operations

      * *ADD = 2'b00* → Addition operation.

      * *SUB = 2'b01* → Subtraction operation.

      * *LOAD = 2'b10* → Load immediate value

   3. Pipeline Stages Implementation

      * Instruction Fetch (IF) Stage - Fetches instruction from instr input and stores it in IF_ID_instr.

      * Instruction Decode (ID) Stage - Extracts opcode and operands from IF_ID_instr and stores them in ID_EX_opcode, ID_EX_op1, and ID_EX_op2.

      * Execute (EX) and Write Back (WB) Stage

        - Performs the operation based on ID_EX_opcode.

        - Writes the result into EX_WB_result.

        - Passes the final result to the output register result.

## Applications of Pipelined Processors

   * General-Purpose Computing – Used in modern CPUs to improve instruction execution speed.
   
   * Embedded Systems – Used in microcontrollers and DSPs for efficient processing.
   
   * Graphics Processing (GPUs) – Pipelining enhances parallel execution of graphics tasks.
   
   * Network Processors – Used in routers and switches for fast packet processing.
   
   * Real-time Systems – Used in automotive and industrial applications where quick responses are needed.

## OUTPUT WAVEFORM:

![Image](https://github.com/user-attachments/assets/e17ea55a-f6c5-4873-a832-f8d3203b002f)

## OUTPUT WAVEFORM INCULDING REGISTERS:

![Image](https://github.com/user-attachments/assets/38544055-1a7a-433f-a6cc-3d452999dcdf)

## SCHEMATIC DIAGRAM:

![Image](https://github.com/user-attachments/assets/6228dd6f-c390-46cf-8ea6-84ac838a54bb)
