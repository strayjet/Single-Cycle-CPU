module register_file(
    input wire clk,
    input wire rst,

    input wire reg_write,

    input wire [3:0] read_reg1,
    input wire [3:0] read_reg2,
    input wire [3:0] write_reg,

    input wire [7:0] write_data,

    output wire [7:0] read_data1,
    output wire [7:0] read_data2
);

    reg [7:0] registers [0:15];

    assign read_data1 = registers[read_reg1];
    assign read_data2 = registers[read_reg2];

    integer i;

    always @(posedge clk or posedge rst) begin

        if(rst) begin
            for(i=0;i<16;i=i+1)
                registers[i] <= 8'b0;
        end

        else if(reg_write) begin
            registers[write_reg] <= write_data;
        end

    end

endmodule