.model small
.stack 100h

.data
    newLine db 13, 10, '$'

.code
start:
    ; Initialize the Data Segment so the CPU can find the newLine string
    mov ax, @data
    mov ds, ax

    mov bx, 1             ; BX tracks current row number / stars to print (1 to 8)

outerLoop:
    ; 1. SET UP INNER LOOP COUNTER ---
    mov cx, bx            ; Set inner loop to run 'BX' times
    mov ah, 02h           ; DOS print character function
    mov dl, bl            ; Load the current row number into DL
    
    add dl, '0'           ; Converting number to its ASCII code

innerLoop:
    int 21h               ; Print the current number
    dec cx                ; Decrement CX
    jnz innerLoop         ; repeat until CX == 0

    ; 2. PRINT A NEWLINE (CRLF) AFTER THE ROW ---
    mov ah, 09h
    mov dx, offset newLine; FIXED: Added offset to load the 16-bit address into DX      
    int 21h

    ; 3. OUTER LOOP CONTROL ---
    inc bx                ; Move to next row (increase number count)
    cmp bx, 9             ; Check if we have finished row 8 (BX becomes 9)
    jne outerLoop         ; If not 9, start the next row

    ; CLEAN EXIT ---
    mov ax, 4c00h
    int 21h

end start
