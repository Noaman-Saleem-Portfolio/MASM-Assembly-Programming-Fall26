; a program to add three numbers using memory variables
.model small
.stack 100h

.data
num1 dw 5 
num2 dw 10
num3 dw 15
num4 dw 0

.code
start:
    ; 1. Initialize data segment
    mov ax, @data
    mov ds, ax

    ; 2. Add the numbers using registers
    mov ax, num1            ; load first number in ax (brackets are optional)
    ; mov num1, num2        ; illegal (memory-to-memory is not allowed)
    
    mov bx, num2
    add ax, bx
    
    mov bx, num3
    add ax, bx
    
    ; 3. Save the result back to memory
    mov num4, ax
    
    ; 4. Exit to DOS safely
    mov ax, 4c00h
    int 21h

end start
