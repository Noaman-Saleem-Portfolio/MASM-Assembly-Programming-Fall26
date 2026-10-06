.model small
.stack 100h

.data
    myArray db 5, 7, 2, 4   ; Array of 4 separate byte values

.code
start:
    ; Initialize the Data Segment so the CPU can find myArray
    mov ax, @data
    mov ds, ax

    mov si, offset myArray  ; Point SI pointer register to array memory address
    mov cx, 4               ; Loop counter: 4 elements total

arrayLoop:
    mov dl, [si]            ; Dereference pointer: load array byte value to DL
    add dl, '0'             ; Convert value to ASCII
    mov ah, 02h
    int 21h                 ; Print character

    ; PRINT SPACE ---
    mov dl, ' '
    int 21h

    inc si                  ; Move pointer by 1 byte (since array elements are 'db')
    loop arrayLoop

    ; CLEAN EXIT ---
    mov ax, 4c00h
    int 21h

end start
