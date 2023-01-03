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

This is the most barebones boot sector you can get. It's 512 bytes, and the last 2 bytes are what determines if the disc is bootable. The last 2 bytes of the boot sector must be xAA55 (it's reverse in the picture above because of endianess). You can actually view the binary content of files in VS Code (which is what this snippet is) through VS Code's Hex Editor extension -- it's pretty cool.