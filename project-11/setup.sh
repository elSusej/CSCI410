#!/bin/bash

# Compile JackAnalyzer.cpp into executable "JackAnalyzer"

g++ -std=c++17 -Wall -Wextra -g -O0 \
    -o JackCompiler \
    JackAnalyzer.cpp \
    JackTokenizer.cpp \
    SymbolTable.cpp \
    CompilationEngine.cpp

if [ $? -eq 0 ]; then
    echo "Build successful: ./JackCompiler"
else
    echo "Build failed."
fi