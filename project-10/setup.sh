#!/bin/bash

# Compile JackAnalyzer.cpp into executable "JackAnalyzer"

g++ -std=c++17 -Wall -Wextra -g -O0 \
    -o JackAnalyzer \
    JackAnalyzer.cpp \
    JackTokenizer.cpp \
    CompilationEngine.cpp

if [ $? -eq 0 ]; then
    echo "Build successful: ./JackAnalyzer"
else
    echo "Build failed."
fi