#!/bin/bash

echo "Starting Joypad compilation...."
java -jar ~/bin/KickAss.jar joypad.asm

echo "Launching Commodore 64 emulator (VICE)..."
open joypad.prg