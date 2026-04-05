#include "VMTranslator.hpp"

using namespace std;
int main(int argc, char** argv) {
        if(argc != 2) {
                cout <<"usage: vmtranslator prog.vm" << endl;
                return -1;
        }

        string input_file = argv[1];
        string output_file = input_file;
        size_t pos = output_file.find(".vm");
        output_file.replace(pos, 4, ".asm");
        ifstream vmFile(input_file);
        ofstream asmFile(output_file);

        //add static to segmentBase map, ie filename up to vm
        string fileNameSubstr= input_file.substr(0, pos);
        segmentBase["static"] = fileNameSubstr;

        vector<VMCommand> commands = parser(vmFile); //currently adds previous arg2 of C_POP/C_PUSH commands to next C_ARITHMETIC cmd, but this will be ignored anyways
        translator(commands, asmFile);
        
        vmFile.close();
        asmFile.close();
}

vector<VMCommand> parser(ifstream& vmFile) {
        vector<VMCommand> commands;
        string currLine;

        while(getline(vmFile, currLine)) {
                VMCommand cmd; 

                size_t cmtPos = currLine.find("//"); 
                if (cmtPos != string::npos) {
                        currLine.erase(cmtPos);
                }

                // trim whitespace from beginning and end of currLine
                auto notSpace = [](unsigned char c)
                { return !isspace(c); };

                currLine.erase(currLine.begin(), find_if(currLine.begin(), currLine.end(), notSpace)); //find_if will pass each char from currLine until notspace is true, then return an iterator to that position. If all chars are space, it will return currLine.end()
                currLine.erase(
                    find_if(currLine.rbegin(), currLine.rend(), notSpace).base(),
                    currLine.end());

                if (currLine == "") { //prevents accessing of currLine if its empty
                        continue;
                }

                vector<string> tokens;
                std::istringstream iss(currLine);
                string tok;

                while (iss >> tok) tokens.push_back(tok);

                if (tokens[0] == "push") {
                        cmd.type = C_PUSH;
                        cmd.arg1 = tokens[1];
                        cmd.arg2 = stoi(tokens[2]);
                } else if (tokens[0] == "pop") {
                        cmd.type = C_POP;
                        cmd.arg1 = tokens[1];
                        cmd.arg2 = stoi(tokens[2]);
                } else { //arithmetic command
                        cmd.type = C_ARITHMETIC;
                        cmd.arg1 = tokens[0];
                }
                commands.push_back(cmd);
        }

        return commands;
}


void translator(vector<VMCommand> commands, ofstream& asmFile) {
        for (VMCommand& cmd : commands) {
                switch (cmd.type) {
                        case C_ARITHMETIC:
                                translateArithmeticLogical(cmd, asmFile);
                                break;
                        case C_PUSH:
                                translatePush(cmd, asmFile);
                                break;
                        case C_POP:
                                translatePop(cmd, asmFile);
                                break;
                }
        }
}

void translateArithmeticLogical(VMCommand& cmd, ofstream& asmFile) {
        string op = cmd.arg1;
        asmFile << "// " << op  << endl;

        if (op == "add" || op == "sub" || op == "and" || op == "or" || op == "eq" || op == "gt" || op == "lt") { //lets test add real quick and then add in gt lt and eq
                //binary operations, need to pop 2 values from stack
                asmFile << "@SP" << "\n"
                        << "AM=M-1" << "\n" // set address stored in stack pointer to 1 less than current(to get top of stack), and also store this in A
                        << "D=M" << endl;    // put *SP into D (top of stack into D)

                if (op == "add" || op == "sub" || op == "and" || op == "or") {
                        string comp;
                        if (op == "add") comp = "D+M";
                        else if (op == "sub") comp = "M-D";
                        else if (op == "and") comp = "D&M";
                        else comp = "D|M";

                        asmFile << "@SP" << "\n"
                                << "A=M-1" << "\n" // A = address of second value to operate on (first value is currently in D)
                                << "M=" << comp << endl; // perform operation and store result in second value's position on stack
                } else {
                        string jump;
                        if (op == "eq") jump = "JEQ";
                        else if (op == "gt") jump = "JGT";
                        else jump = "JLT";

                        static int labelCounter = 0; //need unique labels for each eq gt lt command to prevent jumping to wrong label
                        string trueLabel = "TRUE" + to_string(labelCounter);
                        string endLabel = "END" + to_string(labelCounter);
                        labelCounter++;

                        asmFile << "@SP" << "\n"
                                << "A=M-1" << "\n" // A = address of second value to compare (first value is currently in D)
                                << "D=M-D" << "\n" // D = second value - first value (if first and second value are equal, D will be 0. If second value > first value, D will be positive. If second value < first value, D will be negative)
                                << "@" << trueLabel << "\n"
                                << "D;" << jump << "\n" // if comparison is true, jump to trueLabel
                                << "@SP" << "\n"
                                << "A=M-1" << "\n"
                                << "M=0" << "\n" // if comparison is false, set second value to 0 (false)
                                << "@" << endLabel << "\n"
                                << "0;JMP" << "\n" // jump to endLabel
                                << "(" << trueLabel << ")" << "\n"
                                << "@SP" << "\n"
                                << "A=M-1" << "\n"
                                << "M=-1" << "\n" // if comparison is true, set second value to -1 (true)
                                << "(" << endLabel << ")" << endl;
                }

        } else {
                //unary operations, only need to pop 1 value from stack
                asmFile << "@SP" << "\n"
                        << "A=M-1" << "\n"; // A = address of value to operate on (also top of stack)

                if (op == "neg") {
                        asmFile << "M=-M" << endl; // negate value at top of stack
                } else if (op == "not") {
                        asmFile << "M=!M" << endl; // bitwise not value at top of stack
                }
        }

}

