module memory_test;
  reg signed [15:0] in;
  reg load;
  reg [14:0] address;
  wire signed [15:0] out;
  wire [(16*(2**15))-1:0] mem_contents;

  reg [(16*(2**15))-1:0] memory = 524288'b0;
  computer_memory #(15) dut (.data(memory), .reload(1'b0), .in(in), .load(load), .address(address), .out(out), .mem_contents(mem_contents));

  initial begin
    $display("|in|load|address|out|");

    in = 12345;
    load = 1'b1;
    address = 15'b010000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 12345;
    load = 1'b1;
    address = 15'b010000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 12345;
    load = 1'b1;
    address = 15'b100000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 12345;
    load = 1'b1;
    address = 15'b100000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b1;
    address = 15'b000000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b1;
    address = 15'b000000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b000000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b000000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b010000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b100000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 12345;
    load = 1'b1;
    address = 15'b000000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 12345;
    load = 1'b1;
    address = 15'b000000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 12345;
    load = 1'b1;
    address = 15'b100000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 12345;
    load = 1'b1;
    address = 15'b100000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 2222;
    load = 1'b1;
    address = 15'b010000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 2222;
    load = 1'b1;
    address = 15'b010000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b010000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b010000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b000000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b100000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b000000000000001;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b000000000000010;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b000000000000100;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b000000000001000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b000000000010000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b000000000100000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b000000001000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b000000010000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b000000100000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b000001000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b000010000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b000100000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b001000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 9999;
    load = 1'b0;
    address = 15'b010000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 1234;
    load = 1'b1;
    address = 15'b001001000110100;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 1234;
    load = 1'b1;
    address = 15'b001001000110100;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 1234;
    load = 1'b0;
    address = 15'b010001000110100;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 1234;
    load = 1'b0;
    address = 15'b110001000110100;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 2345;
    load = 1'b1;
    address = 15'b010001101000101;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 2345;
    load = 1'b1;
    address = 15'b010001101000101;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 2345;
    load = 1'b0;
    address = 15'b000001101000101;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 2345;
    load = 1'b0;
    address = 15'b100001101000101;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 0;
    load = 1'b1;
    address = 15'b100000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 0;
    load = 1'b1;
    address = 15'b100000000000000;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 12345;
    load = 1'b1;
    address = 15'b000111111001111;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 12345;
    load = 1'b1;
    address = 15'b000111111001111;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 12345;
    load = 1'b1;
    address = 15'b010111111001111;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = 12345;
    load = 1'b1;
    address = 15'b010111111001111;
    #2 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b1;
    address = 15'b100111111001111;
    #2 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b1;
    address = 15'b101000001001111;
    #2 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b1;
    address = 15'b000111111001111;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b1;
    address = 15'b010111111001111;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b0;
    address = 15'b100111111001110;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b0;
    address = 15'b100111111001101;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b0;
    address = 15'b100111111001011;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b0;
    address = 15'b100111111000111;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b0;
    address = 15'b100111111011111;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b0;
    address = 15'b100111111101111;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b0;
    address = 15'b100111110001111;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b0;
    address = 15'b100111101001111;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b0;
    address = 15'b100111011001111;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b0;
    address = 15'b100110111001111;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b0;
    address = 15'b100101111001111;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b0;
    address = 15'b100011111001111;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    in = -1;
    load = 1'b0;
    address = 15'b101111111001111;
    #1 $display("|%d|%b|%b|%d|", in, load, address, out);

    $finish;
  end
endmodule
