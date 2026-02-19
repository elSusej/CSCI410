module student_full_adder(input a, b, c, output sum, carry);
    // Details in the textbook.

    wire carry1, carry2, sum1;
    student_half_adder haInst(a, b, sum1,carry1);
    student_half_adder haInst2(sum1, c, sum, carry2);
    student_or orInst(carry1, carry2, carry);
    
endmodule