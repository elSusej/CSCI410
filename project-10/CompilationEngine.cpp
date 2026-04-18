#include "JackAnalyzer.hpp"

CompilationEngine::CompilationEngine(JackTokenizer& tokenizer, std::ofstream& outputFile) 
        : tokenizer(tokenizer), outputFile(outputFile) { //initialize class tokenizer and outputfile with those passed in
        if (tokenizer.hasMoreTokens()) { //currentTokenIndex starts at -1. When tokens vector is nonempty, currentTokenIndex + 1 < tokens.size() returns true
                tokenizer.advance(); //need to advance the index in this case to ensure we start at 0
        }

        compileClass();
}

void CompilationEngine::compileClass() {
        //compile some shit type shit

        outputFile << "<class>\n";
        indentLevel++;
        for (int i = 0; i < 3; i++ ) {
                printIndents();
                switch (tokenizer.getCurrentTokenType()) {
                        case JackTokenType::KEYWORD:
                                outputFile << "<keyword> " << tokenizer.getCurrentKeyword() << " </keyword>" << "\n";
                                break;
                        case JackTokenType::SYMBOL:
                                outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
                                break;
                        case JackTokenType::IDENTIFIER:
                                outputFile << "<identifier> " << tokenizer.getCurrentIdentifier() << " </identifier>" << "\n";
                                break;
                        default:
                                throw std::runtime_error("Token at start of compileClass NOT of type: keyword|symbol|identifier");
                        }
                tokenizer.advance();             
        }

        while (tokenizer.getCurrentTokenType() == JackTokenType::KEYWORD && 
                (tokenizer.getCurrentKeyword() == "static" || tokenizer.getCurrentKeyword() == "field")) {
                compileClassVarDec();
        }

        while (tokenizer.getCurrentTokenType() == JackTokenType::KEYWORD && 
                (tokenizer.getCurrentKeyword() == "method" || tokenizer.getCurrentKeyword() == "function" ||
                tokenizer.getCurrentKeyword() == "constructor")) {
                compileSubroutine();
        }

        printIndents();
        //outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        indentLevel--;
        outputFile << "\n</class>\n" << indentLevel; //FIXME commented above line out to test printing, also put \n, and just waanted to check indentLevel
}

void CompilationEngine::compileClassVarDec() {
        printIndents();
        outputFile << "<classVarDec>\n";
        indentLevel++;
        printIndents();
        switch(string2enumTable[tokenizer.getCurrentKeyword()]) {
                case JackKeyword::STATIC:
                        outputFile << "<keyword> " << tokenizer.getCurrentKeyword() << " </keyword>" << "\n";
                        break;
                case JackKeyword::FIELD:
                        outputFile << "<keyword> " << tokenizer.getCurrentKeyword() << " </keyword>" << "\n";
                        break;
                default:
                        throw std::runtime_error("Token at start of compileClassVarDec NOT static|field");
        }
        tokenizer.advance(); 

        outputFile << "</classVarDec>\n";
        indentLevel--;
}

void CompilationEngine::compileSubroutine() {
        printIndents();
        outputFile << "<subroutineDec>\n";
        indentLevel++;
        tokenizer.advance(); 

        indentLevel--;
}


void CompilationEngine::printIndents(){
        for(int i = 0; i < indentLevel; i++) outputFile << "  ";
}
