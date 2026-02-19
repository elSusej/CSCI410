module student_inc16(input [15:0] in, output [15:0] out);
    // Implement an incrementer (without using assign out = in + 1)
    // Details in the textbook.

    student_add16 addInst(in, 16'h0001, out);
endmodule