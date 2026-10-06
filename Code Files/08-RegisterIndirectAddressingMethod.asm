; a program to add three numbers 
; Register Indirect Addressing Method
.model small
.stack 100h

.data
num1   dw 5, 10, 15
result dw 0

.code
start:
    ; Initialize the Data Segment
    mov ax, @data
    mov ds, ax

    

    mov bx, offset num1         ; Load the starting pointer address of the array into BX

    xor ax, ax                  
    ; This will set ax to zero Why? Think
    ; check effect on ZF (Clears AX to 0, sets ZF = 1)
    add ax, [bx]                ; Add 1st element (5) via pointer
    ; Brackets are strictly mandatory here
    ;  This ensures the CPU "dereferences" the address inside BX 
    ;to grab the array data rather than address
    
    add bx, 2                   ; Move pointer forward by 2 bytes (words take 2 bytes)
     
    add ax, [bx]                ; Add 2nd element (10) via pointer
    add bx, 2

    add ax, [bx]                ; Add 3rd element (15) via pointer
    add bx, 2

    mov result, ax              ; Save the final sum (30 / 1Eh) into memory
    
    ; Exit program smoothly to DOS
    mov ax, 4c00h
    int 21h

end start
