module dmux4way_test;
  reg in;
  reg [1:0] sel;
  wire a, b, c, d;

  student_dmux4way dut (.in(in), .sel(sel), .a(a), .b(b), .c(c), .d(d));

  initial begin
    $display("|in|sel|a|b|c|d|");

    in = 0;
    sel = 'b00;
    #1 $display("|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d);

    in = 0;
    sel = 'b01;
    #2 $display("|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d);

    in = 0;
    sel = 'b10;
    #3 $display("|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d);

    in = 0;
    sel = 'b11;
    #4 $display("|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d);

    in = 1;
    sel = 'b00;
    #5 $display("|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d);

    in = 1;
    sel = 'b01;
    #6 $display("|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d);

    in = 1;
    sel = 'b10;
    #7 $display("|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d);

    in = 1;
    sel = 'b11;
    #8 $display("|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d);
  end
endmodule
