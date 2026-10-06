.model small
.stack 100h

.data
    star db '*'

.code
start:
    ; Initialize the Data Segment so the CPU can access the star variable
    mov ax, @data
    mov ds, ax

    mov cx, 5

printLoop:
    mov ah, 02h
    mov dl, star        ; Load the character '*' from memory (brackets are optional)
    int 21h

    sub cx, 1           ; Decrement counter by 1
    jnz printLoop       ; Jump back if CX is not zero

    ; CLEAN EXIT ---
    mov ax, 4c00h
    int 21h

end start
