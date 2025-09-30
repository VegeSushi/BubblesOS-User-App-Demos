#!/bin/bash

mkdir -p out

cd out

nasm -f bin ../hello.asm -o HELLO.BIN
nasm -f bin ../count.asm -o COUNT.BIN
