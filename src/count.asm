; count.asm
org 0x0        ; raw binary start

start:
    mov cx, 20      ; loop counter
    xor bx, bx      ; BX = counter value (0..9)

count_loop:
    mov ax, bx
    call print_number
    call print_newline

    inc bx
    loop count_loop

    ret             ; return to kernel

; -------------------------------
; Print number in decimal (0..65535)
; Input: AX = number
print_number:
    push ax
    push bx
    push cx
    push dx
    push si

    mov si, 10      ; divisor
    xor cx, cx      ; digit counter
    xor bx, bx      ; store digits in reverse

convert_loop:
    xor dx, dx
    div si          ; AX / 10 -> AX quotient, DX remainder
    push dx
    inc cx
    test ax, ax
    jnz convert_loop

print_digits:
    pop dx
    add dl, '0'
    mov ah, 0x0E
    mov al, dl
    int 0x10
    loop print_digits

    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

; -------------------------------
; Print newline (CR + LF)
print_newline:
    mov ah, 0x0E
    mov al, 0x0D
    int 0x10
    mov al, 0x0A
    int 0x10
    ret
