; --- BASE-INDEXED ADDRESSING ---
; Like traditional array indexing: array[i]
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

    ; Initialize registers
    mov ax, 0                  ; Clear accumulator to hold the running total
    
    mov bx, offset num1        ; BX holds the constant BASE address (start of array)
    mov si, 0                  ; SI holds the variable INDEX offset (starts at 0)
    
outerloop: 
    ; --- BASE-INDEXED ADDRESSING ---
    ; The CPU calculates the physical address dynamically: (Base BX) + (Index SI)
     add ax, [bx + si]    ;option 1      
    ;add ax, [num1 + si]          ;option 2
    
    add si, 2                  ; Advance our index by 2 bytes (words are 2 bytes wide)

    cmp si, 6                     
    jne outerloop              ; Repeat if CX is not zero
    
    mov result, ax             ; Store final sum (30 / 1Eh)
    
    ; Exit program smoothly to DOS
    mov ax, 4c00h
    int 21h

end start
