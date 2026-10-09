.model small
.stack 100h

.code
start:

    
    mov ax, 17       ; 1st: Load the total dividend into AX (0011h)
    mov bl, 5        ; 2nd: Load the divisor into an 8-bit register

    div bl           ; 3rd: Perform AX / BL

    ; --- RESULTS AFTER THIS LINE ---
    ; AL now automatically equals 3 (Quotient)
    ; AH now automatically equals 2 (Remainder)

    mov ax, 4c00h
    int 21h

end start
