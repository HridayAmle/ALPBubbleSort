MYDATA SEGMENT
    ARRAY DB 5, 3, 8, 6, 2  ; Array of integers to be sorted
    LEN DW 5              ; Length of the array
    MSG1 DB 'Sorted array: $' ; Message to display before printing array
MYDATA ENDS

MYCODE SEGMENT
ASSUME CS:MYCODE, DS:MYDATA

START:
    ; Initialize data segment
    MOV AX, MYDATA
    MOV DS, AX

    ; Bubble Sort Algorithm
    MOV CX, LEN           ; Outer loop counter (number of passes)
OUTER_LOOP:
    DEC CX                   ; Decrement counter
    MOV SI, 0               ; Initialize index for inner loop
    MOV DI, LEN          ; Load length of array for inner loop

INNER_LOOP:
    MOV AL, ARRAY[SI]       ; Load current element
    MOV BL, ARRAY[SI + 1]   ; Load next element
    CMP AL, BL              ; Compare elements
    JBE NO_SWAP             ; If AL <= BL, no swap needed

    ; Swap elements
    MOV ARRAY[SI], BL       ; Move larger element to current position
    MOV ARRAY[SI + 1], AL   ; Move smaller element to next position

NO_SWAP:
    INC SI                  ; Move to the next index
    DEC DI                  ; Decrement inner loop counter
    JNZ INNER_LOOP          ; Repeat inner loop if not done

    INC CX                  ; Increment outer loop counter
    CMP CX, LEN          ; Check if we need to repeat outer loop
    JNZ OUTER_LOOP          ; Repeat if not done

    ; Print message before printing array
    MOV AH, 09h             ; Function to print string
    MOV DX, OFFSET MSG1     ; Address of message
    INT 21h                 ; Print message

    ; Print sorted array
    MOV CX, LEN          ; Counter for printing array
    MOV SI, OFFSET ARRAY    ; Address of array
PRINT_LOOP:
    MOV DL, [SI]            ; Load element to print
    ADD DL, 30h             ; Convert to ASCII
    MOV AH, 02h             ; Function to print character
    INT 21h                 ; Print character
    INC SI                  ; Move to next element
    LOOP PRINT_LOOP         ; Repeat loop until all elements printed

    ; Newline
    MOV DL, 0Dh             ; Carriage return
    MOV AH, 02h             ; Function to print character
    INT 21h                 ; Print character
    MOV DL, 0Ah             ; Line feed
    MOV AH, 02h             ; Function to print character
    INT 21h                 ; Print character

    ; Program finished, halt
    MOV AX, 4C00h           ; Terminate program
    INT 21h                 ; DOS interrupt

MYCODE ENDS
END START