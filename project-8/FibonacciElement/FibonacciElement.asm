// Bootstrap code
@256
D=A
@SP
M=D
// call Sys.init 0
// push return address to stack
@OS$return.Sys.init.0
D=A
@SP
A=M
M=D
@SP
M=M+1
// push LCL of caller
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// push ARG of caller
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THIS of caller
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THAT of caller
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG = SP - 5 - nArgs
@SP
D=M
@5
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// Goto name
@Sys.init
0;JMP
// Declare return label
(OS$return.Sys.init.0)
// function Main.fibonacci 0
(Main.fibonacci)
// push argument 0
@0
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt
@SP
AM=M-1
D=M
@SP
A=M-1
D=M-D
@TRUE0
D;JLT
@SP
A=M-1
M=0
@END0
0;JMP
(TRUE0)
@SP
A=M-1
M=-1
(END0)
// if-goto N_LT_2
@SP
AM=M-1
D=M
@Main.fibonacci$N_LT_2
D;JNE
// goto N_GE_2
@Main.fibonacci$N_GE_2
0;JMP
(Main.fibonacci$N_LT_2)
// push argument 0
@0
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
AM=M-1
D=M
@THAT
M=D
@R13
AM=M-1
D=M
@THIS
M=D
@R13
AM=M-1
D=M
@ARG
M=D
@R13
AM=M-1
D=M
@LCL
M=D
@R14
A=M
0;JMP
(Main.fibonacci$N_GE_2)
// push argument 0
@0
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D
// call Main.fibonacci 1
// push return address to stack
@Main.fibonacci$return.Main.fibonacci.1
D=A
@SP
A=M
M=D
@SP
M=M+1
// push LCL of caller
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// push ARG of caller
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THIS of caller
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THAT of caller
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG = SP - 5 - nArgs
@SP
D=M
@6
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// Goto name
@Main.fibonacci
0;JMP
// Declare return label
(Main.fibonacci$return.Main.fibonacci.1)
// push argument 0
@0
D=A
@ARG
A=D+M
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
AM=M-1
D=M
@SP
A=M-1
M=M-D
// call Main.fibonacci 1
// push return address to stack
@Main.fibonacci$return.Main.fibonacci.2
D=A
@SP
A=M
M=D
@SP
M=M+1
// push LCL of caller
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// push ARG of caller
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THIS of caller
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THAT of caller
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG = SP - 5 - nArgs
@SP
D=M
@6
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// Goto name
@Main.fibonacci
0;JMP
// Declare return label
(Main.fibonacci$return.Main.fibonacci.2)
// add
@SP
AM=M-1
D=M
@SP
A=M-1
M=D+M
// return
@LCL
D=M
@R13
M=D
@5
A=D-A
D=M
@R14
M=D
@SP
A=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R13
AM=M-1
D=M
@THAT
M=D
@R13
AM=M-1
D=M
@THIS
M=D
@R13
AM=M-1
D=M
@ARG
M=D
@R13
AM=M-1
D=M
@LCL
M=D
@R14
A=M
0;JMP
// function Sys.init 0
(Sys.init)
// push constant 4
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// call Main.fibonacci 1
// push return address to stack
@Sys.init$return.Main.fibonacci.3
D=A
@SP
A=M
M=D
@SP
M=M+1
// push LCL of caller
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
// push ARG of caller
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THIS of caller
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
// push THAT of caller
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG = SP - 5 - nArgs
@SP
D=M
@6
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// Goto name
@Main.fibonacci
0;JMP
// Declare return label
(Sys.init$return.Main.fibonacci.3)
(Sys.init$END)
// goto END
@Sys.init$END
0;JMP
