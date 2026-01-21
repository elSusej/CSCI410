module and16_test;
  reg [15:0] a, b;
  wire [15:0] out;

  student_and16 dut (.a(a), .b(b), .out(out));

  initial begin
    $display("|a|b|out|");

    a = 'b0000000000000000;
    b = 'b0000000000000000;
    #1 $display("|%b|%b|%b|", a, b, out);

    a = 'b0000000000000000;
    b = 'b1111111111111111;
    #2 $display("|%b|%b|%b|", a, b, out);

    a = 'b1111111111111111;
    b = 'b1111111111111111;
    #3 $display("|%b|%b|%b|", a, b, out);

    a = 'b1010101010101010;
    b = 'b0101010101010101;
    #4 $display("|%b|%b|%b|", a, b, out);

    a = 'b0011110011000011;
    b = 'b0000111111110000;
    #5 $display("|%b|%b|%b|", a, b, out);

    a = 'b0001001000110100;
    b = 'b1001100001110110;
    #6 $display("|%b|%b|%b|", a, b, out);
  end
endmodule
