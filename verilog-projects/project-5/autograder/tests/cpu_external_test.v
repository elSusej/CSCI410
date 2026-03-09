module cpu_external_test;
  reg signed [15:0] inM;
  reg [15:0] instruction;
  reg reset;
  wire signed [15:0] outM;
  wire writeM;
  wire [14:0] address, pc;

  student_cpu dut (.inM(inM), .instruction(instruction), .reset(reset), .outM(outM), .writeM(writeM), .address(address), .pc(pc));

  initial begin
    $display("|time|inM|instruction|reset|outM|writeM|address|pc|");

    inM = 0;
    instruction = 16'b0011000000111001;
    reset = 1'b0;
    #1 $display("|0+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 0;
    instruction = 16'b0011000000111001;
    reset = 1'b0;
    #1 $display("|1|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 0;
    instruction = 16'b1110110000010000;
    reset = 1'b0;
    #1 $display("|1+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 0;
    instruction = 16'b1110110000010000;
    reset = 1'b0;
    #1 $display("|2|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 0;
    instruction = 16'b0101101110100000;
    reset = 1'b0;
    #1 $display("|2+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 0;
    instruction = 16'b0101101110100000;
    reset = 1'b0;
    #1 $display("|3|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 0;
    instruction = 16'b1110000111110000;
    reset = 1'b0;
    #1 $display("|3+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 0;
    instruction = 16'b1110000111110000;
    reset = 1'b0;
    #1 $display("|4|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 0;
    instruction = 16'b0000001111101011;
    reset = 1'b0;
    #1 $display("|4+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 0;
    instruction = 16'b0000001111101011;
    reset = 1'b0;
    #1 $display("|5|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 0;
    instruction = 16'b1110001100001000;
    reset = 1'b0;
    #1 $display("|5+|%d|%b|%b|%d|%b|%d|%d|", inM, instruction, reset, outM, writeM, address, pc);

    inM = 0;
    instruction = 16'b1110001100001000;
    reset = 1'b0;
    #1 $display("|6|%d|%b|%b|%d|%b|%d|%d|", inM, instruction, reset, outM, writeM, address, pc);

    inM = 0;
    instruction = 16'b0000001111101100;
    reset = 1'b0;
    #1 $display("|6+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 0;
    instruction = 16'b0000001111101100;
    reset = 1'b0;
    #1 $display("|7|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 0;
    instruction = 16'b1110001110011000;
    reset = 1'b0;
    #1 $display("|7+|%d|%b|%b|%d|%b|%d|%d|", inM, instruction, reset, outM, writeM, address, pc);

    inM = 0;
    instruction = 16'b1110001110011000;
    reset = 1'b0;
    #1 $display("|8|%d|%b|%b|%d|%b|%d|%d|", inM, instruction, reset, outM, writeM, address, pc);

    inM = 0;
    instruction = 16'b0000001111101000;
    reset = 1'b0;
    #1 $display("|8+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 0;
    instruction = 16'b0000001111101000;
    reset = 1'b0;
    #1 $display("|9|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1111010011110000;
    reset = 1'b0;
    #1 $display("|9+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1111010011110000;
    reset = 1'b0;
    #1 $display("|10|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b0000000000001110;
    reset = 1'b0;
    #1 $display("|10+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b0000000000001110;
    reset = 1'b0;
    #1 $display("|11|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000100;
    reset = 1'b0;
    #1 $display("|11+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000100;
    reset = 1'b0;
    #1 $display("|12|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b0000001111100111;
    reset = 1'b0;
    #1 $display("|12+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b0000001111100111;
    reset = 1'b0;
    #1 $display("|13|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1111110111100000;
    reset = 1'b0;
    #1 $display("|13+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1111110111100000;
    reset = 1'b0;
    #1 $display("|14|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100101000;
    reset = 1'b0;
    #1 $display("|14+|%d|%b|%b|%d|%b|%d|%d|", inM, instruction, reset, outM, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100101000;
    reset = 1'b0;
    #1 $display("|15|%d|%b|%b|%d|%b|%d|%d|", inM, instruction, reset, outM, writeM, address, pc);

    inM = 11111;
    instruction = 16'b0000000000010101;
    reset = 1'b0;
    #1 $display("|15+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b0000000000010101;
    reset = 1'b0;
    #1 $display("|16|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110011111000010;
    reset = 1'b0;
    #1 $display("|16+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110011111000010;
    reset = 1'b0;
    #1 $display("|17|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b0000000000000010;
    reset = 1'b0;
    #1 $display("|17+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b0000000000000010;
    reset = 1'b0;
    #1 $display("|18|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110000010111000;
    reset = 1'b0;
    #1 $display("|18+|%d|%b|%b|%d|%b|%d|%d|", inM, instruction, reset, outM, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110000010111000;
    reset = 1'b0;
    #1 $display("|19|%d|%b|%b|%d|%b|%d|%d|", inM, instruction, reset, outM, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1111110111001000;
    reset = 1'b0;
    #1 $display("|19+|%d|%b|%b|%d|%b|%d|%d|", inM, instruction, reset, outM, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1111110111001000;
    reset = 1'b0;
    #1 $display("|20|%d|%b|%b|%d|%b|%d|%d|", inM, instruction, reset, outM, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1111110010101000;
    reset = 1'b0;
    #1 $display("|20+|%d|%b|%b|%d|%b|%d|%d|", inM, instruction, reset, outM, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1111110010101000;
    reset = 1'b0;
    #1 $display("|21|%d|%b|%b|%d|%b|%d|%d|", inM, instruction, reset, outM, writeM, address, pc);

    inM = 11111;
    instruction = 16'b0000001111101000;
    reset = 1'b0;
    #1 $display("|21+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b0000001111101000;
    reset = 1'b0;
    #1 $display("|22|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110111010010000;
    reset = 1'b0;
    #1 $display("|22+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110111010010000;
    reset = 1'b0;
    #1 $display("|23|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000001;
    reset = 1'b0;
    #1 $display("|23+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000001;
    reset = 1'b0;
    #1 $display("|24|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000010;
    reset = 1'b0;
    #1 $display("|24+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000010;
    reset = 1'b0;
    #1 $display("|25|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000011;
    reset = 1'b0;
    #1 $display("|25+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000011;
    reset = 1'b0;
    #1 $display("|26|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000100;
    reset = 1'b0;
    #1 $display("|26+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000100;
    reset = 1'b0;
    #1 $display("|27|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000101;
    reset = 1'b0;
    #1 $display("|27+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000101;
    reset = 1'b0;
    #1 $display("|28|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000110;
    reset = 1'b0;
    #1 $display("|28+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000110;
    reset = 1'b0;
    #1 $display("|29|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000111;
    reset = 1'b0;
    #1 $display("|29+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000111;
    reset = 1'b0;
    #1 $display("|30|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110101010010000;
    reset = 1'b0;
    #1 $display("|30+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110101010010000;
    reset = 1'b0;
    #1 $display("|31|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000001;
    reset = 1'b0;
    #1 $display("|31+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000001;
    reset = 1'b0;
    #1 $display("|32|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000010;
    reset = 1'b0;
    #1 $display("|32+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000010;
    reset = 1'b0;
    #1 $display("|33|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000011;
    reset = 1'b0;
    #1 $display("|33+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000011;
    reset = 1'b0;
    #1 $display("|34|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000100;
    reset = 1'b0;
    #1 $display("|34+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000100;
    reset = 1'b0;
    #1 $display("|35|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000101;
    reset = 1'b0;
    #1 $display("|35+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000101;
    reset = 1'b0;
    #1 $display("|36|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000110;
    reset = 1'b0;
    #1 $display("|36+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000110;
    reset = 1'b0;
    #1 $display("|37|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000111;
    reset = 1'b0;
    #1 $display("|37+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000111;
    reset = 1'b0;
    #1 $display("|38|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110111111010000;
    reset = 1'b0;
    #1 $display("|38+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110111111010000;
    reset = 1'b0;
    #1 $display("|39|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000001;
    reset = 1'b0;
    #1 $display("|39+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000001;
    reset = 1'b0;
    #1 $display("|40|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000010;
    reset = 1'b0;
    #1 $display("|40+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000010;
    reset = 1'b0;
    #1 $display("|41|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000011;
    reset = 1'b0;
    #1 $display("|41+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000011;
    reset = 1'b0;
    #1 $display("|42|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000100;
    reset = 1'b0;
    #1 $display("|42+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000100;
    reset = 1'b0;
    #1 $display("|43|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000101;
    reset = 1'b0;
    #1 $display("|43+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000101;
    reset = 1'b0;
    #1 $display("|44|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000110;
    reset = 1'b0;
    #1 $display("|44+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000110;
    reset = 1'b0;
    #1 $display("|45|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000111;
    reset = 1'b0;
    #1 $display("|45+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000111;
    reset = 1'b0;
    #1 $display("|46|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000111;
    reset = 1'b1;
    #1 $display("|46+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b1110001100000111;
    reset = 1'b1;
    #1 $display("|47|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b0111111111111111;
    reset = 1'b0;
    #1 $display("|47+|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    inM = 11111;
    instruction = 16'b0111111111111111;
    reset = 1'b0;
    #1 $display("|48|%d|%b|%b|*******|%b|%d|%d|", inM, instruction, reset, writeM, address, pc);

    $finish;
  end
endmodule