void translatePush(VMCommand& cmd, ofstream& asmFile) {
        string targetSegment;
        asmFile << "// push " << cmd.arg1 << " " << cmd.arg2 << endl;
        switch (cmd.arg1[0]) {
                case 'c': //constant
                        asmFile << "@" << cmd.arg2 << "\n"
                                << "D=A" << "\n" // D = constant value
                                << "@SP" << "\n"
                                << "A=M" << "\n" // A = address of top of stack
                                << "M=D" << "\n" //*SP = constant value
                                << "@SP" << "\n"
                                << "M=M+1" << endl; // SP++
                        break;
                case 's': //static
                        targetSegment = segmentBase[cmd.arg1] + "." + to_string(cmd.arg2); //static variables become a memeory address in assembler process
                        asmFile << "@" << targetSegment << "\n"
                                << "D=M" << "\n" // D = value to push
                                << "@SP" << "\n"
                                << "A=M" << "\n" // A = address of top of stack
                                << "M=D" << "\n" //*SP =  value to push
                                << "@SP" << "\n"
                                << "M=M+1" << endl; // SP++
                        break;
                case 'p': //pointer
                        targetSegment = (cmd.arg2 == 0) ? "THIS" : "THAT";
                        asmFile << "@" << targetSegment << "\n"
                                << "D=M" << "\n"   // D = value to push
                                << "@SP" << "\n"
                                << "A=M" << "\n" // A = address of top of stack
                                << "M=D" << "\n" //*SP =  value to push
                                << "@SP" << "\n"
                                << "M=M+1" << "\n"; // SP++
                        break;
                default: //local, argument, this, that, temp
                        string baseAddress = (cmd.arg1 == "temp") ? "A" : "M";
                        asmFile << "@" << cmd.arg2 << "\n"
                                << "D=A" << "\n" // D = index value
                                << "@" << segmentBase[cmd.arg1] << "\n"
                                << "A=D+" << baseAddress << "\n" // A = address of the value to push
                                << "D=M" << "\n"   // D = value to push
                                << "@SP" << "\n"
                                << "A=M" << "\n" // A = address of top of stack
                                << "M=D" << "\n" //*SP =  value to push
                                << "@SP" << "\n"
                                << "M=M+1" << endl; // SP++
                        break;
        }
}

void translatePop(VMCommand& cmd, ofstream& asmFile) {
        string targetSegment;
        asmFile << "// pop " << cmd.arg1 << " " << cmd.arg2 << endl;
        switch (cmd.arg1[0]) {
                case 's': //static
                        targetSegment = segmentBase[cmd.arg1] + "." + to_string(cmd.arg2);
                        asmFile << "@SP" << "\n"
                                << "AM=M-1" << "\n" // set address stored in stack pointer to 1 less than current(to get top of stack), and also store this in A
                                << "D=M" << "\n"    // put *SP into D (top of stack into D)
                                << "@" << targetSegment << "\n" // address of static variable to pop into
                                << "M=D" << endl; // static[i] = popped value from stack
                        break;
                case 'p': //pointer
                        targetSegment = (cmd.arg2 == 0) ? "THIS" : "THAT";
                        asmFile << "@SP" << "\n"
                                << "AM=M-1" << "\n" // set address stored in stack pointer to 1 less than current(to get top of stack), and also store this in A
                                << "D=M" << "\n"    // put *SP into D (top of stack into D)
                                << "@" << targetSegment << "\n" // address of pointer variable to pop into
                                << "M=D" << endl; // pointer[i] = popped value from stack
                        break;
                default: //local, argument, this, that, temp
                        string baseAddress = (cmd.arg1 == "temp") ? "A" : "M";
                        asmFile << "@" << cmd.arg2 << "\n"
                                << "D=A" << "\n"
                                << "@" << segmentBase[cmd.arg1] << "\n"
                                << "D=D+" << baseAddress << "\n" // address to store popped value
                                << "@R13" << "\n"
                                << "M=D" << "\n" // R13 will temporarily store address to store popped value
                                << "@SP" << "\n"
                                << "AM=M-1" << "\n" // set address stored in stack pointer to 1 less than current(to get top of stack), and also store this in A
                                << "D=M" << "\n"    // put *SP into D (top of stack into D)
                                << "@R13" << "\n"
                                << "A=M" << "\n" // target address to store popped value
                                << "M=D" << endl; // segment[i] = popped value
                        break;
        }
}
