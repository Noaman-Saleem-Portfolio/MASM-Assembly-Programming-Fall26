.model small
.stack 100h

.code
start:
    ; 1. Setup the character printing parameters
    mov ah, 02h     ; DOS function 02h: Display character
    mov dl, 'A'     ; The character to display
    int 21h         ; Call DOS service interrupt

    ; 2. Terminate the program cleanly
    mov ah, 4Ch     ; DOS function 4Ch: Terminate process
    int 21h         ; Call DOS service interrupt

end start
