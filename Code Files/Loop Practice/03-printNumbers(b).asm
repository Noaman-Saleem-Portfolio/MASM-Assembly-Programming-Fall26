.model small
.stack 100h

.data
    newLine db 13, 10, '$'

.code
start:
    ; Initialize the Data Segment so the CPU can find the newLine string
    mov ax, @data
    mov ds, ax

    mov cx, 1             ; Initialize loop counter/number to print

printLoop:
    ; 1. CONVERT NUMBER TO ASCII ---
    mov dl, cl            ; Copy the current count (1, 2, 3, 4, 5) to DL
    add dl, '0'           ; Convert raw number to its ASCII character value
   
    ; 2. PRINT THE NUMBER ---
    mov ah, 02h           ; DOS function to print character in DL
    int 21h

    ; 3. PRINT A NEWLINE (CRLF) ---
    mov ah, 09h
    mov dx, offset newLine; FIXED: Load string address into DX instead of DL          
    int 21h

    ; 4. LOOP CONTROL ---
    inc cx                ; Increment our number/counter
    cmp cx, 6             ; Check if we have reached 6
    jne printLoop         ; If CX is not 6, repeat the loop

    ; CLEAN EXIT ---
    mov ax, 4c00h
    int 21h

end start
