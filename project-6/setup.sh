#!/bin/bash

# Compile Assembler.cpp into executable "Assembler"

g++ -std=c++17 -Wall -Wextra -g -O0 \
    -o Assembler Assembler.cpp

if [ $? -eq 0 ]; then
    echo "Build successful: ./Assembler"
else
    echo "Build failed."
fi