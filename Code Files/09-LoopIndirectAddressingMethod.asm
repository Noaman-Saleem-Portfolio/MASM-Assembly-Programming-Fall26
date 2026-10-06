; Register Indirect Addressing Method
; Like using raw pointer incrementation: *ptr++
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

    ; Initialize stuff 
    mov ax, 0                  ; reset the accumulator 
    mov cx, 3                  ; set the iterator count 
    mov bx, offset num1        ; set the base address pointer to BX
    
outerloop: 
    add ax, [bx]               ; Add the number pointed to by BX into AX
    add bx, 2                  ; Advance pointer by 2 bytes (since it's a word array)

    sub cx, 1                  ; Decrement counter by 1
    ;dec cx
    jnz outerloop              ; Jump if Not Zero (checks the Zero Flag)
    
    mov result, ax             ; Store final sum (30 / 1Eh) into result variable
    
    ; Exit program smoothly to DOS
    mov ax, 4c00h
    int 21h

end start
