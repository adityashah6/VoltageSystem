#!/bin/bash
#
# Name: "run.sh"
#
# Description: This file compiles, links, and runs the program.
#
# Author: Aditya Shah
#         adityashah@csu.fullerton.edu
#
#                     GNU GENERAL PUBLIC LICENSE
#                        Version 3, 29 June 2007
#
#  Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
#  Everyone is permitted to copy and distribute verbatim copies
#  of this license document, but changing it is not allowed.

 
gcc -c -Wall -m64 -no-pie -o faraday.o faraday.c -std=c11

nasm -f elf64 -l ohm.lis -o ohm.o ohm.asm

gcc -m64 -no-pie -o a.out -std=c++17 faraday.o ohm.o

rm *.o
rm *.lis

echo "PROGRAM START"
./a.out
echo "PROGRAM END"

echo "End Script"
rm *.out

# Copyright 2021 Aditya Shah
