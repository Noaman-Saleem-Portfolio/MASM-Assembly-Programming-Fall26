.model small
.stack 100h

.data
message db 'Hello World.$'

.code
start:
    ; 1. Initialize the data segment so the CPU can locate the variable
    mov ax, @data
    mov ds, ax

    ; 2. Load the address offset of our string into DX
    mov dx, offset message   
    
    ; 3. Use DOS function 09h to print the string to the console
    mov ah, 09h
    int 21h

    ; 4. Terminate the program and return control to DOS
    mov ah, 4Ch
    int 21h

end start
