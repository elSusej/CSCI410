module computer_add_test;
  reg reset;
  wire signed [15:0] ARegister, DRegister;
  wire [14:0] pc;
  wire [((2**15)*16)-1:0] mem_contents;

  reg [16-1:0] filedata [32768-1:0];

  integer i;
  initial begin
    // read into unpacked array as is required
    $readmemb("add.hack", filedata, 0, 5);
    for (i = 6; i < 32768; i+=1) filedata[i] = 16'b0;

    // pack data into vector
    for (i = 0; i < 32768; i+=1) data[16*i +: 16] = filedata[i];
  end

  reg [(16*32768)-1:0] data;
  reg reload;
  reg [((2**15)*16)-1:0] memory = 524288'b0;
  computer dut (.program(data), .memory(memory), .reload(reload), .reset(reset), .ARegister(ARegister), .DRegister(DRegister), .pc(pc), .mem_contents(mem_contents));

  initial begin
    $display("|time|reset|ARegister|DRegister|PC[]|RAM16K[0]|RAM16K[1]|RAM16K[2]|");

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

    memory[16 * 0 +: 16] = 0;
    reload = 1'b1;
    reset = 1'b1;
    #2 $display("|7|%b|%d|%d|%d|%d|%d|%d|", reset, ARegister, DRegister, pc, mem_contents[16*0 +: 16], mem_contents[16*1 +: 16], mem_contents[16*2 +: 16]);

    reload = 1'b0;
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

    $finish;
  end
endmodule
