// Read the section of the Verilog Primer (linked to on the Canvas page) about
// Muxlib. It will be helpful.

// As you implement more of these (especially ram16k) running the tests will
// be pretty slow. That is expected.

module student_ram8 (input [15:0] in, input load, input [2:0] address, output [15:0] out);

    wire [7:0] dmuxOut; //for selecting which reg receives load
    wire [127:0] regOut; //16 bit wires for 8 register outputs = 128 bit wire total
    dmux #(8, 1) dmuxInst (load, address, dmuxOut); //has parametrized in width N=1, and W=8 for 8 outputs (address is used to select which output receives the load signal)
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin
            student_register regInst(in, dmuxOut[i], regOut[i*16 +: 16]); // +: is a part select operator, it selects 16 bits starting at index i*16 (ie regOut[0:15] for i=0, regOut[16:31] for i=1, etc)
        end
    endgenerate
    mux #(8,16) muxInst (regOut, address, out); //has parameterized input/output width N=16 bits, and W=8 for 8 inputs to be selected from (address does the selecting)
     
endmodule

module student_ram64 (input [15:0] in, input load, input [5:0] address, output [15:0] out);

    wire [7:0] dmuxOut; //for selecting which ram8 receives load
    wire [127:0] ram8Outs; //16 bit wires for 8 ram8 outputs = 128 bit wire total

    dmux #(8, 1) dmuxInst (load, address[5:3], dmuxOut); //address[5:3] selects which ram8 to load, address[2:0] will be passed to the selected ram8 to select which register to load
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin
            student_ram8 ram8Inst (in, dmuxOut[i], address[2:0], ram8Outs[i*16 +: 16]);
        end
    endgenerate
    mux #(8,16) muxInst (ram8Outs, address[5:3], out); //selecting which ram8 output to use based on address[5:3]
endmodule

module student_ram512 (input [15:0] in, input load, input [8:0] address, output [15:0] out);

    wire [7:0] dmuxOut;
    wire [127:0] ram64Outs;

    dmux #(8, 1) dmuxInst (load, address[8:6], dmuxOut); //address[8:6] selects which ram64 to load, address[5:0] will be passed to the selected ram64 to select which register to load
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin
            student_ram64 ram64Inst (in, dmuxOut[i], address[5:0], ram64Outs[i*16 +: 16]);
        end 
    endgenerate

    mux #(8,16) muxInst (ram64Outs, address[8:6], out);

endmodule

module student_ram4k (input [15:0] in, input load, input [11:0] address, output [15:0] out);
    wire [7:0] dmuxOut;
    wire [127:0] ram512Outs;

    dmux #(8, 1) dmuxInst (load, address[11:9], dmuxOut); 
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin
            student_ram512 ram512Inst (in, dmuxOut[i], address[8:0], ram512Outs[i*16 +: 16]);
        end
    endgenerate
    mux #(8, 16) muxInst (ram512Outs, address[11:9], out);
endmodule

module student_ram16k (input [15:0] in, input load, input [13:0] address, output [15:0] out);
    wire [3:0] dmuxOut;
    wire [63:0] ram4kOuts; //16 bit wires for 4 ram4k outputs = 64 bit wire total

    dmux #(4, 1) dmuxInst (load, address[13:12], dmuxOut);
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin
            student_ram4k ram4kInst (in, dmuxOut[i], address[11:0], ram4kOuts[i*16 +: 16]);
        end
    endgenerate
    mux #(4, 16) muxInst (ram4kOuts, address[13:12], out);
endmodule