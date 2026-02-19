module student_alu(
    input [15:0] x, y,
    input zx, nx, zy, ny, f, no,
    output [15:0] out,
    output zr, ng
);
    // Implement the ALU (without using assign out = ...)
    // Details in the textbook.

    wire [15:0] zxResult, nxNotResult, nxResult, zyResult, nyNotResult, nyResult, addResult, andResult, fResult, fNotResult, ngAndResult;
    wire topOrResult, botOrResult, zrNot, topOrResult2, botOrResult2;

    student_mux16 zxMuxInst(x, 16'b0, zx, zxResult); //x operations
    student_not16 nxNotInst(zxResult, nxNotResult);
    student_mux16 nxMuxInst(zxResult, nxNotResult, nx, nxResult);

    student_mux16 zyMuxInst(y, 16'b0, zy, zyResult);  //y operations
    student_not16 nyNotInst(zyResult, nyNotResult);
    student_mux16 nyMuxInst(zyResult, nyNotResult, ny, nyResult);

    student_add16 addInst(nxResult, nyResult, addResult); //final operations
    student_and16 andInst(nxResult, nyResult, andResult);
    student_mux16 fMxuInst(andResult, addResult, f, fResult);
    student_not16 noNotInst(fResult, fNotResult);
    student_mux16 noMuxInst(fResult, fNotResult, no, out);

    student_or8way topHalfOrInst(out[15:8], topOrResult); //zr operations
    student_or8way botHalfOrInst(out[7:0], botOrResult);
    student_or finalOrInst(topOrResult, botOrResult, zrNot);
    student_not zrNotInst(zrNot, zr);

    //assign ng = out[15]; <- in order to avoid using assign, the following logic is used to determine if the output is negative (i.e., if the most significant bit is 1)

    student_and16 ngAndInst(out, 16'h8000, ngAndResult); //ng operations
    student_or8way topHalfOrInst2(ngAndResult[15:8], topOrResult2);
    student_or8way botHalfOrInst2(ngAndResult[7:0], botOrResult2);
    student_or finalOrInst2(topOrResult2, botOrResult2, ng);
endmodule