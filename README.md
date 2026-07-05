# TinyRISC-8
### An 8-bit Single-Cycle RISC CPU built in Verilog

TinyRISC-8 is a custom-designed **8-bit single-cycle processor** implemented entirely in **Verilog HDL**. The project demonstrates the complete datapath of a simple RISC architecture including instruction fetch, decode, execution, memory access, and write-back.

The CPU is modularly designed, making every hardware block independently testable and reusable.

---

## Features

- 8-bit datapath
- Single-cycle execution
- Modular Verilog design
- Register File
- ALU
- Control Unit
- Program Counter
- Instruction Memory
- Data Memory
- Branch and Jump support
- Immediate value extension
- Memory Load/Store instructions

---

## Supported Instruction Set

| Instruction | Description |
|------------|-------------|
| ADD | Register addition |
| SUB | Register subtraction |
| AND | Bitwise AND |
| OR | Bitwise OR |
| LW | Load word from memory |
| SW | Store word to memory |
| BEQ | Branch if equal |
| J | Unconditional jump |

---

## CPU Architecture

```
                 +----------------+
                 | Program Counter|
                 +-------+--------+
                         |
                         v
              +---------------------+
              | Instruction Memory  |
              +----------+----------+
                         |
                         v
              +---------------------+
              | Instruction Decoder |
              +----------+----------+
                         |
            +------------+-------------+
            |                          |
            v                          v
   +----------------+        +----------------+
   | Control Unit   |        | Register File  |
   +-------+--------+        +-------+--------+
           |                         |
           |                         |
           |                 +-------v--------+
           |                 |      ALU       |
           |                 +-------+--------+
           |                         |
           |                  +------v------+
           |                  | Data Memory |
           |                  +------+------+
           |                         |
           +-------------------------+
                         |
                         v
                   Write Back
                         |
                         v
                  Register File
```

---

## Project Structure

```
TinyRISC-8
│
├── alu.v
├── control_unit.v
├── cpu.v
├── data_memory.v
├── instruction_decoder.v
├── instruction_memory.v
├── next_pc_logic.v
├── program_counter.v
├── register_file.v
└── testbench.v
```

---

## Core Modules

### Program Counter
Maintains the current instruction address and updates it every clock cycle.

### Instruction Memory
Stores program instructions that are fetched by the CPU.

### Instruction Decoder
Extracts opcode and register fields from the instruction.

### Control Unit
Generates all control signals required for execution based on the opcode.

### Register File
Provides two read ports and one write port for register operations.

### ALU
Performs arithmetic and logical operations.

Supported operations:
- ADD
- SUB
- AND
- OR

### Data Memory
Supports memory read and write operations for load/store instructions.

### Next PC Logic
Determines the next instruction address using:
- Sequential execution
- Conditional branches
- Jump instructions

---

## Datapath

```
PC
 ↓
Instruction Memory
 ↓
Instruction Decoder
 ↓
Register File
 ↓
ALU
 ↓
Data Memory
 ↓
Write Back
 ↓
Register File
```

---

## Control Signals

| Signal | Function |
|---------|----------|
| reg_write | Enables register write |
| mem_read | Enables memory read |
| mem_write | Enables memory write |
| alu_src | Selects ALU source |
| mem_to_reg | Selects write-back data |
| branch | Enables branch logic |
| jump | Enables jump logic |
| alu_op | Selects ALU operation |

---

## Simulation

The processor can be simulated using:

- ModelSim
- QuestaSim
- Icarus Verilog
- GTKWave
- Vivado Simulator

Typical simulation flow:

```bash
iverilog *.v -o cpu
vvp cpu
gtkwave cpu.vcd
```

---

## Learning Objectives

This project was built to gain hands-on experience with:

- Computer Architecture
- Digital Logic Design
- RTL Design
- Verilog HDL
- Processor Datapath Design
- Control Signal Generation
- Memory Interfaces
- Hardware Verification

---

## Future Improvements

- Pipeline implementation
- Hazard detection
- Forwarding unit
- Additional ALU operations
- Shift instructions
- Immediate arithmetic
- Interrupt support
- UART memory-mapped I/O
- Cache memory
- Multi-cycle implementation

---

## Technologies Used

- Verilog HDL
- GTKWave
- ModelSim / Icarus Verilog

---

## Author

Designed and implemented as a computer architecture and digital design project to understand the complete implementation of a simple RISC processor from scratch.
