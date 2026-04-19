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
        indentLevel++; //increase everytime a parsing unit starts, decrement before it returns
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

        printIndents(); //print class ending }
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        indentLevel--;
        outputFile << "</class>\n"; //For debugging: << indentLevel;
}

void CompilationEngine::compileClassVarDec() {
        printIndents();
        outputFile << "<classVarDec>\n";
        indentLevel++;

        printIndents(); //Output tag for static|field keywords
        outputFile << "<keyword> " << tokenizer.getCurrentKeyword() << " </keyword>" << "\n";
        tokenizer.advance();
        
        compileType();

        while (true) {
                printIndents();
                outputFile << "<identifier> " << tokenizer.getCurrentIdentifier() << " </identifier>" << "\n";
                tokenizer.advance();

                printIndents(); //might have to put this section under a check 
                outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
                if (tokenizer.getCurrentSymbol() == ";") break;
                tokenizer.advance();
        }
        tokenizer.advance();

        indentLevel--;
        printIndents();
        outputFile << "</classVarDec>\n";
}

void CompilationEngine::compileSubroutine() {
        printIndents();
        outputFile << "<subroutineDec>\n";
        indentLevel++;
        printIndents(); //Output keyword tag for constructor|function|method
        outputFile << "<keyword> " << tokenizer.getCurrentKeyword() << " </keyword>" << "\n";
        tokenizer.advance();

        compileType();
        
        printIndents(); //Output identifier tag for subroutineName
        outputFile << "<identifier> " << tokenizer.getCurrentIdentifier() << " </identifier>" << "\n";
        tokenizer.advance();

        printIndents(); //Output symbol tag for (
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();

        compileParameterList(); 

        printIndents(); //Output symbol tag for )
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();

        compileSubroutineBody();

        indentLevel--;
        printIndents();
        outputFile << "</subroutineDec>\n";
}

void CompilationEngine::compileType() {
        //PARSE type
        printIndents();
        switch(tokenizer.getCurrentTokenType()) {
                case JackTokenType::KEYWORD:
                        outputFile << "<keyword> " << tokenizer.getCurrentKeyword() << " </keyword>" << "\n";
                        break;
                case JackTokenType::IDENTIFIER:
                        outputFile << "<identifier> " << tokenizer.getCurrentIdentifier() << " </identifier>" << "\n";
                        break;
                default:
                        throw std::runtime_error("Token at start of compileType NOT of type: keyword|identifier");
                        
        }
        tokenizer.advance();
}

void CompilationEngine::compileParameterList() {
        printIndents();
        outputFile << "<parameterList>\n";
        indentLevel++;
        
        if (tokenizer.getCurrentTokenType() == JackTokenType::KEYWORD || tokenizer.getCurrentTokenType() == JackTokenType::IDENTIFIER) {
                while (true) {
                        compileType();

                        printIndents();
                        outputFile << "<identifier> " << tokenizer.getCurrentIdentifier() << " </identifier>" << "\n";
                        tokenizer.advance();
                        
                        if (tokenizer.getCurrentSymbol() == ")") break;
                        printIndents();
                        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
                        tokenizer.advance();
                }
        }
        indentLevel--;
        printIndents();
        outputFile << "</parameterList>\n";
}

void CompilationEngine::compileSubroutineBody() {
        printIndents();
        outputFile << "<subroutineBody>\n";
        indentLevel++;
        
        printIndents(); 
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();

        while (tokenizer.getCurrentTokenType() == JackTokenType::KEYWORD) {
                if (tokenizer.getCurrentKeyword() == "var") compileVarDec();
                else compileStatements();           
        }

        printIndents(); 
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();

        indentLevel--;
        printIndents();
        outputFile << "</subroutineBody>\n";
}

void CompilationEngine::compileVarDec() {
        printIndents();
        outputFile << "<varDec>\n";
        indentLevel++;
        
        printIndents(); //print var keyword
        outputFile << "<keyword> " << tokenizer.getCurrentKeyword() << " </keyword>" << "\n";
        tokenizer.advance();

        compileType();

        while (true) {
                printIndents();
                outputFile << "<identifier> " << tokenizer.getCurrentIdentifier() << " </identifier>" << "\n";
                tokenizer.advance();

                printIndents(); //might have to put this section under a check 
                outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
                if (tokenizer.getCurrentSymbol() == ";") break;
                tokenizer.advance();
        }
        tokenizer.advance();

        indentLevel--;
        printIndents();
        outputFile << "</varDec>\n";
}

