module computer_rect_test;
  wire signed [15:0] ARegister, DRegister;
  wire [14:0] pc;
  wire [((2**15)*16)-1:0] mem_contents;

  reg [16-1:0] filedata [32768-1:0];

  integer i;
  initial begin
    // read into unpacked array as is required
    $readmemb("rect.hack", filedata, 0, 24);
    for (i = 25; i < 32768; i+=1) filedata[i] = 16'b0;

    // pack data into vector
    for (i = 0; i < 32768; i+=1) data[16*i +: 16] = filedata[i];
  end

  reg [(16*32768)-1:0] data;
  reg [((2**15)*16)-1:0] memory = 524288'b0;
  computer dut (.program(data), .memory(memory), .reset(1'b0), .ARegister(ARegister), .DRegister(DRegister), .pc(pc), .mem_contents(mem_contents));

  initial begin
    $display("|time|ARegister|DRegister|PC[]|RAM16K[0]|RAM16K[1]|RAM16K[2]|");

    memory[0 +: 16] = 4;
    #1 $display("|0|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #1 $display("|1|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|2|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|3|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|4|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|5|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|6|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|7|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|8|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|9|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|10|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|11|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|12|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|13|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|14|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|15|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|16|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|17|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|18|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|19|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|20|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|21|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|22|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|23|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|24|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|25|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|26|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|27|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|28|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|29|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|30|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|31|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|32|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|33|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|34|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|35|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|36|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|37|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|38|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|39|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|40|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|41|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|42|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|43|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|44|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|45|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|46|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|47|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|48|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|49|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|50|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|51|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|52|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|53|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|54|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|55|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|56|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|57|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|58|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|59|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|60|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|61|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|62|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    #2 $display("|63|%d|%d|%d|%d|%d|%d|", ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    $finish;
  end
endmodule
