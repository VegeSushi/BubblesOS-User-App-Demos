#!/bin/bash

mkdir -p out

cd out

nasm -f bin ../src/guess.asm -o GUESS.BIN
nasm -f bin ../src/hello.asm -o HELLO.BIN
nasm -f bin ../src/count.asm -o COUNT.BIN
