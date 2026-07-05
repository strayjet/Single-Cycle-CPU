module data_memory(
    input wire clk,
    input wire mem_read,
    input wire mem_write,

    input wire [7:0] address,
    input wire [7:0] write_data,

    output reg [7:0] read_data
);

    reg [7:0] memory [0:255];

    // READ
    always @(*) begin
        if (mem_read)
            read_data = memory[address];
        else
            read_data = 8'b0;
    end

    // WRITE
    always @(posedge clk) begin
        if (mem_write)
            memory[address] <= write_data;
    end

endmodule