/*
 * Copyright Grant Lemons for CSCI410
 * 2026-02-24
 */

module fast_ram #(parameter N = 8) (input [15:0] in, input load, input [$clog2(N)-1:0] address, output [15:0] out);
    reg [(N*16)-1:0] mem_contents;
    reg clock;

    initial begin
        clock = 0;
        mem_contents = 'b0;
    end

    always #1 clock = ~clock;
    always @(posedge clock) begin
        mem_contents[16*address +: 16] = load ? in : mem_contents[16*address +: 16];
    end

    assign out = mem_contents[16*address +: 16];
endmodule
