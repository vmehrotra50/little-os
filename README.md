# little-os

Trying some kernel development :)

Using the following as a tutorial:
- https://github.com/cfenollosa/os-tutorial/tree/master/01-bootsector-barebones
- https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf

# Notes
## The Boot Sector

Boot Sector: the portion of a disk which contains machine code to be loaded into RAM and executed by BIOS.
- Basic Input/Output System (BIOS): ROM chip that provides a basic interface to the computer

The most basic boot sector:
![image](media/basic-boot-sector.png)

- This is the most barebones boot sector you can get. It's 512 bytes, and the last 2 bytes are what determines if the disc is bootable. The last 2 bytes of the boot sector must be xAA55 (it's reverse in the picture above because of endianess). You can actually view the binary content of files in VS Code (which is what this snippet is) through VS Code's Hex Editor extension -- it's pretty cool.
- The file is in `boot-sector.bin` and can be run with QEMU using `qemu boot-sector.bin`.
- I found an issue running the above `qemu` command with an M1 Mac, and I quickly realized it was because QEMU only natively supports ARM architectures. So, the machine would boot, but it wouldn't be able to run the assembly (because it was x86 assembly, of course).
  - I had an idea -- QEMU may not natively support x86 emulators, but UTM does. So, I set up a virtual machine on UTM that runs a standard x86 architecture. Within UTM, I could strip all of the default arguments genereated for QEMU by UTM and add `boot-sector.bin` as a parameter. And there we have it: a running boot sector :)

  ![image](media/vm-working.png)
  ![image](media/boot-sector-running.png)

  - Just a note, for this one instead of directly editing the hex value in `boot-sector.bin`, I used assembly code found in the toturials and generated `boot-sector.bin` with NASM. Inspecting it with the Hex editor, it changed a bit, but the magic number stayed at the end of the file.
  - But anyway, this is awesome -- a running boot sector. Kinda glad I took CS 2200 to help with debugging...
