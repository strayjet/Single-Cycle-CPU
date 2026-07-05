module next_pc_logic(
    input wire [7:0] pc_plus_1,
    input wire [7:0] branch_target,
    input wire [7:0] jump_target,
    input wire branch,
    input wire zero,
    input wire jump,

    output wire [7:0] next_pc
);

    wire branch_taken;
    assign branch_taken = branch && zero;

    assign next_pc =
        (jump) ? jump_target :
        (branch_taken) ? branch_target :
        pc_plus_1;

endmodule
