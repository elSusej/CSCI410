module dmux_test;
  reg in, sel;
  wire a, b;

  student_dmux dut (.in(in), .sel(sel), .a(a), .b(b));

  initial begin
    $display("|in|sel|a|b|");

    in = 0;
    sel = 0;
    #1 $display("|%b|%b|%b|%b|", in, sel, a, b);

    in = 0;
    sel = 1;
    #2 $display("|%b|%b|%b|%b|", in, sel, a, b);

    in = 1;
    sel = 0;
    #3 $display("|%b|%b|%b|%b|", in, sel, a, b);

    in = 1;
    sel = 1;
    #4 $display("|%b|%b|%b|%b|", in, sel, a, b);
  end
endmodule
