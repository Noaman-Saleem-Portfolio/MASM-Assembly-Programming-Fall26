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
    mov bx, 10      ; Load 10 to BX (BX becomes 15) 
    add ax, bx
    
    mov bx, 15      
    add ax, bx

    ; 3. Store the calculation back into the 'sum' memory variable
    mov sum, ax     

    ; 4. Return 0 and exit (Equivalent to 'return 0;')
    mov ax, 4c00h   ; 4C means exit, 00 is the return code (0)
    int 21h

end start
