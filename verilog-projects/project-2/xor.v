module student_xor (input a, b, output out);
    /*
    * Develop your solution here.
    * You can use NAND (nand_gate) or any gate you've already created
    * (student_xyz).
    * Please don't use built-in versions of the gate you are modeling.
    */
    wire aNot, bNot, aAndbNot, aNotAndb;

    nand_gate nanInsst1 (a, a, aNot);
    nand_gate nandInst2 (b, b, bNot);
    nand_gate nandInst3 (a, bNot, aAndbNot);
    nand_gate nandInst4 (aNot, b, aNotAndb);
    nand_gate nandInst5 (aAndbNot, aNotAndb, out);
endmodule
