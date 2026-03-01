

@R2
M=0 //initialize result to 0 

(Addition_Loop)
@R1
D=M 
@end
D;JEQ //jump to end if index (R1) =0

@R0 
D=M //load first number into D 6

@R2 
M=D+M //add first number to result 6 12 18

@R1
M=M-1 //decrement 2nd number so that we can loop that many times 2 1 0

@Addition_Loop
0;JMP // always jump 

(end)
@end
0;JMP


//repeated addition until second multiplicator is decremented to 0