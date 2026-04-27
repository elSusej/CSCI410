#ifndef JACK_ANALYZER_HPP
#define JACK_ANALYZER_HPP

#include <iostream>
#include <fstream>
#include <filesystem>
#include <vector>
#include <regex>
#include <map> //for xml markup replacements

inline std::map <std::string, std::string> xmlJackReplacements = { //inline make it so this definition isn't copied over to the start of every source cpp file
        {"<", "&lt;"},
        {">", "&gt;"},
        {"\"", "&quot;"},
        {"&", "&amp;"}
};

enum class JackTokenType { 
        KEYWORD,
        SYMBOL,
        IDENTIFIER,
        INT_CONST,
        STRING_CONST
};

struct Token {
        std::string value;
        JackTokenType type;
};

enum class JackKeyword { //class is more strictly scope
        CLASS,
        METHOD,
        FUNCTION,
        CONSTRUCTOR,
        INT,
        BOOLEAN,
        CHAR,
        VOID,
        VAR,
        STATIC,
        FIELD,
        LET,
        DO,
        IF,
        ELSE,
        WHILE,
        RETURN,
        TRUE,
        FALSE,
        NULL_KEYWORD, 
        THIS
};

inline std::map<std::string, JackKeyword> string2enumTable {
        {"class", JackKeyword::CLASS},
        {"constructor", JackKeyword::CONSTRUCTOR},
        {"function", JackKeyword::FUNCTION},
        {"method", JackKeyword::METHOD},
        {"field", JackKeyword::FIELD},
        {"static", JackKeyword::STATIC},
        {"var", JackKeyword::VAR},
        {"int", JackKeyword::INT},
        {"char", JackKeyword::CHAR},
        {"boolean", JackKeyword::BOOLEAN},
        {"void", JackKeyword::VOID},
        {"true", JackKeyword::TRUE},
        {"false", JackKeyword::FALSE},
        {"null", JackKeyword::NULL_KEYWORD},
        {"this", JackKeyword::THIS},
        {"let", JackKeyword::LET},
        {"do", JackKeyword::DO},
        {"if", JackKeyword::IF},
        {"else", JackKeyword::ELSE},
        {"while", JackKeyword::WHILE},
        {"return", JackKeyword::RETURN}
};

class JackTokenizer {
        public:
                JackTokenizer(std::ifstream& inputFile);
                bool hasMoreTokens();
                void advance();
                JackTokenType getCurrentTokenType();
                std::string getCurrentKeyword();
                std::string getCurrentSymbol();
                std::string getCurrentIdentifier();
                int getCurrentInt();
                std::string getCurrentString();
                struct Token extraPeak();
        private:
                std::vector<Token> tokens;
                size_t currentTokenIndex = -1;
};

class CompilationEngine {
        public:
                CompilationEngine(JackTokenizer& tokenizer, std::ofstream& outputFile);
        private:
                void compileClass();
                void compileClassVarDec();
                void compileSubroutine();
                void compileType();
                void compileParameterList();
                void compileSubroutineBody();
                void compileVarDec();
                void compileStatements();
                void compileLetStatement();
                void compileIfStatement();
                void compileWhileStatement();
                void compileDoStatement();
                void compileReturnStatement();
                void compileExpression(); //special, calls term
                void compileTerm(); //special, not LL(1)
                void compileSubroutineCall(bool isMethod);
                int compileExpressionList();
                void printIndents() {for(int i = 0; i < indentLevel; i++) outputFile << "  ";};
                bool isBinaryOp();
                JackTokenizer& tokenizer;
                std::ofstream& outputFile;
                int indentLevel = 0;
};

#endif