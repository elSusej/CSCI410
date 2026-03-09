/*
 * Copyright Grant Lemons for CSCI410
 * 2026-02-24
 */

module dff #(parameter N = 1) (input [N-1:0] in, output reg [N-1:0] out);
    reg clock;
    initial begin
        clock = 0;
        out = 0;
    end

    always #1 clock = ~clock;
    always @(posedge clock) out = in;
endmodule
