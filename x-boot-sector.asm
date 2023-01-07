mov ah, 0x0e


; attempting to print 'X' that exists in memory
; first attempt
mov al, the_secret
int 0x10

; second attempt
mov al, [the_secret]
int 0x10

; third attempt
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

; fourth attempt
mov al, [0x7c1e]
int 0x10

jmp $ ; infinite loop

the_secret:
db "X"

; padding/magic number
times 510-($-$$) db 0
dw 0xaa55