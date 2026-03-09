module computer_max_test;
  reg reset;
  wire signed [15:0] ARegister, DRegister;
  wire [14:0] pc;
  wire [((2**15)*16)-1:0] mem_contents;

  reg [16-1:0] filedata [32768-1:0];

  integer i;
  initial begin
    // read into unpacked array as is required
    $readmemb("max.hack", filedata, 0, 15);
    for (i = 16; i < 32768; i+=1) filedata[i] = 16'b0;

    // pack data into vector
    for (i = 0; i < 32768; i+=1) begin
      data[16*i +: 16] = filedata[i];
    end
  end

  reg [(16*32768)-1:0] data;
  reg reload;
  reg [((2**15)*16)-1:0] memory = 524288'b0;
  computer dut (.program(data), .memory(memory), .reload(reload), .reset(reset), .ARegister(ARegister), .DRegister(DRegister), .pc(pc), .mem_contents(mem_contents));

  initial begin
    $display("|time|reset|ARegister|DRegister|PC[]|RAM16K[0]|RAM16K[1]|RAM16K[2]|");

    memory[16*0 +: 16] = 3;
    memory[16*1 +: 16] = 5;
    reset = 1'b0;
    #1 $display("|0|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #1 $display("|1|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|2|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|3|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|4|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|5|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|6|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|7|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|8|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|9|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|10|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|11|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|12|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|13|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|14|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b1;
    #2 $display("|15|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    memory = mem_contents;
    memory[16*0 +: 16] = 23456;
    memory[16*1 +: 16] = 12345;
    reload = 1'b1;
    reset = 1'b0;
    #0 $display("|15|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reload = 1'b0;
    reset = 1'b0;
    #2 $display("|16|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|17|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|18|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|19|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|20|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|21|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|22|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|23|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|24|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reset = 1'b0;
    #2 $display("|25|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    $finish;
  end
endmodule
