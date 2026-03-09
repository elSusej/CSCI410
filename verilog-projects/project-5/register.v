// The intent is for you to use 16 bits to form a register, but when we
// get to the 16k ram there will be so many components to link that it
// will timeout the autograder, so you can use a 16-bit dff instead to fix
// this.
// Just understand that this component is supposed to be 16 bits.
//
// A 16 bit dff can be instantiated using the parameter N. Read the section of
// the verilog primer for details on parameterization.

// module student_register (input[15:0] in, input load, output [15:0] out); //original 16 bit version
//     genvar i;
//     generate
//         for (i = 0; i < 16; i = i + 1) begin
//             student_bit bitInst(in[i], load,out[i]);
//         end
//     endgenerate
// endmodule

// module student_register (input[15:0] in, input load, output [15:0] out); //is still a little slow
//     wire [15:0] dffIn, dffOut;
//     student_mux16 muxInst (dffOut, in, load, dffIn); 
//     dff #(16) dffIinst (dffIn, dffOut);

//     assign out = dffOut;
// endmodule

module student_register (input[15:0] in, input load, output [15:0] out);
    wire [15:0] signal = load ? in : out; //if load is high, signal is in, otherwise signal is out (ie the current value of the register is fed back into itself when load is low)
    dff #(16) dffInst (signal, out); //on the rising edge of the clock, the value of signal is loaded into the register and becomes the new output
endmodule