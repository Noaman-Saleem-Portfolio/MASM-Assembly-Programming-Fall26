; a program to add three numbers accessed using a array
.model small
.stack 100h

.data
; This defines an array of 4 words under a single label name
num1 dw 5, 10, 15, 0    

.code
start:
    ; 1. Initialize the Data Segment
    mov ax, @data
    mov ds, ax

    ; 2. Add the numbers using compile-time arithmetic offsets
    mov ax, num1            ; load first number (5) into ax
    
    mov bx, [num1 + 2]      ; notice how we can do arithmetic here 
    add ax, bx              ; also, why +2 and not +1? (Because each 'dw' takes 2 bytes!)
    
    mov bx, [num1 + 4]
    add ax, bx
    
    ; 3. Store the final sum (30 / 1Eh) into the 4th slot of the array
    mov [num1 + 6], ax      ; store sum at num1+6
    
    ; 4. Exit to DOS safely
    mov ax, 4c00h
    int 21h

end start
