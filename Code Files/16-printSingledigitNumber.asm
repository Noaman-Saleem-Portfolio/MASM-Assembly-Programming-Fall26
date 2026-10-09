; print numbers 0 - 9
.model small
.stack 100h

.code
start:

    
    ; 1. Setup the number printing parameters
    mov ah, 02h     ; DOS function 02h: Display character
    ; mov dl, '7'     ; The character to display
    mov dl, 7     ; The character to display
    add dl, 30h
    ; add dl, '0'
    int 21h         ; Call DOS service interrupt

    ; 2. Terminate the program cleanly
    mov ah, 4Ch     ; DOS function 4Ch: Terminate process
    int 21h         ; Call DOS service interrupt

end start
