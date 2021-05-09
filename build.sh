#!/bin/sh

i386-elf-as -msyntax=intel -mmnemonic=intel boot.s -o boot.o
i386-elf-gcc -c vga.c -ffreestanding -o vga.o
i386-elf-ld -T linker.ld boot.o vga.o -o kernel.bin 
