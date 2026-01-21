module ram8_test;
  reg signed [15:0] in;
  reg load;
  reg [2:0] address;
  wire signed [15:0] out;

  student_ram8 dut (.in(in), .load(load), .address(address), .out(out));

  initial begin
    $display("|time|in|load|address|out|");

    in = 0;
    load = 1'b0;
    address = 0;
    #1 $display("|0+|%d|%b|%d|%d|", in, load, address, out);

    in = 0;
    load = 1'b0;
    address = 0;
    #1 $display("|1|%d|%b|%d|%d|", in, load, address, out);

    in = 0;
    load = 1'b1;
    address = 0;
    #1 $display("|1+|%d|%b|%d|%d|", in, load, address, out);

    in = 0;
    load = 1'b1;
    address = 0;
    #1 $display("|2|%d|%b|%d|%d|", in, load, address, out);

    in = 11111;
    load = 1'b0;
    address = 0;
    #1 $display("|2+|%d|%b|%d|%d|", in, load, address, out);

    in = 11111;
    load = 1'b0;
    address = 0;
    #1 $display("|3|%d|%b|%d|%d|", in, load, address, out);

    in = 11111;
    load = 1'b1;
    address = 1;
    #1 $display("|3+|%d|%b|%d|%d|", in, load, address, out);

    in = 11111;
    load = 1'b1;
    address = 1;
    #1 $display("|4|%d|%b|%d|%d|", in, load, address, out);

    in = 11111;
    load = 1'b0;
    address = 0;
    #1 $display("|4+|%d|%b|%d|%d|", in, load, address, out);

    in = 11111;
    load = 1'b0;
    address = 0;
    #1 $display("|5|%d|%b|%d|%d|", in, load, address, out);

    in = 3333;
    load = 1'b0;
    address = 3;
    #1 $display("|5+|%d|%b|%d|%d|", in, load, address, out);

    in = 3333;
    load = 1'b0;
    address = 3;
    #1 $display("|6|%d|%b|%d|%d|", in, load, address, out);

    in = 3333;
    load = 1'b1;
    address = 3;
    #1 $display("|6+|%d|%b|%d|%d|", in, load, address, out);

    in = 3333;
    load = 1'b1;
    address = 3;
    #1 $display("|7|%d|%b|%d|%d|", in, load, address, out);

    in = 3333;
    load = 1'b0;
    address = 3;
    #1 $display("|7+|%d|%b|%d|%d|", in, load, address, out);

    in = 3333;
    load = 1'b0;
    address = 3;
    #1 $display("|8|%d|%b|%d|%d|", in, load, address, out);

    in = 3333;
    load = 1'b0;
    address = 1;
    #0 $display("|8|%d|%b|%d|%d|", in, load, address, out);

    in = 7777;
    load = 1'b0;
    address = 1;
    #1 $display("|8+|%d|%b|%d|%d|", in, load, address, out);

    in = 7777;
    load = 1'b0;
    address = 1;
    #1 $display("|9|%d|%b|%d|%d|", in, load, address, out);

    in = 7777;
    load = 1'b1;
    address = 7;
    #1 $display("|9+|%d|%b|%d|%d|", in, load, address, out);

    in = 7777;
    load = 1'b1;
    address = 7;
    #1 $display("|10|%d|%b|%d|%d|", in, load, address, out);

    in = 7777;
    load = 1'b0;
    address = 7;
    #1 $display("|10+|%d|%b|%d|%d|", in, load, address, out);

    in = 7777;
    load = 1'b0;
    address = 7;
    #1 $display("|11|%d|%b|%d|%d|", in, load, address, out);

    in = 7777;
    load = 1'b0;
    address = 3;
    #0 $display("|11|%d|%b|%d|%d|", in, load, address, out);

    in = 7777;
    load = 1'b0;
    address = 7;
    #0 $display("|11|%d|%b|%d|%d|", in, load, address, out);

    in = 7777;
    load = 1'b0;
    address = 0;
    #1 $display("|11+|%d|%b|%d|%d|", in, load, address, out);

    in = 7777;
    load = 1'b0;
    address = 0;
    #1 $display("|12|%d|%b|%d|%d|", in, load, address, out);

    in = 7777;
    load = 1'b0;
    address = 1;
    #0 $display("|12|%d|%b|%d|%d|", in, load, address, out);

    in = 7777;
    load = 1'b0;
    address = 2;
    #0 $display("|12|%d|%b|%d|%d|", in, load, address, out);

    in = 7777;
    load = 1'b0;
    address = 3;
    #0 $display("|12|%d|%b|%d|%d|", in, load, address, out);

    in = 7777;
    load = 1'b0;
    address = 4;
    #0 $display("|12|%d|%b|%d|%d|", in, load, address, out);

    in = 7777;
    load = 1'b0;
    address = 5;
    #0 $display("|12|%d|%b|%d|%d|", in, load, address, out);

    in = 7777;
    load = 1'b0;
    address = 6;
    #0 $display("|12|%d|%b|%d|%d|", in, load, address, out);

    in = 7777;
    load = 1'b0;
    address = 7;
    #0 $display("|12|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 0;
    #1 $display("|12+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 0;
    #1 $display("|13|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 1;
    #1 $display("|13+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 1;
    #1 $display("|14|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 2;
    #1 $display("|14+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 2;
    #1 $display("|15|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 3;
    #1 $display("|15+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 3;
    #1 $display("|16|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 4;
    #1 $display("|16+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 4;
    #1 $display("|17|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 5;
    #1 $display("|17+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 5;
    #1 $display("|18|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 6;
    #1 $display("|18+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 6;
    #1 $display("|19|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 7;
    #1 $display("|19+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 7;
    #1 $display("|20|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 0;
    #1 $display("|20+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 0;
    #1 $display("|21|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 1;
    #0 $display("|21|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 2;
    #0 $display("|21|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 3;
    #0 $display("|21|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 4;
    #0 $display("|21|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 5;
    #0 $display("|21|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 6;
    #0 $display("|21|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 7;
    #0 $display("|21|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b1;
    address = 0;
    #1 $display("|21+|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b1;
    address = 0;
    #1 $display("|22|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 0;
    #1 $display("|22+|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 0;
    #1 $display("|23|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 1;
    #0 $display("|23|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 2;
    #0 $display("|23|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 3;
    #0 $display("|23|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 4;
    #0 $display("|23|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 5;
    #0 $display("|23|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 6;
    #0 $display("|23|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 7;
    #0 $display("|23|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 0;
    #1 $display("|23+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 0;
    #1 $display("|24|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b1;
    address = 1;
    #1 $display("|24+|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b1;
    address = 1;
    #1 $display("|25|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 0;
    #1 $display("|25+|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 0;
    #1 $display("|26|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 1;
    #0 $display("|26|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 2;
    #0 $display("|26|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 3;
    #0 $display("|26|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 4;
    #0 $display("|26|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 5;
    #0 $display("|26|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 6;
    #0 $display("|26|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 7;
    #0 $display("|26|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 1;
    #1 $display("|26+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 1;
    #1 $display("|27|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b1;
    address = 2;
    #1 $display("|27+|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b1;
    address = 2;
    #1 $display("|28|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 0;
    #1 $display("|28+|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 0;
    #1 $display("|29|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 1;
    #0 $display("|29|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 2;
    #0 $display("|29|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 3;
    #0 $display("|29|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 4;
    #0 $display("|29|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 5;
    #0 $display("|29|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 6;
    #0 $display("|29|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 7;
    #0 $display("|29|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 2;
    #1 $display("|29+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 2;
    #1 $display("|30|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b1;
    address = 3;
    #1 $display("|30+|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b1;
    address = 3;
    #1 $display("|31|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 0;
    #1 $display("|31+|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 0;
    #1 $display("|32|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 1;
    #0 $display("|32|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 2;
    #0 $display("|32|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 3;
    #0 $display("|32|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 4;
    #0 $display("|32|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 5;
    #0 $display("|32|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 6;
    #0 $display("|32|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 7;
    #0 $display("|32|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 3;
    #1 $display("|32+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 3;
    #1 $display("|33|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b1;
    address = 4;
    #1 $display("|33+|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b1;
    address = 4;
    #1 $display("|34|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 0;
    #1 $display("|34+|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 0;
    #1 $display("|35|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 1;
    #0 $display("|35|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 2;
    #0 $display("|35|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 3;
    #0 $display("|35|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 4;
    #0 $display("|35|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 5;
    #0 $display("|35|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 6;
    #0 $display("|35|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 7;
    #0 $display("|35|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 4;
    #1 $display("|35+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 4;
    #1 $display("|36|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b1;
    address = 5;
    #1 $display("|36+|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b1;
    address = 5;
    #1 $display("|37|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 0;
    #1 $display("|37+|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 0;
    #1 $display("|38|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 1;
    #0 $display("|38|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 2;
    #0 $display("|38|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 3;
    #0 $display("|38|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 4;
    #0 $display("|38|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 5;
    #0 $display("|38|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 6;
    #0 $display("|38|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 7;
    #0 $display("|38|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 5;
    #1 $display("|38+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 5;
    #1 $display("|39|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b1;
    address = 6;
    #1 $display("|39+|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b1;
    address = 6;
    #1 $display("|40|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 0;
    #1 $display("|40+|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 0;
    #1 $display("|41|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 1;
    #0 $display("|41|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 2;
    #0 $display("|41|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 3;
    #0 $display("|41|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 4;
    #0 $display("|41|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 5;
    #0 $display("|41|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 6;
    #0 $display("|41|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 7;
    #0 $display("|41|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 6;
    #1 $display("|41+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 6;
    #1 $display("|42|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b1;
    address = 7;
    #1 $display("|42+|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b1;
    address = 7;
    #1 $display("|43|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 0;
    #1 $display("|43+|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 0;
    #1 $display("|44|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 1;
    #0 $display("|44|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 2;
    #0 $display("|44|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 3;
    #0 $display("|44|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 4;
    #0 $display("|44|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 5;
    #0 $display("|44|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 6;
    #0 $display("|44|%d|%b|%d|%d|", in, load, address, out);

    in = -21846;
    load = 1'b0;
    address = 7;
    #0 $display("|44|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 7;
    #1 $display("|44+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b1;
    address = 7;
    #1 $display("|45|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 0;
    #1 $display("|45+|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 0;
    #1 $display("|46|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 1;
    #0 $display("|46|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 2;
    #0 $display("|46|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 3;
    #0 $display("|46|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 4;
    #0 $display("|46|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 5;
    #0 $display("|46|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 6;
    #0 $display("|46|%d|%b|%d|%d|", in, load, address, out);

    in = 21845;
    load = 1'b0;
    address = 7;
    #0 $display("|46|%d|%b|%d|%d|", in, load, address, out);

    $finish;
  end
endmodule
