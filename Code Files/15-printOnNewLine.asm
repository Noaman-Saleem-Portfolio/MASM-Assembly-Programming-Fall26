.model small
.stack 100h

.data
msg1    db 'Hello World.$'
newline db 13, 10, '$'      ; Dedicated newline string
msg2    db 'kesy ho dost.$'

.code
start:
    mov ax, @data
    mov ds, ax

    ; Print first message
    mov dx, offset msg1
    mov ah, 09h
    int 21h

    ; Print newline
    mov dx, offset newline
    mov ah, 09h
    int 21h

    ; Print second message
    mov dx, offset msg2
    mov ah, 09h
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h

end start
