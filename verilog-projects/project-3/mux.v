module student_mux (input a, b, input sel, output out); //a is zero input, b is one input
    /*
    * Develop your solution here.
    * You can use NAND (nand_gate) or any gate you've already created
    * (student_xyz).
    * Please don't use built-in versions of the gate you are modeling.
    */
    wire bAndSel, aAndSelNot, selNot;

    nand_gate nandInst1 (sel, sel, selNot);
    nand_gate nandInst2 (b, sel, bAndSel);
    nand_gate nandInst3 (a, selNot, aAndSelNot);
    nand_gate nandInst4 (aAndSelNot, bAndSel, out);
endmodule

/*
 * Using your single-bit solution above, create a 16-bit version here.
 */
module student_mux16 (input [15:0] a, b, input sel, output [15:0] out);
    genvar i;
    generate
        for (i=0; i<16; i=i+1) begin
            // Use your student_mux gate here for each bit in the vectors
            student_mux muxInst ( a[i], b[i], sel, out[i]);
        end
    endgenerate
endmodule

/*
 * Using your 16-bit solution above, create a version that accepts four inputs.
 */
module student_mux4way16 (input [15:0] a, b, c, d, input [1:0] sel, output [15:0] out);
    // Your solution here
    wire [15:0] mux1_out, mux2_out;

    student_mux16 muxInst1 ( a, b, sel[0], mux1_out);
    student_mux16 muxInst2 ( c, d, sel[0], mux2_out);
    student_mux16 muxInst3 ( mux1_out,  mux2_out, sel[1], out);

endmodule

/*
 * Using your four-way solution above, create a version that accepts eight inputs.
 */
module student_mux8way16 (input [15:0] a, b, c, d, e, f, g, h, input [2:0] sel, output [15:0] out);
    // Your solution here
    wire [15:0] mux1_out, mux2_out;
    
    student_mux4way16 muxInst1 ( a, b, c, d, sel[1:0], mux1_out);
    student_mux4way16 muxInst2 ( e, f, g, h, sel[1:0], mux2_out);
    student_mux16 muxInst3 ( mux1_out, mux2_out, sel[2], out);
endmodule
