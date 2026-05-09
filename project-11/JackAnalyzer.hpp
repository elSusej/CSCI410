#ifndef JACK_ANALYZER_HPP
#define JACK_ANALYZER_HPP

#include <iostream>
#include <fstream>
#include <filesystem>
#include <vector>
#include <regex>
#include <map> 

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

enum class SymbolKind { STATIC, FIELD, ARG, VAR, NONE }; //refers to segment in VM code

struct SymbolEntry {
    std::string type; // int, char, boolean, or className
    SymbolKind kind; //where in mem?
    int index;        // The 0-based offset within its kind (local 0, local 1 type shit)
};

class SymbolTable {
public:
    SymbolTable();

    // Clears the subroutine-level map and resets ARG/VAR counters
    void startSubroutine(); 

    // Defines/adds a new identifier to appropriate symbol table
    void define(const std::string& name, const std::string& type, SymbolKind kind);

    // Returns the number of variables of a specific kind (needed for numLocals in VM)
    int varCount(SymbolKind kind) { return counters[kind]; }

    // Getters for usage in expressions/statements
    SymbolKind kindOf(const std::string& name);
    std::string typeOf(const std::string& name);
    int indexOf(const std::string& name);

private:
    std::map<std::string, SymbolEntry> classScope;
    std::map<std::string, SymbolEntry> subroutineScope;
    std::map<SymbolKind, int> counters; // Tracks current index for STATIC, FIELD, ARG, VAR
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
                std::string compileType();
                void compileParameterList();
                void compileSubroutineBody(JackKeyword subroutineType, std::string subroutineName);
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
                bool isBinaryOp();
                std::string getSegment(const std::string& name);
                JackTokenizer& tokenizer;
                std::ofstream& outputFile;
                SymbolTable symbolTable;
                std::string currentClassName;
};

#endif