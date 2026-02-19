module student_pc (input [15:0] in, input reset, load, inc, output [15:0] out);
    wire [15:0] regOut, incOut, incMuxOut, loadMuxOut, regIn;

    student_inc16 incInst(regOut, incOut);
    student_mux16 incMuxInst (regOut, incOut, inc, incMuxOut);
    student_mux16 loadMuxInst (incMuxOut, in, load, loadMuxOut);
    student_mux16 resetMuxInst (loadMuxOut, 16'h0000, reset, regIn);
    student_register regInst (regIn, 1'b1, regOut);
    assign out = regOut; //must be regOut, as register out(t) must first populate the register before it can become a valid output (ie regIn is the next PC value, not the current one, whereas regOut is)
    

endmodule