module computer (
    input [(32768*16)-1:0] program,
    input [((2**15)*16)-1:0] memory,
    input reload,
    input reset,
    output [14:0] pc,
    output [15:0] ARegister, DRegister,
    output [((2**15)*16)-1:0] mem_contents // used so test scripts can see what's going on
);
    wire [15:0] instr, inM, outM;
    wire [14:0] address;

    assign instr = program[16*pc +: 16];
    student_cpu cpu (
        .inM(inM),
        .instruction(instr),
        .reset(reset),
        .outM(outM),
        .writeM(writeM),
        .address(address),
        .pc(pc),
        .ARegister(ARegister),
        .DRegister(DRegister)
    );
    computer_memory mem (.data(memory), .reload(reload), .in(outM), .load(writeM), .address(address), .out(inM), .mem_contents(mem_contents));
endmodule