void CompilationEngine::compileStatements() {
        printIndents();
        outputFile << "<statements>\n";
        indentLevel++;

        while (tokenizer.getCurrentTokenType() == JackTokenType::KEYWORD) {
                switch (string2enumTable[tokenizer.getCurrentKeyword()]) {
                        case JackKeyword::LET:
                                compileLetStatement();
                                break;
                        case JackKeyword::IF:
                                compileIfStatement();
                                break;
                        case JackKeyword::WHILE:
                                compileWhileStatement();
                                break;
                        case JackKeyword::DO:
                                compileDoStatement();
                                break;
                        case JackKeyword::RETURN:
                                compileReturnStatement();
                                break;
                        default:
                                throw std::runtime_error("Token at start of compileStatements NOT of type: keyword");
                                break;
                }
        }
        

        indentLevel--;
        printIndents();
        outputFile << "</statements>\n";
}

void CompilationEngine::compileLetStatement() {
        printIndents();
        outputFile << "<letStatement>\n";
        indentLevel++;

        printIndents(); //print let keyword
        outputFile << "<keyword> " << tokenizer.getCurrentKeyword() << " </keyword>" << "\n";
        tokenizer.advance();

        printIndents(); 
        outputFile << "<identifier> " << tokenizer.getCurrentIdentifier() << " </identifier>" << "\n";
        tokenizer.advance();
        
        if (tokenizer.getCurrentSymbol() == "[") {
                printIndents(); //print array bracket
                outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
                tokenizer.advance();

                compileExpression();

                printIndents();  //print array bracket
                outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
                tokenizer.advance();
        }

        printIndents(); //equals symbol
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();

        compileExpression(); 

        printIndents(); //ending semicolon
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();

        indentLevel--;
        printIndents();
        outputFile << "</letStatement>\n";
}

void CompilationEngine::compileIfStatement() {
        printIndents();
        outputFile << "<ifStatement>\n";
        indentLevel++;

        printIndents(); //print if keyword
        outputFile << "<keyword> " << tokenizer.getCurrentKeyword() << " </keyword>" << "\n";
        tokenizer.advance();

        printIndents(); //print (
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();

        compileExpression();

        printIndents(); //print )
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();

        printIndents(); //print {
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();

        compileStatements();

        printIndents(); //print }
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();

        if (tokenizer.getCurrentTokenType() == JackTokenType::KEYWORD && 
                tokenizer.getCurrentKeyword() == "else") {
                printIndents();
                outputFile << "<keyword> " << tokenizer.getCurrentKeyword() << " </keyword>" << "\n";
                tokenizer.advance();

                printIndents(); // print {
                outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
                tokenizer.advance();

                compileStatements();

                printIndents(); // print }
                outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
                tokenizer.advance();
        }

        indentLevel--;
        printIndents();
        outputFile << "</ifStatement>\n";
}

void CompilationEngine::compileWhileStatement() {
        printIndents();
        outputFile << "<whileStatement>\n";
        indentLevel++;

        printIndents(); //print while
        outputFile << "<keyword> " << tokenizer.getCurrentKeyword() << " </keyword>" << "\n";
        tokenizer.advance();

        printIndents(); // print (
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();

        compileExpression();

        printIndents(); //print )
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();

        printIndents(); //print {
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();

        compileStatements();

        printIndents(); //print }
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();

        indentLevel--;
        printIndents();
        outputFile << "</whileStatement>\n"; 
}

void CompilationEngine::compileDoStatement() {
        printIndents();
        outputFile << "<doStatement>\n";
        indentLevel++;

        printIndents(); //print do
        outputFile << "<keyword> " << tokenizer.getCurrentKeyword() << " </keyword>" << "\n";
        tokenizer.advance();

        Token twoAhead = tokenizer.extraPeak();
        if (twoAhead.value == "(") {
                compileSubroutineCall(false); // Direct call: name(...)
        } else {
                compileSubroutineCall(true); // Object/Class call: name.sub(...)
        }

        printIndents(); //print ;
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();

        indentLevel--;
        printIndents();
        outputFile << "</doStatement>\n"; 
}

void CompilationEngine::compileReturnStatement() {
        printIndents();
        outputFile << "<returnStatement>\n";
        indentLevel++;

        printIndents(); //print return
        outputFile << "<keyword> " << tokenizer.getCurrentKeyword() << " </keyword>" << "\n";
        tokenizer.advance();
        
        if (!(tokenizer.getCurrentTokenType() == JackTokenType::SYMBOL && 
                tokenizer.getCurrentSymbol() == ";")) {
                compileExpression();
        } 

        printIndents(); //print ;
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();

        indentLevel--;
        printIndents();
        outputFile << "</returnStatement>\n";  
}

void CompilationEngine::compileExpression() {
        printIndents();
        outputFile << "<expression>\n";
        indentLevel++;

        compileTerm();

        while(isBinaryOp()) { //expression ending early????
                printIndents(); 
                outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
                tokenizer.advance();

                compileTerm();
        }

        indentLevel--;
        printIndents();
        outputFile << "</expression>" << "\n";  
}

