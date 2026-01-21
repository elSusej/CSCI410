module student_dmux (input in, input sel, output a, b);
    /*
    * Develop your solution here.
    * You can use NAND (nand_gate) or any gate you've already created
    * (student_xyz).
    * Please don't use built-in versions of the gate you are modeling.
    */
    wire selNot;
    student_not notInst (sel, selNot);
    student_and andInst1 (selNot, in, a);
    student_and andInst2 (sel, in, b);
endmodule

/*
 * Using your solution above, create a version that has four outputs.
 */
module student_dmux4way (input in, input [1:0] sel, output a, b, c, d);
    // Your solution here

    wire dmux1_in, dmux2_in;

    student_dmux dmuxInst0 ( in, sel[1], dmux1_in, dmux2_in);
    student_dmux dmuxInst1 ( dmux1_in, sel[0], a, b);
    student_dmux dmuxInst2 ( dmux2_in, sel[0], c, d);


endmodule

/*
 * Using your four-way solution above, create a version that has eight outputs.
 */
module student_dmux8way (input in, input [2:0] sel, output a, b, c, d, e, f, g, h);
    // Your solution here

    wire dmux4way1_in, dmux4way2_in;

    student_dmux dmuxInst0 ( in, sel[2], dmux4way1_in, dmux4way2_in);
    student_dmux4way dmuxInst1 ( dmux4way1_in, sel[1:0], a, b, c, d);
    student_dmux4way dmuxInst2 ( dmux4way2_in, sel[1:0], e, f, g, h);
endmodule
