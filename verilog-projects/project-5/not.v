module student_not (input in, output out);
    /*
    * Develop your solution here.
    * You can use NAND (nand_gate) or any gate you've already created
    * (student_xyz).
    * Please don't use built-in versions of the gate you are modeling.
    */
    nand_gate nandinst (in, in, out);
endmodule

/*
 * Using your single-bit solution above, create a 16-bit version here.
 */
module student_not16 (input [15:0] in, output [15:0] out);
    genvar i;
    generate
        for (i=0; i<16; i=i+1) begin
            // Use your student_not gate here for each bit in the vectors
            nand_gate nandinst ( in[i], in[i], out[i]);
        end
    endgenerate
endmodule
