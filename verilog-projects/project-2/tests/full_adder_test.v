module full_adder_test;
  reg a, b, c;
  wire sum, carry;

  student_full_adder dut (.a(a), .b(b), .c(c), .sum(sum), .carry(carry));

  initial begin
    $display("|a|b|c|sum|carry|");

    a = 0;
    b = 0;
    c = 0;
    #1 $display("|%b|%b|%b|%b|%b|", a, b, c, sum, carry);

    a = 0;
    b = 0;
    c = 1;
    #2 $display("|%b|%b|%b|%b|%b|", a, b, c, sum, carry);

    a = 0;
    b = 1;
    c = 0;
    #3 $display("|%b|%b|%b|%b|%b|", a, b, c, sum, carry);

    a = 0;
    b = 1;
    c = 1;
    #4 $display("|%b|%b|%b|%b|%b|", a, b, c, sum, carry);

    a = 1;
    b = 0;
    c = 0;
    #5 $display("|%b|%b|%b|%b|%b|", a, b, c, sum, carry);

    a = 1;
    b = 0;
    c = 1;
    #6 $display("|%b|%b|%b|%b|%b|", a, b, c, sum, carry);

    a = 1;
    b = 1;
    c = 0;
    #7 $display("|%b|%b|%b|%b|%b|", a, b, c, sum, carry);

    a = 1;
    b = 1;
    c = 1;
    #8 $display("|%b|%b|%b|%b|%b|", a, b, c, sum, carry);
  end
endmodule
