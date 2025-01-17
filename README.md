# BasicBoot

BasicBoot is a simple bootloader project written in x86 assembly language. It was created to help me understand NASM better and improve my assembly programming skills.

## Features

- Boot from disk
- Load a kernel into memory
- Display a text message on the screen

## Purpose

The main goal of BasicBoot is to demonstrate the basics of bootloading in a real-mode environment. It showcases how to load a kernel from disk and output text to the screen, which are fundamental concepts in operating system development.

## Usage

To build and test BasicBoot, follow these steps:

1. Assemble the bootloader:
   ```bash
   nasm -f bin basicboot.asm -o basicboot.bin
   ```

2. Assemble the text module:
   ```bash
   nasm -f bin text.asm -o text.bin
   ```

3. Combine the binary files into a bootable image:
   ```bash
   cat basicboot.bin text.bin > boot.img
   ```

4. Run the bootable image using QEMU:
   ```bash
   qemu-system-x86_64 -drive format=raw,file=boot.img
   ```
