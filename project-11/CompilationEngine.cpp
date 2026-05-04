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
        tokenizer.advance(); //class Keyword appears first
        currentClassName = tokenizer.getCurrentIdentifier(); //store className
        tokenizer.advance(); 
        tokenizer.advance(); // Followed by {

        while (tokenizer.getCurrentTokenType() == JackTokenType::KEYWORD && 
                (tokenizer.getCurrentKeyword() == "static" || tokenizer.getCurrentKeyword() == "field")) {
                compileClassVarDec();
        }

        while (tokenizer.getCurrentTokenType() == JackTokenType::KEYWORD && 
                (tokenizer.getCurrentKeyword() == "method" || tokenizer.getCurrentKeyword() == "function" ||
                tokenizer.getCurrentKeyword() == "constructor")) {
                compileSubroutine();
        }

        tokenizer.advance(); //consume the closing } of the class
}

void CompilationEngine::compileClassVarDec() {
        SymbolKind kind;
        if (tokenizer.getCurrentKeyword() == "static") {
                kind = SymbolKind::STATIC;
        } else {
                kind = SymbolKind::FIELD;
        }

        tokenizer.advance(); //consume static|field keyword
        std::string type = compileType();

        while (true) {
                std::string name = tokenizer.getCurrentIdentifier();
                symbolTable.define(name, type, kind); //add to symbol table
                tokenizer.advance();

                if (tokenizer.getCurrentSymbol() == ";") {
                        tokenizer.advance(); //consume ;
                        break;
                } else {
                        tokenizer.advance(); //consume ,
                }
        }
}

void CompilationEngine::compileSubroutine() {
        symbolTable.startSubroutine(); //reset subroutine scope and ARG/VAR counters for new subroutine

        JackKeyword subroutineType = string2enumTable[tokenizer.getCurrentKeyword()];
        tokenizer.advance(); //consume constructor|function|method keyword
        std::string returnType = compileType(); //return type, can be void or primitive type or class name
        std::string subroutineName = tokenizer.getCurrentIdentifier();
        tokenizer.advance(); //consume subroutineName
        if (subroutineType == JackKeyword::METHOD) {
                symbolTable.define("this", currentClassName, SymbolKind::ARG); //methods have an implicit first argument 'this' that must be added before compileParameterList
        }

        tokenizer.advance(); //consume (
        compileParameterList(); 
        tokenizer.advance(); //consume )
        compileSubroutineBody(subroutineType, subroutineName); //compileSubroutineBody needs to know whether method/constructor/fxn and name of subroutine for VM code gen
}

std::string CompilationEngine::compileType() {
        std::string type;
        switch(tokenizer.getCurrentTokenType()) {
                case JackTokenType::KEYWORD:
                        type = tokenizer.getCurrentKeyword();
                        break;
                case JackTokenType::IDENTIFIER:
                        type = tokenizer.getCurrentIdentifier();
                        break;
                default:
                        throw std::runtime_error("Token at start of compileType NOT of type: keyword|identifier");
                        
        }
        tokenizer.advance();
        return type;
}

void CompilationEngine::compileParameterList() {

        if (tokenizer.getCurrentTokenType() == JackTokenType::SYMBOL &&
            tokenizer.getCurrentSymbol() == ")") { //parameterlist is empty
                return;
        }

        while (true) {
                std::string type = compileType();
                std::string name = tokenizer.getCurrentIdentifier();
                symbolTable.define(name, type, SymbolKind::ARG); //add to LOCAL symbol table ?
                tokenizer.advance();

                if (tokenizer.getCurrentSymbol() == ")") {
                        break;
                } else { 
                        tokenizer.advance(); //consume ,
                }
        }
}

void CompilationEngine::compileSubroutineBody(JackKeyword subroutineType, std::string subroutineName) {
        tokenizer.advance(); //consume {

        while (tokenizer.getCurrentTokenType() == JackTokenType::KEYWORD && 
                tokenizer.getCurrentKeyword() == "var") {
                compileVarDec();
        }

        int numLocals = symbolTable.varCount(SymbolKind::VAR); //args not included, but num of local vars needed for function dec in VM code
        switch(subroutineType) {
                case JackKeyword::CONSTRUCTOR:
                        outputFile << "function " << currentClassName << "." << subroutineName << " " << numLocals << "\n"; //numLocals is what?
                        outputFile << "push constant " << symbolTable.varCount(SymbolKind::FIELD) <<  "\n"; //push number of fields onto stack 
                        outputFile << "call Memory.alloc 1\n";
                        outputFile << "pop pointer 0\n"; //set this to base address of new
                        break;
                case JackKeyword::FUNCTION:
                        outputFile << "function " << currentClassName << "." << subroutineName << " " << numLocals << "\n"; //numLocals is what?
                        break;
                case JackKeyword::METHOD:
                        outputFile << "function " << currentClassName << "." << subroutineName << " " << numLocals << "\n"; //numLocals is what?
                        outputFile << "push argument 0\n"; //push 'this' onto stack
                        outputFile << "pop pointer 0\n";
                        break;
                default:
                        throw std::runtime_error("Subroutine type not constructor, function, or method");
        }
        
        compileStatements();    
        tokenizer.advance(); //consume the closing } of the subroutine body
}

