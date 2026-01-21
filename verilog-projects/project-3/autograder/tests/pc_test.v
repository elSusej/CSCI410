module pc_test;
  reg signed [15:0] in;
  reg reset, load, inc;
  wire signed [15:0] out;

  student_pc dut (.in(in), .reset(reset), .load(load), .inc(inc), .out(out));

  initial begin
    $display("|time|in|reset|load|inc|out|");

    in = 0;
    reset = 1'b0;
    load = 1'b0;
    inc = 1'b0;
    #1 $display("|0+|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 0;
    reset = 1'b0;
    load = 1'b0;
    inc = 1'b0;
    #1 $display("|1|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 0;
    reset = 1'b0;
    load = 1'b0;
    inc = 1'b1;
    #1 $display("|1+|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 0;
    reset = 1'b0;
    load = 1'b0;
    inc = 1'b1;
    #1 $display("|2|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = -32123;
    reset = 1'b0;
    load = 1'b0;
    inc = 1'b1;
    #1 $display("|2+|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = -32123;
    reset = 1'b0;
    load = 1'b0;
    inc = 1'b1;
    #1 $display("|3|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = -32123;
    reset = 1'b0;
    load = 1'b1;
    inc = 1'b1;
    #1 $display("|3+|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = -32123;
    reset = 1'b0;
    load = 1'b1;
    inc = 1'b1;
    #1 $display("|4|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = -32123;
    reset = 1'b0;
    load = 1'b0;
    inc = 1'b1;
    #1 $display("|4+|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = -32123;
    reset = 1'b0;
    load = 1'b0;
    inc = 1'b1;
    #1 $display("|5|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = -32123;
    reset = 1'b0;
    load = 1'b0;
    inc = 1'b1;
    #1 $display("|5+|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = -32123;
    reset = 1'b0;
    load = 1'b0;
    inc = 1'b1;
    #1 $display("|6|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 12345;
    reset = 1'b0;
    load = 1'b1;
    inc = 1'b0;
    #1 $display("|6+|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 12345;
    reset = 1'b0;
    load = 1'b1;
    inc = 1'b0;
    #1 $display("|7|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 12345;
    reset = 1'b1;
    load = 1'b1;
    inc = 1'b0;
    #1 $display("|7+|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 12345;
    reset = 1'b1;
    load = 1'b1;
    inc = 1'b0;
    #1 $display("|8|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 12345;
    reset = 1'b0;
    load = 1'b1;
    inc = 1'b1;
    #1 $display("|8+|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 12345;
    reset = 1'b0;
    load = 1'b1;
    inc = 1'b1;
    #1 $display("|9|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 12345;
    reset = 1'b1;
    load = 1'b1;
    inc = 1'b1;
    #1 $display("|9+|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 12345;
    reset = 1'b1;
    load = 1'b1;
    inc = 1'b1;
    #1 $display("|10|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 12345;
    reset = 1'b0;
    load = 1'b0;
    inc = 1'b1;
    #1 $display("|10+|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 12345;
    reset = 1'b0;
    load = 1'b0;
    inc = 1'b1;
    #1 $display("|11|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 12345;
    reset = 1'b1;
    load = 1'b0;
    inc = 1'b1;
    #1 $display("|11+|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 12345;
    reset = 1'b1;
    load = 1'b0;
    inc = 1'b1;
    #1 $display("|12|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 0;
    reset = 1'b0;
    load = 1'b1;
    inc = 1'b1;
    #1 $display("|12+|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 0;
    reset = 1'b0;
    load = 1'b1;
    inc = 1'b1;
    #1 $display("|13|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 0;
    reset = 1'b0;
    load = 1'b0;
    inc = 1'b1;
    #1 $display("|13+|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 0;
    reset = 1'b0;
    load = 1'b0;
    inc = 1'b1;
    #1 $display("|14|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 22222;
    reset = 1'b1;
    load = 1'b0;
    inc = 1'b0;
    #1 $display("|14+|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    in = 22222;
    reset = 1'b1;
    load = 1'b0;
    inc = 1'b0;
    #1 $display("|15|%d|%b|%b|%b|%d|", in, reset, load, inc, out);

    $finish;
  end
endmodule
