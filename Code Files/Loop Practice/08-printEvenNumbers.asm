.model small
.stack 100h

.code
start:

    
    mov cx, 5             ; Loop 5 times
    mov bx, 0             ; bx starts at 0

printLoop:
    ; 1. PRINT CURRENT EVEN NUMBER ---
    mov ah, 02h
    mov dl, bl            ; Copy current value (0, 2, 4, 6, 8)
    add dl, '0'           ; Convert to ASCII character code
    int 21h
   
    ; 2. UPDATE VALUE FOR NEXT ITERATION ---
    add bx, 2             ; Increment by 2 AFTER printing (0 becomes 2, etc.)

    ; 3. LOOP CONTROL ---
    dec cx                ; CX = CX - 1
    jnz printLoop         ; Jump if CX is not zero
   
; CLEAN EXIT ---
    mov ax, 4c00h
    int 21h

end start
