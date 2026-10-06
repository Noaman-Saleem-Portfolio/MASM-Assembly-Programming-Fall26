.model small
.stack 100h

.code
start:
    ; --- 1. SET UP THE NUMBER TO PRINT ---
    mov ax, 258         ; The number we want to print
    mov bx, 10          ; Divisor

    ; --- 2. EXTRACTION (MANUAL STEP-BY-STEP) ---

    ; Step A: Get the 1st digit ('8')
    xor dx, dx          ; Clear DX before division
    div bx              ; AX = 25, DX = 8
    add dl, '0'         ; Convert 8 to ASCII '8'
    push dx             ; Save '8' onto the stack

    ; Step B: Get the 2nd digit ('5')
    xor dx, dx          ; Clear DX before division
    div bx              ; AX = 2, DX = 5
    add dl, '0'         ; Convert 5 to ASCII '5'
    push dx             ; Save '5' onto the stack

    ; Step C: Get the 3rd digit ('2')
    xor dx, dx          ; Clear DX before division
    div bx              ; AX = 0, DX = 2
    add dl, '0'         ; Convert 2 to ASCII '2'
    push dx             ; Save '2' onto the stack

    ; --- 3. PRINTING (MANUAL STEP-BY-STEP) ---
    mov ah, 02h         ; DOS Service 02h: Print Character

    ; Print the 3rd digit ('2')
    pop dx              ; Pulls '2' from the top of the stack
    int 21h             ; Prints '2'

    ; Print the 2nd digit ('5')
    pop dx              ; Pulls '5' from the stack
    int 21h             ; Prints '5'

    ; Print the 1st digit ('8')
    pop dx              ; Pulls '8' from the stack
    int 21h             ; Prints '8'

    ; --- 4. CLEAN EXIT ---
    mov ax, 4c00h
    int 21h

end start
