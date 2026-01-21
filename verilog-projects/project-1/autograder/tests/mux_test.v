module mux_test;
  reg a, b, sel;
  wire out;

  student_mux dut (.a(a), .b(b), .sel(sel), .out(out));

  initial begin
    $display("|a|b|sel|out|");

    a = 0;
    b = 0;
    sel = 0;
    #1 $display("|%b|%b|%b|%b|", a, b, sel, out);

    a = 0;
    b = 0;
    sel = 1;
    #2 $display("|%b|%b|%b|%b|", a, b, sel, out);

    a = 0;
    b = 1;
    sel = 0;
    #3 $display("|%b|%b|%b|%b|", a, b, sel, out);

    a = 0;
    b = 1;
    sel = 1;
    #4 $display("|%b|%b|%b|%b|", a, b, sel, out);

    a = 1;
    b = 0;
    sel = 0;
    #5 $display("|%b|%b|%b|%b|", a, b, sel, out);

    a = 1;
    b = 0;
    sel = 1;
    #6 $display("|%b|%b|%b|%b|", a, b, sel, out);

    a = 1;
    b = 1;
    sel = 0;
    #7 $display("|%b|%b|%b|%b|", a, b, sel, out);

    a = 1;
    b = 1;
    sel = 1;
    #8 $display("|%b|%b|%b|%b|", a, b, sel, out);
  end
endmodule
