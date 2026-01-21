module register_test;
  reg signed [15:0] in;
  reg load;
  wire signed [15:0] out;

  student_register dut (.in(in), .load(load), .out(out));

  initial begin
    $display("|time|in|load|out|");

    in = 0;
    load = 1'b0;
    #1 $display("|0+|%d|%b|%d|", in, load, out);

    in = 0;
    load = 1'b0;
    #1 $display("|1|%d|%b|%d|", in, load, out);

    in = 0;
    load = 1'b1;
    #1 $display("|1+|%d|%b|%d|", in, load, out);

    in = 0;
    load = 1'b1;
    #1 $display("|2|%d|%b|%d|", in, load, out);

    in = -32123;
    load = 1'b0;
    #1 $display("|2+|%d|%b|%d|", in, load, out);

    in = -32123;
    load = 1'b0;
    #1 $display("|3|%d|%b|%d|", in, load, out);

    in = 11111;
    load = 1'b0;
    #1 $display("|3+|%d|%b|%d|", in, load, out);

    in = 11111;
    load = 1'b0;
    #1 $display("|4|%d|%b|%d|", in, load, out);

    in = -32123;
    load = 1'b1;
    #1 $display("|4+|%d|%b|%d|", in, load, out);

    in = -32123;
    load = 1'b1;
    #1 $display("|5|%d|%b|%d|", in, load, out);

    in = -32123;
    load = 1'b1;
    #1 $display("|5+|%d|%b|%d|", in, load, out);

    in = -32123;
    load = 1'b1;
    #1 $display("|6|%d|%b|%d|", in, load, out);

    in = -32123;
    load = 1'b0;
    #1 $display("|6+|%d|%b|%d|", in, load, out);

    in = -32123;
    load = 1'b0;
    #1 $display("|7|%d|%b|%d|", in, load, out);

    in = 12345;
    load = 1'b1;
    #1 $display("|7+|%d|%b|%d|", in, load, out);

    in = 12345;
    load = 1'b1;
    #1 $display("|8|%d|%b|%d|", in, load, out);

    in = 0;
    load = 1'b0;
    #1 $display("|8+|%d|%b|%d|", in, load, out);

    in = 0;
    load = 1'b0;
    #1 $display("|9|%d|%b|%d|", in, load, out);

    in = 0;
    load = 1'b1;
    #1 $display("|9+|%d|%b|%d|", in, load, out);

    in = 0;
    load = 1'b1;
    #1 $display("|10|%d|%b|%d|", in, load, out);

    in = 1;
    load = 1'b0;
    #1 $display("|10+|%d|%b|%d|", in, load, out);

    in = 1;
    load = 1'b0;
    #1 $display("|11|%d|%b|%d|", in, load, out);

    in = 1;
    load = 1'b1;
    #1 $display("|11+|%d|%b|%d|", in, load, out);

    in = 1;
    load = 1'b1;
    #1 $display("|12|%d|%b|%d|", in, load, out);

    in = 2;
    load = 1'b0;
    #1 $display("|12+|%d|%b|%d|", in, load, out);

    in = 2;
    load = 1'b0;
    #1 $display("|13|%d|%b|%d|", in, load, out);

    in = 2;
    load = 1'b1;
    #1 $display("|13+|%d|%b|%d|", in, load, out);

    in = 2;
    load = 1'b1;
    #1 $display("|14|%d|%b|%d|", in, load, out);

    in = 4;
    load = 1'b0;
    #1 $display("|14+|%d|%b|%d|", in, load, out);

    in = 4;
    load = 1'b0;
    #1 $display("|15|%d|%b|%d|", in, load, out);

    in = 4;
    load = 1'b1;
    #1 $display("|15+|%d|%b|%d|", in, load, out);

    in = 4;
    load = 1'b1;
    #1 $display("|16|%d|%b|%d|", in, load, out);

    in = 8;
    load = 1'b0;
    #1 $display("|16+|%d|%b|%d|", in, load, out);

    in = 8;
    load = 1'b0;
    #1 $display("|17|%d|%b|%d|", in, load, out);

    in = 8;
    load = 1'b1;
    #1 $display("|17+|%d|%b|%d|", in, load, out);

    in = 8;
    load = 1'b1;
    #1 $display("|18|%d|%b|%d|", in, load, out);

    in = 16;
    load = 1'b0;
    #1 $display("|18+|%d|%b|%d|", in, load, out);

    in = 16;
    load = 1'b0;
    #1 $display("|19|%d|%b|%d|", in, load, out);

    in = 16;
    load = 1'b1;
    #1 $display("|19+|%d|%b|%d|", in, load, out);

    in = 16;
    load = 1'b1;
    #1 $display("|20|%d|%b|%d|", in, load, out);

    in = 32;
    load = 1'b0;
    #1 $display("|20+|%d|%b|%d|", in, load, out);

    in = 32;
    load = 1'b0;
    #1 $display("|21|%d|%b|%d|", in, load, out);

    in = 32;
    load = 1'b1;
    #1 $display("|21+|%d|%b|%d|", in, load, out);

    in = 32;
    load = 1'b1;
    #1 $display("|22|%d|%b|%d|", in, load, out);

    in = 64;
    load = 1'b0;
    #1 $display("|22+|%d|%b|%d|", in, load, out);

    in = 64;
    load = 1'b0;
    #1 $display("|23|%d|%b|%d|", in, load, out);

    in = 64;
    load = 1'b1;
    #1 $display("|23+|%d|%b|%d|", in, load, out);

    in = 64;
    load = 1'b1;
    #1 $display("|24|%d|%b|%d|", in, load, out);

    in = 128;
    load = 1'b0;
    #1 $display("|24+|%d|%b|%d|", in, load, out);

    in = 128;
    load = 1'b0;
    #1 $display("|25|%d|%b|%d|", in, load, out);

    in = 128;
    load = 1'b1;
    #1 $display("|25+|%d|%b|%d|", in, load, out);

    in = 128;
    load = 1'b1;
    #1 $display("|26|%d|%b|%d|", in, load, out);

    in = 256;
    load = 1'b0;
    #1 $display("|26+|%d|%b|%d|", in, load, out);

    in = 256;
    load = 1'b0;
    #1 $display("|27|%d|%b|%d|", in, load, out);

    in = 256;
    load = 1'b1;
    #1 $display("|27+|%d|%b|%d|", in, load, out);

    in = 256;
    load = 1'b1;
    #1 $display("|28|%d|%b|%d|", in, load, out);

    in = 512;
    load = 1'b0;
    #1 $display("|28+|%d|%b|%d|", in, load, out);

    in = 512;
    load = 1'b0;
    #1 $display("|29|%d|%b|%d|", in, load, out);

    in = 512;
    load = 1'b1;
    #1 $display("|29+|%d|%b|%d|", in, load, out);

    in = 512;
    load = 1'b1;
    #1 $display("|30|%d|%b|%d|", in, load, out);

    in = 1024;
    load = 1'b0;
    #1 $display("|30+|%d|%b|%d|", in, load, out);

    in = 1024;
    load = 1'b0;
    #1 $display("|31|%d|%b|%d|", in, load, out);

    in = 1024;
    load = 1'b1;
    #1 $display("|31+|%d|%b|%d|", in, load, out);

    in = 1024;
    load = 1'b1;
    #1 $display("|32|%d|%b|%d|", in, load, out);

    in = 2048;
    load = 1'b0;
    #1 $display("|32+|%d|%b|%d|", in, load, out);

    in = 2048;
    load = 1'b0;
    #1 $display("|33|%d|%b|%d|", in, load, out);

    in = 2048;
    load = 1'b1;
    #1 $display("|33+|%d|%b|%d|", in, load, out);

    in = 2048;
    load = 1'b1;
    #1 $display("|34|%d|%b|%d|", in, load, out);

    in = 4096;
    load = 1'b0;
    #1 $display("|34+|%d|%b|%d|", in, load, out);

    in = 4096;
    load = 1'b0;
    #1 $display("|35|%d|%b|%d|", in, load, out);

    in = 4096;
    load = 1'b1;
    #1 $display("|35+|%d|%b|%d|", in, load, out);

    in = 4096;
    load = 1'b1;
    #1 $display("|36|%d|%b|%d|", in, load, out);

    in = 8192;
    load = 1'b0;
    #1 $display("|36+|%d|%b|%d|", in, load, out);

    in = 8192;
    load = 1'b0;
    #1 $display("|37|%d|%b|%d|", in, load, out);

    in = 8192;
    load = 1'b1;
    #1 $display("|37+|%d|%b|%d|", in, load, out);

    in = 8192;
    load = 1'b1;
    #1 $display("|38|%d|%b|%d|", in, load, out);

    in = 16384;
    load = 1'b0;
    #1 $display("|38+|%d|%b|%d|", in, load, out);

    in = 16384;
    load = 1'b0;
    #1 $display("|39|%d|%b|%d|", in, load, out);

    in = 16384;
    load = 1'b1;
    #1 $display("|39+|%d|%b|%d|", in, load, out);

    in = 16384;
    load = 1'b1;
    #1 $display("|40|%d|%b|%d|", in, load, out);

    in = -32768;
    load = 1'b0;
    #1 $display("|40+|%d|%b|%d|", in, load, out);

    in = -32768;
    load = 1'b0;
    #1 $display("|41|%d|%b|%d|", in, load, out);

    in = -32768;
    load = 1'b1;
    #1 $display("|41+|%d|%b|%d|", in, load, out);

    in = -32768;
    load = 1'b1;
    #1 $display("|42|%d|%b|%d|", in, load, out);

    in = -2;
    load = 1'b0;
    #1 $display("|42+|%d|%b|%d|", in, load, out);

    in = -2;
    load = 1'b0;
    #1 $display("|43|%d|%b|%d|", in, load, out);

    in = -2;
    load = 1'b1;
    #1 $display("|43+|%d|%b|%d|", in, load, out);

    in = -2;
    load = 1'b1;
    #1 $display("|44|%d|%b|%d|", in, load, out);

    in = -3;
    load = 1'b0;
    #1 $display("|44+|%d|%b|%d|", in, load, out);

    in = -3;
    load = 1'b0;
    #1 $display("|45|%d|%b|%d|", in, load, out);

    in = -3;
    load = 1'b1;
    #1 $display("|45+|%d|%b|%d|", in, load, out);

    in = -3;
    load = 1'b1;
    #1 $display("|46|%d|%b|%d|", in, load, out);

    in = -5;
    load = 1'b0;
    #1 $display("|46+|%d|%b|%d|", in, load, out);

    in = -5;
    load = 1'b0;
    #1 $display("|47|%d|%b|%d|", in, load, out);

    in = -5;
    load = 1'b1;
    #1 $display("|47+|%d|%b|%d|", in, load, out);

    in = -5;
    load = 1'b1;
    #1 $display("|48|%d|%b|%d|", in, load, out);

    in = -9;
    load = 1'b0;
    #1 $display("|48+|%d|%b|%d|", in, load, out);

    in = -9;
    load = 1'b0;
    #1 $display("|49|%d|%b|%d|", in, load, out);

    in = -9;
    load = 1'b1;
    #1 $display("|49+|%d|%b|%d|", in, load, out);

    in = -9;
    load = 1'b1;
    #1 $display("|50|%d|%b|%d|", in, load, out);

    in = -17;
    load = 1'b0;
    #1 $display("|50+|%d|%b|%d|", in, load, out);

    in = -17;
    load = 1'b0;
    #1 $display("|51|%d|%b|%d|", in, load, out);

    in = -17;
    load = 1'b1;
    #1 $display("|51+|%d|%b|%d|", in, load, out);

    in = -17;
    load = 1'b1;
    #1 $display("|52|%d|%b|%d|", in, load, out);

    in = -33;
    load = 1'b0;
    #1 $display("|52+|%d|%b|%d|", in, load, out);

    in = -33;
    load = 1'b0;
    #1 $display("|53|%d|%b|%d|", in, load, out);

    in = -33;
    load = 1'b1;
    #1 $display("|53+|%d|%b|%d|", in, load, out);

    in = -33;
    load = 1'b1;
    #1 $display("|54|%d|%b|%d|", in, load, out);

    in = -65;
    load = 1'b0;
    #1 $display("|54+|%d|%b|%d|", in, load, out);

    in = -65;
    load = 1'b0;
    #1 $display("|55|%d|%b|%d|", in, load, out);

    in = -65;
    load = 1'b1;
    #1 $display("|55+|%d|%b|%d|", in, load, out);

    in = -65;
    load = 1'b1;
    #1 $display("|56|%d|%b|%d|", in, load, out);

    in = -129;
    load = 1'b0;
    #1 $display("|56+|%d|%b|%d|", in, load, out);

    in = -129;
    load = 1'b0;
    #1 $display("|57|%d|%b|%d|", in, load, out);

    in = -129;
    load = 1'b1;
    #1 $display("|57+|%d|%b|%d|", in, load, out);

    in = -129;
    load = 1'b1;
    #1 $display("|58|%d|%b|%d|", in, load, out);

    in = -257;
    load = 1'b0;
    #1 $display("|58+|%d|%b|%d|", in, load, out);

    in = -257;
    load = 1'b0;
    #1 $display("|59|%d|%b|%d|", in, load, out);

    in = -257;
    load = 1'b1;
    #1 $display("|59+|%d|%b|%d|", in, load, out);

    in = -257;
    load = 1'b1;
    #1 $display("|60|%d|%b|%d|", in, load, out);

    in = -513;
    load = 1'b0;
    #1 $display("|60+|%d|%b|%d|", in, load, out);

    in = -513;
    load = 1'b0;
    #1 $display("|61|%d|%b|%d|", in, load, out);

    in = -513;
    load = 1'b1;
    #1 $display("|61+|%d|%b|%d|", in, load, out);

    in = -513;
    load = 1'b1;
    #1 $display("|62|%d|%b|%d|", in, load, out);

    in = -1025;
    load = 1'b0;
    #1 $display("|62+|%d|%b|%d|", in, load, out);

    in = -1025;
    load = 1'b0;
    #1 $display("|63|%d|%b|%d|", in, load, out);

    in = -1025;
    load = 1'b1;
    #1 $display("|63+|%d|%b|%d|", in, load, out);

    in = -1025;
    load = 1'b1;
    #1 $display("|64|%d|%b|%d|", in, load, out);

    in = -2049;
    load = 1'b0;
    #1 $display("|64+|%d|%b|%d|", in, load, out);

    in = -2049;
    load = 1'b0;
    #1 $display("|65|%d|%b|%d|", in, load, out);

    in = -2049;
    load = 1'b1;
    #1 $display("|65+|%d|%b|%d|", in, load, out);

    in = -2049;
    load = 1'b1;
    #1 $display("|66|%d|%b|%d|", in, load, out);

    in = -4097;
    load = 1'b0;
    #1 $display("|66+|%d|%b|%d|", in, load, out);

    in = -4097;
    load = 1'b0;
    #1 $display("|67|%d|%b|%d|", in, load, out);

    in = -4097;
    load = 1'b1;
    #1 $display("|67+|%d|%b|%d|", in, load, out);

    in = -4097;
    load = 1'b1;
    #1 $display("|68|%d|%b|%d|", in, load, out);

    in = -8193;
    load = 1'b0;
    #1 $display("|68+|%d|%b|%d|", in, load, out);

    in = -8193;
    load = 1'b0;
    #1 $display("|69|%d|%b|%d|", in, load, out);

    in = -8193;
    load = 1'b1;
    #1 $display("|69+|%d|%b|%d|", in, load, out);

    in = -8193;
    load = 1'b1;
    #1 $display("|70|%d|%b|%d|", in, load, out);

    in = -16385;
    load = 1'b0;
    #1 $display("|70+|%d|%b|%d|", in, load, out);

    in = -16385;
    load = 1'b0;
    #1 $display("|71|%d|%b|%d|", in, load, out);

    in = -16385;
    load = 1'b1;
    #1 $display("|71+|%d|%b|%d|", in, load, out);

    in = -16385;
    load = 1'b1;
    #1 $display("|72|%d|%b|%d|", in, load, out);

    in = 32767;
    load = 1'b0;
    #1 $display("|72+|%d|%b|%d|", in, load, out);

    in = 32767;
    load = 1'b0;
    #1 $display("|73|%d|%b|%d|", in, load, out);

    in = 32767;
    load = 1'b1;
    #1 $display("|73+|%d|%b|%d|", in, load, out);

    in = 32767;
    load = 1'b1;
    #1 $display("|74|%d|%b|%d|", in, load, out);

    $finish;
  end
endmodule
