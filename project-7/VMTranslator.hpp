#ifndef VMTRANSLATOR_HEADER
#define VMTRANSLATOR_HEADER

#include <stdio.h>
#include <iostream> //for stdout/in (cout)
#include <fstream> //needed for file stream
#include <sstream> //for istringstream
#include <algorithm> //for remove_if
#include <string> 
#include <map>
#include <vector>

enum CommandType {
    C_ARITHMETIC,
    C_PUSH,
    C_POP,
//     C_LABEL, unused for now
//     C_GOTO,
//     C_IF,
//     C_FUNCTION,
//     C_RETURN,
//     C_CALL
};

struct VMCommand {
    CommandType type;
    std::string arg1; // For C_ARITHMETIC, this is the command itself (e.g., "add", "sub"), For C_PUSH and C_POP, this is the segment (e.g., "local", "argument", "constant")
    int arg2; // For C_PUSH and C_POP, this is the index (e.g., 0 for "push local 0")
};

std::map<std::string, std::string> segmentBase = {
        {"local", "LCL"},
        {"argument", "ARG"},
        {"this", "THIS"},
        {"that", "THAT"},
        {"temp", "5"}
};

std::vector<VMCommand> parser(std::ifstream& vmFile);
void translator(std::vector<VMCommand> commands, std::ofstream& asmFile);
void translateArithmeticLogical(VMCommand& cmd, std::ofstream& asmFile);
void translatePush(VMCommand& cmd, std::ofstream& asmFile);
void translatePop(VMCommand& cmd, std::ofstream& asmFile);

#endif