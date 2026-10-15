.model small
.stack 100h

.data
    result dw 0
    numbers dw 1,2,3,4,5

.code
    mov ax, @data
    mov ds, ax
    
    mov cx, 5
    mov bx, offset numbers 
    mov si, 0
    mov ax, 0
    ; xor ax, ax 
    
    
    myLoop:
        add ax, [bx + si]
        add si, 2
         
    
        ;sub cx, 1
        dec cx   
        ;cmp si, 10
        jnz myLoop 
        ;loop myLoop
    
    
    mov ah, 4ch
    mov al, 00h
    int 21h    
    
    
     
    
    
    
    
    