.model small
.stack 100h

.code
start:

    
    ; --- 1st: Load the combined 32-bit dividend (70,000) ---
    mov dx, 0001h    ; DX gets the upper bits of 70,000
    mov ax, 1170h    ; AX gets the lower bits of 70,000

    ; --- 2nd: Load the 16-bit divisor ---
    mov bx, 10       ; BX is our 16-bit divisor

    ; --- 3rd: Execute the division ---
    div bx           ; Calculates DX:AX divided by BX

    ; --- RESULTS AFTER THIS LINE ---
    ; AX now automatically equals 7000 (1B58h) -> The Quotient
    ; DX now automatically equals 0            -> The Remainder

    mov ax, 4c00h
    int 21h

end start
