# Single Cycle CPU in Verilog

A custom-designed 8-bit single-cycle RISC-like CPU implemented in Verilog HDL.  
This project demonstrates full CPU datapath design including instruction fetch, decode, execute, memory access, and write-back stages.

---

## Features

- 8-bit Program Counter
- 16-bit Instruction Format
- Register File (16 registers, 8-bit each)
- ALU supporting:
  - ADD
  - SUB
  - AND
  - OR
  - XOR
  - NOT
  - INC
- Instruction Memory (ROM using `$readmemh`)
- Data Memory (256 x 8-bit RAM)
- Control Unit (hardwired control logic)
- Single-cycle execution model
- Branch & Jump support (basic implementation)

---
## Instruction Set (ISA)

| Opcode | Instruction | Description |
|--------|------------|-------------|
| 0000 | MVR | Move Register |
| 0001 | LDB | Load Byte |
| 0010 | STB | Store Byte |
| 1011 | ADD | Addition |
| 1100 | SUB | Subtraction |
| 1000 | NOT | Bitwise NOT |
| 1101 | XOR | XOR operation |
| 1110 | INC | Increment |

---
