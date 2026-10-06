.model small
.stack 100h

.data
sum dw 0            ; int sum; (uninitialized/set to 0 initially)

.code
start:
    ; 1. Initialize the Data Segment (Setting up memory environment)
    mov ax, @data
    mov ds, ax

    ; 2. Perform the math operation: sum = 5 + 10 + 15;
    mov ax, 5       ; Load 5 into AX
    add ax, 10      ; Add 10 to AX (AX becomes 15)
    add ax, 15      ; Add 15 to AX (AX becomes 30 / 1Eh in hex)

    ; 3. Store the calculation back into the 'sum' memory variable
    mov sum, ax     

    ; 4. Return 0 and exit (Equivalent to 'return 0;')
    mov ax, 4c00h   ; 4C means exit, 00 is the return code (0)
    int 21h

end start