void CompilationEngine::compileTerm() {
        printIndents();
        outputFile << "<term>\n";
        indentLevel++;
        Token twoAhead;

        switch (tokenizer.getCurrentTokenType()) {
                case JackTokenType::IDENTIFIER:
                        twoAhead = tokenizer.extraPeak();
                        if (twoAhead.value == "[") {
                                printIndents();
                                outputFile << "<identifier> " << tokenizer.getCurrentIdentifier() << " </identifier>" << "\n"; //print array name
                                tokenizer.advance();

                                printIndents();
                                outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
                                tokenizer.advance();

                                compileExpression();

                                printIndents();
                                outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
                                tokenizer.advance();
                        } else if (twoAhead.value == "(") {
                                //subroutineCall first form: Function Call
                                compileSubroutineCall(false);
                        } else if (twoAhead.value == ".") {
                                //subroutineCall second form: Method Call (clas member function)
                                compileSubroutineCall(true);
                        } else {
                                printIndents(); 
                                outputFile << "<identifier> " << tokenizer.getCurrentIdentifier() << " </identifier>" << "\n";
                                tokenizer.advance();
                        }
                        break;
                case JackTokenType::INT_CONST:
                        printIndents();
                        outputFile << "<integerConstant> " << tokenizer.getCurrentInt() << " </integerConstant>" << "\n";
                        tokenizer.advance();
                        break;
                case JackTokenType::STRING_CONST:
                        printIndents();
                        outputFile << "<stringConstant> " << tokenizer.getCurrentString() << " </stringConstant>" << "\n";
                        tokenizer.advance();
                        break;
                case JackTokenType::KEYWORD:
                        printIndents();
                        outputFile << "<keyword> " << tokenizer.getCurrentKeyword() << " </keyword>" << "\n";
                        tokenizer.advance();
                        break;
                case JackTokenType::SYMBOL:
                                std::string s = tokenizer.getCurrentSymbol();
                                if (s == "(") {
                                        // Handle ( expression )
                                        printIndents();
                                        outputFile << "<symbol> "<< tokenizer.getCurrentSymbol() <<" </symbol>\n";
                                        tokenizer.advance();

                                        compileExpression();

                                        printIndents();
                                        outputFile << "<symbol> "<< tokenizer.getCurrentSymbol() <<" </symbol>\n";
                                        tokenizer.advance();
                                }
                                else if (s == "-" || s == "~") {
                                        // Handle unaryOp term
                                        printIndents();
                                        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>\n";
                                        tokenizer.advance();

                                        compileTerm(); // Recursive call to get the term being negated
                                }
                                break;
        }

        indentLevel--;
        printIndents();
        outputFile << "</term>\n";  
}

int CompilationEngine::compileExpressionList() {
        int expressionCount = 0;
        printIndents();
        outputFile << "<expressionList>\n";
        indentLevel++;
        
        if (tokenizer.getCurrentTokenType() != JackTokenType::SYMBOL || 
           (tokenizer.getCurrentTokenType() == JackTokenType::SYMBOL && tokenizer.getCurrentSymbol() != ")") ) {
                compileExpression();
                expressionCount++;

                while (tokenizer.getCurrentSymbol() == ",") {
                        printIndents();
                        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>\n";
                        tokenizer.advance();

                        compileExpression();
                        expressionCount++;
                } 
        }
        indentLevel--;
        printIndents();
        outputFile << "</expressionList>" << "\n"; 
        return expressionCount;  
}

void CompilationEngine::compileSubroutineCall(bool isMethod) {
        //SHOULD BE GOOD, THINK ERROR IN expressionList/expression

        printIndents(); // print identifier itself (either function name for function call or object for method)
        outputFile << "<identifier> " << tokenizer.getCurrentIdentifier() << " </identifier>" << "\n";
        tokenizer.advance();

        printIndents(); // open paren for function, prints . for method
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();

        if (isMethod) {
                printIndents(); // print identifier for subroutine
                outputFile << "<identifier> " << tokenizer.getCurrentIdentifier() << " </identifier>" << "\n";
                tokenizer.advance();

                printIndents(); // print (
                outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
                tokenizer.advance();
        }

        compileExpressionList();

        printIndents(); // close paren
        outputFile << "<symbol> " << tokenizer.getCurrentSymbol() << " </symbol>" << "\n";
        tokenizer.advance();
}


bool CompilationEngine::isBinaryOp() {
    if (tokenizer.getCurrentTokenType() != JackTokenType::SYMBOL) return false;
    std::string s = tokenizer.getCurrentSymbol(); 
    return (s == "+" || s == "-" || s == "*" || s == "/" || s == "&amp;" || 
            s == "|" || s == "&lt;" || s == "&gt;" || s == "=");
}
