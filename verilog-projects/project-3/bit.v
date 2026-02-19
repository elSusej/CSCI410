module student_bit(input in, load, output out);
    wire dFFin, dFFout;
    student_mux muxInst(dFFout,in,load,dFFin); //could alternative and load with clk signal
    dff dffInst(dFFin, dFFout);
    assign out = dFFout;
endmodule