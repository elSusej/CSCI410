#!/bin/bash

# Compile VMTranslator.cpp into executable "VMTranslator"

g++ -std=c++17 -Wall -Wextra -g -O0 \
    -o VMTranslator VMTranslator.cpp

if [ $? -eq 0 ]; then
    echo "Build successful: ./VMTranslator"
else
    echo "Build failed."
fi