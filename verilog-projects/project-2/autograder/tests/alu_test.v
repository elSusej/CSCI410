module alu_test;
  reg [15:0] x, y;
  reg zx, nx, zy, ny, f, no;
  wire [15:0] out;
  wire zr, ng;

  student_alu dut (.x(x), .y(y), .zx(zx), .nx(nx), .zy(zy), .ny(ny), .f(f), .no(no), .out(out), .zr(zr), .ng(ng));

  initial begin
    $display("|x|y|zx|nx|zy|ny|f|no|out|zr|ng|");

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 1;
    nx = 0;
    zy = 1;
    ny = 0;
    f = 1;
    no = 0;
    #1 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 1;
    nx = 1;
    zy = 1;
    ny = 1;
    f = 1;
    no = 1;
    #2 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 1;
    nx = 1;
    zy = 1;
    ny = 0;
    f = 1;
    no = 0;
    #3 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 0;
    nx = 0;
    zy = 1;
    ny = 1;
    f = 0;
    no = 0;
    #4 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 1;
    nx = 1;
    zy = 0;
    ny = 0;
    f = 0;
    no = 0;
    #5 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 0;
    nx = 0;
    zy = 1;
    ny = 1;
    f = 0;
    no = 1;
    #6 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 1;
    nx = 1;
    zy = 0;
    ny = 0;
    f = 0;
    no = 1;
    #7 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 0;
    nx = 0;
    zy = 1;
    ny = 1;
    f = 1;
    no = 1;
    #8 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 1;
    nx = 1;
    zy = 0;
    ny = 0;
    f = 1;
    no = 1;
    #9 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 0;
    nx = 1;
    zy = 1;
    ny = 1;
    f = 1;
    no = 1;
    #10 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 1;
    nx = 1;
    zy = 0;
    ny = 1;
    f = 1;
    no = 1;
    #11 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 0;
    nx = 0;
    zy = 1;
    ny = 1;
    f = 1;
    no = 0;
    #12 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 1;
    nx = 1;
    zy = 0;
    ny = 0;
    f = 1;
    no = 0;
    #13 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 0;
    nx = 0;
    zy = 0;
    ny = 0;
    f = 1;
    no = 0;
    #14 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 0;
    nx = 1;
    zy = 0;
    ny = 0;
    f = 1;
    no = 1;
    #15 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 0;
    nx = 0;
    zy = 0;
    ny = 1;
    f = 1;
    no = 1;
    #16 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 0;
    nx = 0;
    zy = 0;
    ny = 0;
    f = 0;
    no = 0;
    #17 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000000000;
    y = 'b1111111111111111;
    zx = 0;
    nx = 1;
    zy = 0;
    ny = 1;
    f = 0;
    no = 1;
    #18 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 1;
    nx = 0;
    zy = 1;
    ny = 0;
    f = 1;
    no = 0;
    #19 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 1;
    nx = 1;
    zy = 1;
    ny = 1;
    f = 1;
    no = 1;
    #20 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 1;
    nx = 1;
    zy = 1;
    ny = 0;
    f = 1;
    no = 0;
    #21 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 0;
    nx = 0;
    zy = 1;
    ny = 1;
    f = 0;
    no = 0;
    #22 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 1;
    nx = 1;
    zy = 0;
    ny = 0;
    f = 0;
    no = 0;
    #23 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 0;
    nx = 0;
    zy = 1;
    ny = 1;
    f = 0;
    no = 1;
    #24 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 1;
    nx = 1;
    zy = 0;
    ny = 0;
    f = 0;
    no = 1;
    #25 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 0;
    nx = 0;
    zy = 1;
    ny = 1;
    f = 1;
    no = 1;
    #26 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 1;
    nx = 1;
    zy = 0;
    ny = 0;
    f = 1;
    no = 1;
    #27 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 0;
    nx = 1;
    zy = 1;
    ny = 1;
    f = 1;
    no = 1;
    #28 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 1;
    nx = 1;
    zy = 0;
    ny = 1;
    f = 1;
    no = 1;
    #29 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 0;
    nx = 0;
    zy = 1;
    ny = 1;
    f = 1;
    no = 0;
    #30 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 1;
    nx = 1;
    zy = 0;
    ny = 0;
    f = 1;
    no = 0;
    #31 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 0;
    nx = 0;
    zy = 0;
    ny = 0;
    f = 1;
    no = 0;
    #32 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 0;
    nx = 1;
    zy = 0;
    ny = 0;
    f = 1;
    no = 1;
    #33 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 0;
    nx = 0;
    zy = 0;
    ny = 1;
    f = 1;
    no = 1;
    #34 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 0;
    nx = 0;
    zy = 0;
    ny = 0;
    f = 0;
    no = 0;
    #35 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);

    x = 'b0000000000010001;
    y = 'b0000000000000011;
    zx = 0;
    nx = 1;
    zy = 0;
    ny = 1;
    f = 0;
    no = 1;
    #36 $display("|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|%b|", x, y, zx, nx, zy, ny, f, no, out, zr, ng);
  end
endmodule