void CompilationEngine::compileVarDec() {
        tokenizer.advance(); //consume var keyword
        std::string type = compileType();

        while (true) {
                std::string name = tokenizer.getCurrentIdentifier();
                symbolTable.define(name, type, SymbolKind::VAR); //add to symbol table
                tokenizer.advance();

                if (tokenizer.getCurrentSymbol() == ";") {
                        tokenizer.advance(); //consume ;
                        break;
                } else {
                        tokenizer.advance(); //consume ,
                }
        }
}

void CompilationEngine::compileStatements() {
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
                                throw std::runtime_error("Token at start of compileStatements NOT: let|if|while|do|return");
                                break;
                }
        }
}

void CompilationEngine::compileLetStatement() {
        tokenizer.advance(); //consume let
        std::string varName = tokenizer.getCurrentIdentifier(); 
        tokenizer.advance(); //consume var name
        bool isArray = false;
        
        if (tokenizer.getCurrentSymbol() == "[") {
                isArray = true;
                tokenizer.advance(); //consume [
                compileExpression(); //pushes index on to stack
                outputFile << "push " << getSegment(varName) << "\n"; //push base address of array onto stack, ie "push segment index" in VM
                outputFile << "add\n"; //add index to base address to get target address, leave it on stack
                tokenizer.advance(); //consume ]
        }
        tokenizer.advance(); //consume =
        compileExpression(); //pushes result of RHS onto stack

        if (isArray) { //stack has RHS result on top of target address
                outputFile << "pop temp 0\n"; //pop value of RHS expression into temp 0
                outputFile << "pop pointer 1\n"; //pop target address into THAT 
                outputFile << "push temp 0\n"; //push value of expression back onto stack
                outputFile << "pop that 0\n"; //pop value of expression into *target address
        } else outputFile << "pop " << getSegment(varName) << "\n"; //pop result of expression into variable, getSegment returns "segment index" for that var name
        tokenizer.advance(); //consume ;
}

void CompilationEngine::compileIfStatement() {
        static int ifLabelCounter = -1; //counter to create unique labels for each if statement
        int currentIfLabel = ++ifLabelCounter; //store current value of counter for use in labels in this if statement, while increment counter for next if statement
        //currentIflabel will remain the same for this if statement, but iflabelCounter is incremented for nested if statements so all if labels are unique
        tokenizer.advance(); //consume if
        tokenizer.advance(); //consume (

        compileExpression();

        tokenizer.advance(); //consume )

        outputFile << "not\n"; //negate condition, since VM goto is goto-if-true but we want to jump to else/endif if condition is false
        outputFile << "if-goto IF_FALSE_" << currentIfLabel << "\n";
        tokenizer.advance(); //consume {

        compileStatements();

        outputFile << "goto IF_END_" << currentIfLabel << "\n"; //jump past else block at end of if block
        outputFile << "label IF_FALSE_" << currentIfLabel << "\n"; //label for start of else block (or end of if block if no else)
        tokenizer.advance(); //consume }

        if (tokenizer.getCurrentTokenType() == JackTokenType::KEYWORD && 
                tokenizer.getCurrentKeyword() == "else") {
                tokenizer.advance(); //consume else
                tokenizer.advance(); //consume {

                compileStatements();

                tokenizer.advance(); //consume }
        }

        outputFile << "label IF_END_" << currentIfLabel << "\n"; //label for end of if statement, target of goto at end of if block
}

