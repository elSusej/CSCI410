module not_test;
  reg in;
  wire out;

  student_not dut (.in(in), .out(out));

  initial begin
    $display("|in|out|");

    in = 0;
    #1 $display("|%b|%b|", in, out);

    in = 1;
    #2 $display("|%b|%b|", in, out);
  end
endmodule
