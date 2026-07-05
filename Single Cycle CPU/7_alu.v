module alu(
    input wire [7:0] in1,
    input wire [7:0] in2,
    input wire [2:0] alu_op,

    output reg [7:0] result,
    output wire zero
);

    always @(*) begin
        case (alu_op)

            3'b011: result = in1 + in2; // ADD
            3'b100: result = in1 - in2; // SUB
            3'b001: result = in1 & in2; // AND
            3'b010: result = in1 | in2; // OR

            default: result = 8'b0;

        endcase
    end

    assign zero = (result == 8'b0);

endmodule