void CompilationEngine::compileWhileStatement() {
        static int whileLabelCounter = -1; //counter to create unique labels for each while loop
        int currentWhileLabel = ++whileLabelCounter; //store current value of counter for use in labels in this while statement, while increment counter for next while statement
        outputFile << "label WHILE_" << currentWhileLabel << "\n"; //label for start of while loop condition
        tokenizer.advance(); //consume while
        tokenizer.advance(); //consume (

        compileExpression();
        outputFile << "not\n"; //negate condition, since VM goto is goto-if-true but we want to jump out of loop if condition is false
        outputFile << "if-goto WHILE_END_" << currentWhileLabel << "\n";

        tokenizer.advance(); //consume )
        tokenizer.advance(); //consume {

        compileStatements();

        outputFile << "goto WHILE_" << currentWhileLabel << "\n"; //jump back to start of loop to re-evaluate condition
        outputFile << "label WHILE_END_" << currentWhileLabel << "\n"; //label for end of while loop
        tokenizer.advance(); //consume }
}

void CompilationEngine::compileDoStatement() {
        tokenizer.advance(); //consume do 

        Token twoAhead = tokenizer.extraPeak();
        if (twoAhead.value == "(") {
                compileSubroutineCall(false); // Direct call: sub(...)
        } else {
                compileSubroutineCall(true); //  Method OR Function call: name.sub(...)
        }
        outputFile << "pop temp 0\n"; //discard return value for do statements
        tokenizer.advance(); //consume ;
}

void CompilationEngine::compileReturnStatement() {
        tokenizer.advance(); //consume return keyword
        
        if (!(tokenizer.getCurrentTokenType() == JackTokenType::SYMBOL && 
                tokenizer.getCurrentSymbol() == ";")) {
                compileExpression();
        } else outputFile << "push constant 0\n"; //void return
        tokenizer.advance(); //consume ;
        outputFile << "return\n"; 
}

void CompilationEngine::compileExpression() {
        compileTerm();

        while(isBinaryOp()) { 
                std::string op = tokenizer.getCurrentSymbol();
                tokenizer.advance(); //consume binary op symbol
                compileTerm();

                if (op == "+") outputFile << "add\n";
                else if (op == "-") outputFile << "sub\n";
                else if (op == "*") outputFile << "call Math.multiply 2\n";
                else if (op == "/") outputFile << "call Math.divide 2\n";
                else if (op == "&") outputFile << "and\n"; 
                else if (op == "|") outputFile << "or\n";
                else if (op == "<") outputFile << "lt\n";
                else if (op == ">") outputFile << "gt\n";
                else if (op == "=") outputFile << "eq\n"; 
                else throw std::runtime_error("Unknown binary operator: " + op);
        }
}       

void CompilationEngine::compileTerm() {
        Token twoAhead;

        switch (tokenizer.getCurrentTokenType()) {
                case JackTokenType::IDENTIFIER: {
                        twoAhead = tokenizer.extraPeak();
                        if (twoAhead.value == "[") {
                                std::string arrayName = tokenizer.getCurrentIdentifier();
                                tokenizer.advance(); //consume array name
                                tokenizer.advance(); //consume [
                                compileExpression(); //push value of index expression onto stack

                                outputFile << "push " << getSegment(arrayName) << "\n"; //push base address of array onto stack, ie "push segment index" in VM
                                
                                outputFile << "add\n";
                                outputFile << "pop pointer 1\n"; //pop computed address into THAT
                                outputFile << "push that 0\n"; //push value at THAT (base address + index) onto stack
                                
                                tokenizer.advance(); //consume ]
                        } else if (twoAhead.value == "(") {
                                //subroutineCall first form: sub(...)
                                compileSubroutineCall(false);
                        } else if (twoAhead.value == ".") {
                                //subroutineCall second form: Method OR Function Call name.sub(...)
                                compileSubroutineCall(true);
                        } else { //just a var, push it
                                outputFile << "push " << getSegment(tokenizer.getCurrentIdentifier()) << std::endl; //push variable onto stack
                                tokenizer.advance(); //consume var name
                        }
                        break;
                        }
                case JackTokenType::INT_CONST:
                        outputFile << "push constant " << tokenizer.getCurrentInt() << "\n";
                        tokenizer.advance();
                        break;
                case JackTokenType::STRING_CONST: {
                        std::string str = tokenizer.getCurrentString();
                        outputFile << "push constant " << str.length() << "\n";
                        outputFile << "call String.new 1\n"; //create new string of appropriate length
                        for (char c : str) {
                                outputFile << "push constant " << static_cast<int>(c) << "\n";
                                outputFile << "call String.appendChar 2\n"; //append each char to str
                        }
                        tokenizer.advance();
                        break;
                        }
                case JackTokenType::KEYWORD: {
                        std::string keyword = tokenizer.getCurrentKeyword();
                        if (keyword == "true") {
                                outputFile << "push constant 0\n"; //true is represented as -1 in VM, which is 0 with bits flipped
                                outputFile << "not\n";
                        } else if (keyword == "false" || keyword == "null") {
                                outputFile << "push constant 0\n"; //false and null are both represented as 0 in VM
                        } else if (keyword == "this") {
                                outputFile << "push pointer 0\n"; //push base address of current object onto stack
                        } else {
                                throw std::runtime_error("compileTerm: Keyword constant not true, false, null, or this");
                        }
                        tokenizer.advance(); //consume keyword constant
                        break;
                        }
                case JackTokenType::SYMBOL: {
                                std::string s = tokenizer.getCurrentSymbol();
                                if (s == "(") {
                                        // Handle ( expression )
                                        tokenizer.advance(); //consume (
                                        compileExpression();
                                        tokenizer.advance(); //consume )
                                }
                                else if (s == "-" || s == "~") {
                                        // Handle unaryOp term
                                        tokenizer.advance(); //consume unary op symbol
                                        compileTerm(); // Recursive call to get the term being negated
                                        outputFile << (s == "-" ? "neg\n" : "not\n"); 
                                }
                                break;
                                }
        }
}

