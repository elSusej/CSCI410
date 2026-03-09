// Read the textbook on this one. Especially chapter 4.
//
// One particularly sticky bit is the 'a' bit for C-instructions indicates the
// source is the inM not ARegister, despite the letter seeming to indicate the
// opposite.

//following defines are for c instructions
`define JUMP_START_BIT 2 //these 3 are the j-bits of c-type instructions
`define RAM_LOAD_BIT_INDEX 3 //these 3 are the d-bits of c-type instructions
`define DREG_LOAD_BIT_INDEX 4
`define AREG_LOAD_BIT_INDEX 5
`define ALU_INSTRUCTION_END_BIT 6 //these 6 are the c-bits of c-type instructions
`define ALU_INSTRUCTION_START_BIT 11
`define ALU_INPUT_SELECT_BIT_INDEX 12 //a bit of c-type instructions


`define OPCODE_INDEX 15 //0 if a-type instruction, 1 if c-type



//dependent on previous projects verilog files, as well as provided dff, and muxlib
module student_cpu (
    input signed [15:0] inM,
    input [15:0] instruction,
    input reset,
    output signed [15:0] outM,
    output writeM,
    output [14:0] address, pc,
    output signed [15:0] ARegister, DRegister // used so test scripts can see what's going on
);
    

    wire [15:0] Areg_in, Areg_out, Dreg_out, ALU_out, ALU_yIn, pc_long;
    wire [31:0] AInputMuxBus, ALU_yMuxBus;
    reg [1:0] pcSelect; //bit 1 = pcLoad, bit 0 = pcInc (IMPORANT: MUST BE REG TYPE TO USE IN ALWAYS BLOCK)
    wire zx, nx, zy, ny, f, no, zr, ng, loadA, loadD;
    
    //NEED THESE TWO LINES FOR AUTOGRADER
    assign ARegister = Areg_out;
    assign DRegister = Dreg_out;
    //

    assign pc = pc_long[14:0];
    assign {zx, nx, zy, ny, f, no} = instruction[`ALU_INSTRUCTION_START_BIT:`ALU_INSTRUCTION_END_BIT];
    assign AInputMuxBus = {instruction,ALU_out}; //only lower 15 bits of instruction,with 0 in MSB for A-type loading
    assign ALU_yMuxBus = {Areg_out,inM}; //swappy

    assign address = Areg_out[14:0];
    assign outM = ALU_out; //might CHANGE later: "If one of the destination registers is M, the CPU’s outM output is set to the ALU output"
    assign writeM = instruction[`OPCODE_INDEX] & instruction[`RAM_LOAD_BIT_INDEX]; //check if C instruction AND ram load high 
    assign loadA = (~instruction[`OPCODE_INDEX]) | (instruction[`AREG_LOAD_BIT_INDEX] & instruction[`OPCODE_INDEX]); //if C-type, loadA depending on destination bit, but if A just load always
    assign loadD = instruction[`DREG_LOAD_BIT_INDEX] & instruction[`OPCODE_INDEX];
    //have to computer load for pc from zr, ng, and jjj, 
    //assume jump means load input to pc, and inc is default pc behavior 
    //load and inc are 1's hot encoded (never assert both at once, always have at least 1 asserted)
    //01 no jump, 10 jump
    
    always @(*) begin
        casez({instruction[`OPCODE_INDEX],zr,ng,instruction[`JUMP_START_BIT:0]})
            6'b0?????: pcSelect = 2'b01;
            6'b1??000: pcSelect = 2'b01; //no jump
            6'b100001: pcSelect = 2'b10; //jump if >0
            6'b11?010: pcSelect = 2'b10; //jump if 0
            6'b1?0011: pcSelect = 2'b10; //jump if >=0 (nonnegative)
            6'b101100: pcSelect = 2'b10; //jump if <0
            6'b10?101: pcSelect = 2'b10; //jump if !=0 
            6'b11?110: pcSelect = 2'b10; //JUMP IF ZERO, (for <=0 jump inst) 
            6'b1?1110: pcSelect = 2'b10; //JUMP IF <0, (for <=0 jump inst) 
            6'b1??111: pcSelect = 2'b10; //unconditional jump
            default: pcSelect = 2'b01; //if something weird happens, increment by default 
        endcase
    end

    student_register AReg (Areg_in,loadA,Areg_out); 
    student_register DReg (ALU_out,loadD,Dreg_out);
    student_pc PC (Areg_out,reset,pcSelect[1],pcSelect[0],pc_long);
    student_alu ALU (Dreg_out, ALU_yIn, zx, nx, zy, ny, f, no, ALU_out, zr, ng); 
    mux#(2,16) AInputMux (AInputMuxBus,instruction[`OPCODE_INDEX],Areg_in); //load lower 15 bits of instruction into A if A-type instruction 
    mux#(2,16) ALU_yInMux (ALU_yMuxBus,instruction[`ALU_INPUT_SELECT_BIT_INDEX],ALU_yIn); //2 inputs of size 16 to select from (inputs combined into 32 bit wire)
endmodule
