module cpu(
    input wire clk,
    input wire rst
);

    // -------------------------
    // PC
    // -------------------------
    wire [7:0] pc;
    wire [7:0] next_pc;

    program_counter PC(
        .clk(clk),
        .rst(rst),
        .next_pc(next_pc),
        .pc(pc)
    );

    // -------------------------
    // Instruction Fetch
    // -------------------------
    wire [15:0] instruction;

    instruction_memory IM(
        .address(pc),
        .instruction(instruction)
    );

    // -------------------------
    // Decode
    // -------------------------
    wire [3:0] opcode, rd, rs, rt;

    instruction_decoder ID(
        .instruction(instruction),
        .opcode(opcode),
        .rd(rd),
        .rs(rs),
        .rt(rt)
    );

    // -------------------------
    // Control Unit
    // -------------------------
    wire reg_write, mem_read, mem_write;
    wire alu_src, mem_to_reg;
    wire branch, jump;
    wire [2:0] alu_op;

    control_unit CU(
        .opcode(opcode),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .alu_src(alu_src),
        .mem_to_reg(mem_to_reg),
        .branch(branch),
        .jump(jump),
        .alu_op(alu_op)
    );

    // -------------------------
    // Register File
    // -------------------------
    wire [7:0] read_data1, read_data2;
    wire [7:0] write_data;

    register_file RF(
        .clk(clk),
        .rst(rst),
        .reg_write(reg_write),
        .read_reg1(rs),
        .read_reg2(rt),
        .write_reg(rd),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // -------------------------
    // Immediate Extend
    // -------------------------
    wire [7:0] imm_ext;
    assign imm_ext = {{4{instruction[3]}}, instruction[3:0]};

    // -------------------------
    // ALU
    // -------------------------
    wire [7:0] alu_in2;
    wire [7:0] alu_result;
    wire zero;

    assign alu_in2 = (alu_src) ? imm_ext : read_data2;

    alu ALU(
        .in1(read_data1),
        .in2(alu_in2),
        .alu_op(alu_op),
        .result(alu_result),
        .zero(zero)
    );

    // -------------------------
    // Data Memory
    // -------------------------
    wire [7:0] mem_data;

    data_memory DM(
        .clk(clk),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .address(alu_result),
        .write_data(read_data2),
        .read_data(mem_data)
    );

    // -------------------------
    // Writeback
    // -------------------------
    assign write_data = (mem_to_reg) ? mem_data : alu_result;

    // -------------------------
    // Next PC logic
    // -------------------------
    wire [7:0] pc_plus_1 = pc + 1;
    wire [7:0] branch_target = pc_plus_1 + imm_ext;
    wire [7:0] jump_target = {pc[7:4], instruction[11:0]};

    next_pc_logic NPC(
        .pc_plus_1(pc_plus_1),
        .branch_target(branch_target),
        .jump_target(jump_target),
        .branch(branch),
        .zero(zero),
        .jump(jump),
        .next_pc(next_pc)
    );

endmodule