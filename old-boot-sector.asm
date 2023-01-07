mov ah, 0x0e ; int 10/ah = 0eh -> call the scrolling teletype BIOS routine

mov al, 'H' ; put 'H' into register al
int 0x10 ; software interrupt (system call) to BIOS 10H -> writes the character in AL to the console
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
int 0x10
mov al, 'o'
int 0x10
mov al, ','
int 0x10
mov al, ' '
int 0x10
mov al, 'w'
int 0x10
mov al, 'o'
int 0x10
mov al, 'r'
int 0x10
mov al, 'l'
int 0x10
mov al, 'd'
int 0x10
mov al, '!'
int 0x10

jmp $ ; infinite loop (repeatedly jumps to current address)

times 510 - ($-$$) db 0 ; 0 padding until the last 2 bytes
dw 0xaa55 ; magic number for boot sector