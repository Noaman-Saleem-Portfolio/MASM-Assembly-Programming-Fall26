.model small
.stack 100h

.data
    myArray   dw 5, 7, 2, 4, 8, 3, 6          ; Array of 7 separate word values
    arraySize equ ($ - myArray) / 2           ; Dynamically calculate the number of elements

.code
start:
    ; Initialize the Data Segment so the CPU can find our data variables
    mov ax, @data
    mov ds, ax

    mov si, offset myArray  ; Point SI pointer register to array memory address
    mov cx, arraySize       ; Load the dynamically calculated loop counter

arrayLoop:
    mov dl, [si]            ; Dereference pointer: load array word value to DL
    add dl, '0'             ; Convert value to ASCII
    mov ah, 02h
    int 21h                 ; Print character

    ; PRINT SPACE ---
    mov dl, ' '
    int 21h

    add si, 2               ; Move pointer by 2 bytes (since array elements are 'dw')
    loop arrayLoop

    ; CLEAN EXIT ---
    mov ax, 4c00h
    int 21h

end start
