`timescale 1ns/1ps

module cpu_tb;

    reg clk;
    reg rst;

    cpu DUT (
        .clk(clk),
        .rst(rst)
    );

    // CLOCK
    always #5 clk = ~clk;


    // WAVEFORM
    initial begin
        $dumpfile("cpu.vcd");
        $dumpvars(0, cpu_tb);
    end

    // RESET + RUN
    initial begin
        clk = 0;
        rst = 1;

        #20;
        rst = 0;

        #200;

        $display("DONE");
        $finish;
    end

endmodule