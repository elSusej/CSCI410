module student_add16(input [15:0] a, b, output [15:0] out);
    // Implement a 16 bit adder (without using assign out = a + b)

    wire [16:0] carry; // carry[0] is the carry-in for the least significant bit, which is 0, and carry[16] is the carry-out from the most significant bit, which we can ignore.
    assign carry[0] = 1'b0;
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
            student_full_adder faInst(a[i], b[i], carry[i], out[i], carry[i+1]);
        end
    endgenerate
endmodule