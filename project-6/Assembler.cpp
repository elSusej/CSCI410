#include "Assembler.hpp"

using namespace std;
int main(int argc, char** argv) {
        if(argc != 2) {
                cout <<"usage: assembler prog.asm" << endl;
                return -1;
        }

        string input_file = argv[1];
        string output_file = input_file;
        size_t pos = output_file.find(".asm");
        output_file.replace(pos, 4, ".hack");
        ifstream asmFile(input_file);
        ofstream hackFile(output_file);

        vector<string> instructions = firstPass(asmFile);
        secondPass(instructions,hackFile);
        
        asmFile.close();
        hackFile.close();
}

vector<string> firstPass(ifstream& asmFile) {
        int PC = 0;
        vector<string> instructions;
        string currLine;
        string cmdArr[2];
        while(getline(asmFile, currLine)) {
                getNextCommand(currLine, cmdArr);
                if (cmdArr[1] == "L-Type") {
                        symbolTable[cmdArr[0]] = PC;
                } else if (cmdArr[0] != "" ){ //don't inc PC or account for empty lines in instruction list
                        PC++;
                        instructions.push_back(cmdArr[0]); 
                } //maybe it's fine to lose instruction type since we're doing a second pass anyways
        }

        return instructions;
}

void getNextCommand(string currLine, string (&cmdArr)[2]) {
        
        currLine.erase(remove_if(currLine.begin(), currLine.end(), //remove empty space (\r was being problematic)
                [](unsigned char c) { return std::isspace(c) || c == '\r'; }),
                currLine.end()
        );
        size_t cmtPos = currLine.find("//"); 
        if (cmtPos != string::npos) {
                currLine.erase(cmtPos);
        }

        if (currLine == "") { //prevents accessing of currLine[0] if its empty
                cmdArr[0] = currLine;
                cmdArr[1] = "";
                return;
        }
        
        switch (currLine[0]) {
                case '@':
                        cmdArr[1] = "A-Type";
                        break;
                case '(':
                        currLine.erase( //remove parends
                            remove_if(currLine.begin(), currLine.end(),
                                           [](unsigned char c)
                                           { return c == '(' || c == ')'; }),
                            currLine.end());
                        cmdArr[1] = "L-Type";
                        break;
                default:
                        cmdArr[1] = "C-Type";
        }
        cmdArr[0] = currLine;
}   

void secondPass(vector<string> instructions, ofstream& hackFile) {
        int variableValue = 16;
        string cmdArr[2];
        for ( auto& element : instructions) { //
                getNextCommand(element, cmdArr); //only calling to get instruction type
                if (cmdArr[1] == "A-Type") {
                        translateA(element, variableValue);
                        int base10 = stoi(element);
                        hackFile << bitset<16>(base10) << endl; //0 is implicitly added to MSB of A-type instructions
                } else if (cmdArr[1] == "C-Type") {
                        translateC(element);
                        hackFile << element << endl;
                }
                
        }
        

 }

void translateA(std::string& cmd, int& varValue) {
       string key = cmd.substr(1);
       bool isNumber = true;
       
       for (auto c: key) {
                if (!isdigit(c)) {
                        isNumber = false;
                        break;
                }
       }

       if(isNumber) {
                //convert to int (done in secondPass)
                cmd = key;
       } else {
                if (symbolTable.find(key) == symbolTable.end()) {
                        //key not found
                        symbolTable[key] = varValue;
                        varValue++;
                }
                cmd = to_string(symbolTable[key]); 
       } 
}

void translateC(std::string& cmd) {
        string comp,dest,jump,cmdNoJump;
        size_t semiPos = cmd.find(";");
        if (semiPos == string::npos) { //semi not found
                jump = jumpTable[""];
                cmdNoJump = cmd;
        } else {
                string jmpKey = cmd.substr(semiPos+1); 
                jump = jumpTable[jmpKey];
                cmdNoJump = cmd.substr(0, semiPos);
        }
        size_t eqPos = cmdNoJump.find("=");
        if (eqPos == string::npos) { //eq not found
                dest = destTable[""];
                comp = compTable[cmdNoJump];
        } else {
                dest = destTable[cmdNoJump.substr(0,eqPos)];
                comp = compTable[cmdNoJump.substr(eqPos+1)];
        }

        cmd = "111" + comp + dest + jump;
}