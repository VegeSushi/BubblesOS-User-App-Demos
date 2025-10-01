org 0x0

start:
    ; Get timer and randomize
    mov ah, 00h
    int 1Ah
    mov al, dh
    mov bl, 10
    xor ah, ah
    div bl
    mov [rand_num], al

.loop:
    ; Print new line
    mov ah, 0Eh
    mov al, 0Dh
    int 10h
    mov al, 0Ah
    int 10h

    ; Get input
    mov ah, 00h
    int 16h        ; AL = key pressed
    mov [user_num], al   ; store ASCII key

    ; Convert user input to numeric
    mov al, [user_num]
    sub al, '0'
    mov [user_num], al

    ; Compare
    mov al, [user_num]
    mov bl, [rand_num]
    cmp al, bl
    ja .greater
    jb .lower
    je .equal

    ret

.greater:
    ; Print the user number
    mov al, [user_num]
    ; convert to ASCII
    add al, '0'
    mov ah, 0Eh
    mov bh, 0
    mov bl, 0x0F
    int 10h

    mov ah, 0Eh
    mov al, '>'
    mov bh, 0
    mov bl, 0x0F
    int 10h

    ; Print X
    mov ah, 0Eh
    mov al, 'X'
    mov bh, 0
    mov bl, 0x0F
    int 10h

    jmp .loop

.lower:
    ; Print the user number
    mov al, [user_num]
    ; convert to ASCII
    add al, '0'
    mov ah, 0Eh
    mov bh, 0
    mov bl, 0x0F
    int 10h

    mov ah, 0Eh
    mov al, '<'
    mov bh, 0
    mov bl, 0x0F
    int 10h

    ; Print X
    mov ah, 0Eh
    mov al, 'X'
    mov bh, 0
    mov bl, 0x0F
    int 10h

    jmp .loop

.equal:
    ; Print the user number
    mov al, [user_num]
    ; convert to ASCII
    add al, '0'
    mov ah, 0Eh
    mov bh, 0
    mov bl, 0x0F
    int 10h

    mov ah, 0Eh
    mov al, '='
    mov bh, 0
    mov bl, 0x0F
    int 10h

    ; Print X
    mov ah, 0Eh
    mov al, 'X'
    mov bh, 0
    mov bl, 0x0F
    int 10h

    ret

rand_num db 0
user_num db 0
