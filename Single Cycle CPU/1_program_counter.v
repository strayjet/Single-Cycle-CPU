module program_counter(
    input wire clk,
    input wire rst,
    input wire [7:0] next_pc,

    output reg [7:0] pc
);

    always @(posedge clk or posedge rst) begin
        if(rst)
            pc <= 8'h00;
        else
            pc <= next_pc;
    end

endmodule