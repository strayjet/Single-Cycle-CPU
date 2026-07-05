module instruction_decoder(
    input wire [15:0] instruction,

    output wire [3:0] opcode,
    output wire [3:0] rd,
    output wire [3:0] rs,
    output wire [3:0] rt
);

    assign opcode = instruction[15:12];
    assign rd     = instruction[11:8];
    assign rs     = instruction[7:4];
    assign rt     = instruction[3:0];

endmodule