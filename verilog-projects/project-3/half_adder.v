module student_half_adder(input a, b, output sum, carry);
    // Details in the textbook.
    student_xor xorInst(a, b, sum);
    student_and andInst(a, b, carry);
endmodule