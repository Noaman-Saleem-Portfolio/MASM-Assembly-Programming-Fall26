.model small
.stack 100h

.code
start:

    
    mov cx, 5             ; Loop 5 times
    mov bx, 1             ; Number to add (1, 2, 3, 4, 5)
    mov ax, 0             ; AX will be our Accumulator (sum = 0)

sumLoop:
    add ax, bx            ; sum = sum + bx
    inc bx                ; Move to next number
    
    dec cx                ; Decrement loop counter
    jnz sumLoop           ; Jump back if CX is not zero

    ; AX now holds 15 (0Fh). To print multi-digit numbers,
    ; we convert it. For a quick check in the emu8086 register grid, look at AX.

    ;========================================================
    ; AX now holds 15 (0Fh). To print multi-digit numbers,
    ;========================================================
    ; --- 1. SET UP THE NUMBER TO PRINT ---
    ; The number we want to print (can be any 16-bit unsigned number: 0 to 65535)
    mov bx, 10          ; Divisor
    mov cx, 0           ; Initialize digit counter (acts as our dynamic loop bound)

    ; --- 2. DYNAMIC EXTRACTION LOOP (While AX != 0) ---
extractionLoop:
    xor dx, dx          ; Clear DX before division
    div bx              ; AX = Quotient, DX = Remainder (the digit)
    add dl, '0'         ; Convert raw digit to its ASCII character
    push dx             ; Save ASCII character onto the stack
    inc cx              ; Increment our dynamic digit counter (digit_count++)

    cmp ax, 0           ; Check if the quotient has reached 0
    jne extractionLoop  ; If AX != 0, there are still digits left to extract



    ; --- 3. DYNAMIC PRINTING LOOP (For j = 0; j < digit_count; j++) ---
    mov ah, 02h         ; DOS Service 02h: Print Character
    mov si, 0           ; Initialize our printing loop counter (j = 0)

printingLoop:
    pop dx              ; Pull the top ASCII character from the stack into DX (DL)
    int 21h             ; Print it

    inc si              ; j++
    cmp si, cx          ; Compare current index (j) with the dynamic digit count (digit_count)
    jl printingLoop     ; If j < digit_count, continue printing


   
; CLEAN EXIT ---
    mov ax, 4c00h
    int 21h

end start
