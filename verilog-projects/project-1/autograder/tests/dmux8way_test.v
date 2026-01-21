module dmux8way_test;
  reg in;
  reg [2:0] sel;
  wire a, b, c, d, e, f, g, h;

  student_dmux8way dut (.in(in), .sel(sel), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .h(h));

  initial begin
    $display("|in|sel|a|b|c|d|e|f|g|h|");

    in = 0;
    sel = 'b000;
    #1 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d, e, f, g, h);

    in = 0;
    sel = 'b001;
    #2 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d, e, f, g, h);

    in = 0;
    sel = 'b010;
    #3 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d, e, f, g, h);

    in = 0;
    sel = 'b011;
    #4 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d, e, f, g, h);

    in = 0;
    sel = 'b100;
    #5 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d, e, f, g, h);

    in = 0;
    sel = 'b101;
    #6 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d, e, f, g, h);

    in = 0;
    sel = 'b110;
    #7 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d, e, f, g, h);

    in = 0;
    sel = 'b111;
    #8 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d, e, f, g, h);

    in = 1;
    sel = 'b000;
    #9 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d, e, f, g, h);

    in = 1;
    sel = 'b001;
    #10 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d, e, f, g, h);

    in = 1;
    sel = 'b010;
    #11 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d, e, f, g, h);

    in = 1;
    sel = 'b011;
    #12 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d, e, f, g, h);

    in = 1;
    sel = 'b100;
    #13 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d, e, f, g, h);

    in = 1;
    sel = 'b101;
    #14 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d, e, f, g, h);

    in = 1;
    sel = 'b110;
    #15 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d, e, f, g, h);

    in = 1;
    sel = 'b111;
    #16 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", in, sel, a, b, c, d, e, f, g, h);
  end
endmodule
