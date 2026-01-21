module or8way_test;
  reg [7:0] in;
  wire out;

  student_or8way dut (.in(in), .out(out));

  initial begin
    $display("|in|out|");

    in = 'b00000000;
    #1 $display("|%b|%b|", in, out);

    in = 'b11111111;
    #2 $display("|%b|%b|", in, out);

    in = 'b00010000;
    #3 $display("|%b|%b|", in, out);

    in = 'b00000001;
    #4 $display("|%b|%b|", in, out);

    in = 'b00100110;
    #5 $display("|%b|%b|", in, out);
  end
endmodule
