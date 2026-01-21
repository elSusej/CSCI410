module or_test;
  reg a, b;
  wire out;

  student_or dut (.a(a), .b(b), .out(out));

  initial begin
    $display("|a|b|out|");

    a = 0;
    b = 0;
    #1 $display("|%b|%b|%b|", a, b, out);

    a = 0;
    b = 1;
    #2 $display("|%b|%b|%b|", a, b, out);

    a = 1;
    b = 0;
    #3 $display("|%b|%b|%b|", a, b, out);

    a = 1;
    b = 1;
    #4 $display("|%b|%b|%b|", a, b, out);
  end
endmodule