int CompilationEngine::compileExpressionList() {
        int expressionCount = 0;
        
        if (tokenizer.getCurrentTokenType() != JackTokenType::SYMBOL || 
           (tokenizer.getCurrentTokenType() == JackTokenType::SYMBOL && tokenizer.getCurrentSymbol() != ")") ) {
                compileExpression();
                expressionCount++;

                while (tokenizer.getCurrentSymbol() == ",") {
                        tokenizer.advance(); //consume ,
                        compileExpression();
                        expressionCount++;
                } 
        }
        return expressionCount;  
}

void CompilationEngine::compileSubroutineCall(bool hasDot) {
        std::string firstIdentifier = tokenizer.getCurrentIdentifier(); //store subroutineName for case 1, will be className/varName for case 2/3
        tokenizer.advance(); //consume subroutineName or className or varName
        tokenizer.advance(); //consume ( for function call, consume . for method call
        int numExpressions = 0;
        std::string vmFunctionName;

        if (!hasDot) { //this is guaranteed to be a method!
                outputFile << "push pointer 0\n";
                vmFunctionName = currentClassName + "." + firstIdentifier; //method with no dot must be method of current class
                numExpressions++; //+1 for implicit 'this' argument
        } else {
                std::string secondIdentifier = tokenizer.getCurrentIdentifier(); //get subroutine name, since first identifier was className/varName
                tokenizer.advance(); //consume subroutine name
                tokenizer.advance(); //consume ( before expression list
                if (symbolTable.indexOf(firstIdentifier) != -1) { //if identifier in symbol table, must not be function but subroutine call on member var (implicit object needs pushing)
                        outputFile << "push " << getSegment(firstIdentifier); //push object named firstIdentifier onto stack as implicit argument 0
                        outputFile << "     // push object named " << firstIdentifier << "\n";
                        numExpressions++; //+1 for implicit 'this' argument
                        vmFunctionName = symbolTable.typeOf(firstIdentifier);

                } else vmFunctionName = firstIdentifier; //identifier not in symbol table, must be className case w/no implict object
                vmFunctionName += ("." + secondIdentifier);
        }

        numExpressions += compileExpressionList();
        outputFile << "call " << vmFunctionName << " " << numExpressions << "\n"; //numExpressions is what?
        tokenizer.advance(); //consume )
}


bool CompilationEngine::isBinaryOp() {
    if (tokenizer.getCurrentTokenType() != JackTokenType::SYMBOL) return false;
    std::string s = tokenizer.getCurrentSymbol(); 
    return (s == "+" || s == "-" || s == "*" || s == "/" || s == "&" || 
            s == "|" || s == "<" || s == ">" || s == "=");
}

std::string CompilationEngine::getSegment(const std::string& name) {
    SymbolKind kind = symbolTable.kindOf(name);
    int index = symbolTable.indexOf(name);
    std::string segment;
    switch (kind) {
        case SymbolKind::STATIC: segment = "static"; break;
        case SymbolKind::FIELD:  segment = "this";   break;
        case SymbolKind::ARG:    segment = "argument"; break;
        case SymbolKind::VAR:    segment = "local"; break;
        default: throw std::runtime_error("Unknown symbol kind");
    }
    return segment + " " + std::to_string(index);
}
