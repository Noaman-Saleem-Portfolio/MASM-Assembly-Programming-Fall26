; a program to add three numbers accessed using a array

.model small
.stack 100h

.data
; This defines an array of 4 words under a single label name
num1 db 5, 10, 15    
result db 0

.code
start:
    ; 1. Initialize the Data Segment
    mov ax, @data
    mov ds, ax

    ; 2. Add the numbers using compile-time arithmetic offsets
    mov al, num1            ; load first number (5) into ax
    
    
    mov bl, [num1 + 1]      ; notice how we can do arithmetic here 
    add al, bl              ; also, why +2 and not +1? (Because each 'dw' takes 2 bytes!)
    
    mov bl, [num1 + 2]
    add al, bl
    
    ; 3. Store the final sum (30 / 1Eh) into the result
    mov result, al      ; store sum at num1+6
    
    ; 4. Exit to DOS safely
    mov ax, 4c00h
    int 21h

end start
