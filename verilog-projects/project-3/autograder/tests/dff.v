/*
 * Copyright Grant Lemons for CSCI410
 * 2025-11-03
 */

module clock(output reg clock);
    initial begin
        clock = 0;
    end

    always begin
        #1 clock = ~clock;
    end
endmodule

module dff #(parameter N = 1) (input [N-1:0] in, output [N-1:0] out);
    wire clk;
    clock c (clk);
    clock_dff #(N) inner (in, clk, out);
endmodule

module clock_dff #(parameter N = 1) (input [N-1:0] in, input clock, output reg [N-1:0] out);
    initial begin
        out = 0;
    end
    always @(posedge clock) begin
        out = in;
    end
endmodule
