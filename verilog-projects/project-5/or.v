module student_or (input a, b, output out);
    /*
    * Develop your solution here.
    * You can use NAND (nand_gate) or any gate you've already created
    * (student_xyz).
    * Please don't use built-in versions of the gate you are modeling.
    */
    wire aNot, bNot;

    nand_gate nandInst1 (a, a, aNot);
    nand_gate nandInst2 (b, b, bNot);
    nand_gate nandInst3 (aNot, bNot, out);

endmodule

/*
 * Using your single-bit solution above, create a 16-bit version here.
 */
module student_or16 (input [15:0] a, b, output [15:0] out);
    genvar i;
    generate
        for (i=0; i<16; i=i+1) begin
            // Use your student_or gate here for each bit in the vectors
            student_or orInst ( a[i], b[i], out[i]);
        end
    endgenerate
endmodule

/*
 * Using your single-bit solution above, create gate that uses a vector of
 * booleans as an input.
 * If any of the bits of `in` are `1`, the output should be `1`.
 * 
 * There are several ways of approaching this, but I recommend using a for
 * loop in some way to reduce repeated code.
 */
module student_or8way (input [7:0] in, output out);
    wire [3:0] orLevel1;
    wire [1:0] orLevel2;
    genvar i;
    generate
        for (i=0; i<8; i=i+2) begin
            // Use your student_or gate here for each bit in the input vector
            student_or orLevel1 (in[i], in[i+1], orLevel1[i/2]);
        end
    endgenerate
    generate 
        for (i=0; i<4; i=i+2) begin
            student_or orLevel2 (orLevel1[i], orLevel1[i+1], orLevel2[i/2]);
        end
    endgenerate
    student_or orFinal (orLevel2[0], orLevel2[1], out);
endmodule
